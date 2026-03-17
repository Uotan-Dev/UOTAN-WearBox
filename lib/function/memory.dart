import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

class MemoryCleanPage extends StatefulWidget {
  const MemoryCleanPage({super.key});

  @override
  State<MemoryCleanPage> createState() => _MemoryCleanPageState();
}

class _MemoryCleanPageState extends State<MemoryCleanPage> {
  final TextEditingController _packageController = TextEditingController();

  Map<String, int> _memInfo = <String, int>{};
  int _storageUsedKb = 0;
  int _storageTotalKb = 0;

  bool _isBusy = false;
  Timer? _autoRefreshTimer;

  @override
  void initState() {
    super.initState();
    _refreshMemoryInfo(silent: true);
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted || _isBusy) {
        return;
      }
      _refreshMemoryInfo(silent: true);
    });
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    _packageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: !_isBusy,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
              onPanStart: (_) => windowManager.startDragging(),
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 20),
                      onPressed: _isBusy ? null : () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      l10n.featureMemoryClean,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontFamily: 'MiSansLight',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 280,
                child: _buildUsageCard(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildMemoryInfoCard(),
                    const SizedBox(height: 12),
                    Expanded(child: _buildActionCard()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsageCard() {
    final int total = _memInfo['MemTotal'] ?? 0;
    final int available = _memInfo['MemAvailable'] ?? 0;
    final int used = total > 0 ? (total - available) : 0;

    final double memoryUsedPercent =
        total > 0 ? (used / total).clamp(0.0, 1.0).toDouble() : 0.0;
    final double storageUsedPercent = _storageTotalKb > 0
        ? (_storageUsedKb / _storageTotalKb).clamp(0.0, 1.0).toDouble()
        : 0.0;

    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _buildUsageRing(
                        progress: storageUsedPercent,
                        color: const Color.fromARGB(255, 30, 93, 229),
                        percentText: '${(storageUsedPercent * 100).round()}%',
                        usageText:
                            _formatRatioGb(_storageUsedKb, _storageTotalKb),
                      ),
                      const SizedBox(height: 40),
                      _buildUsageRing(
                        progress: memoryUsedPercent,
                        color: const Color(0xFF36C2CF),
                        percentText: '${(memoryUsedPercent * 100).round()}%',
                        usageText: _formatRatioGb(used, total),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemoryInfoCard() {
    final int total = _memInfo['MemTotal'] ?? 0;
    final int free = _memInfo['MemFree'] ?? 0;
    final int available = _memInfo['MemAvailable'] ?? 0;
    final int cached = _memInfo['Cached'] ?? 0;
    final int used = total > 0 ? (total - available) : 0;
    final double memoryUsedPercent =
        total > 0 ? (used / total).clamp(0.0, 1.0).toDouble() : 0.0;

    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '内存状态',
              style: TextStyle(fontSize: 20, fontFamily: 'MiSansLight'),
            ),
            const SizedBox(height: 14),
            LinearProgressIndicator(
              value: memoryUsedPercent,
              color: const Color.fromARGB(255, 80, 80, 80),
              backgroundColor: const Color(0xFFE3E3E3),
              minHeight: 10,
              borderRadius: BorderRadius.circular(999),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('总内存', _formatKb(total)),
            _buildInfoRow('已使用', _formatKb(used)),
            _buildInfoRow('可用内存', _formatKb(available)),
            _buildInfoRow('空闲内存', _formatKb(free)),
            _buildInfoRow('缓存', _formatKb(cached)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard() {
    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '清理操作',
              style: TextStyle(fontSize: 20, fontFamily: 'MiSansLight'),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: <Widget>[
                _buildActionButton(
                  text: '一键清理后台',
                  onTap: _killBackgroundProcesses,
                ),
                _buildActionButton(
                  text: '清理应用缓存',
                  onTap: _trimCaches,
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text('自定义清理包名', style: TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextField(
                controller: _packageController,
                enabled: !_isBusy,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: '例如: com.google.android.gms',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            _buildActionButton(
              text: '强制停止该应用',
              onTap: _forceStopPackage,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label, style: const TextStyle(fontSize: 15)),
          Text(value, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color.fromARGB(255, 237, 237, 237),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.0),
        onTap: _isBusy ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildUsageRing({
    required double progress,
    required Color color,
    required String percentText,
    required String usageText,
  }) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 160,
          height: 160,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: 160,
                height: 160,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 12,
                  strokeCap: StrokeCap.round,
                  backgroundColor: const Color(0xFFE7E7E7),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Text(
                percentText,
                style: const TextStyle(fontSize: 42, color: Colors.black87),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Text(
          usageText,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }

  Future<void> _refreshMemoryInfo({bool silent = false}) async {
    if (!await _ensureDeviceConnected(showDialog: !silent)) {
      return;
    }

    final ProcessResult? memResult = await _runAdbCommand(
      <String>['shell', 'cat', '/proc/meminfo'],
      showErrorDialog: !silent,
    );
    if (memResult == null || memResult.exitCode != 0) {
      return;
    }

    final String output = memResult.stdout.toString();
    final RegExp regex = RegExp(r'^([A-Za-z_()]+):\s+(\d+)\s+kB$');
    final Map<String, int> parsed = <String, int>{};
    for (final String rawLine in output.split('\n')) {
      final String line = rawLine.trim();
      final RegExpMatch? match = regex.firstMatch(line);
      if (match == null) {
        continue;
      }
      parsed[match.group(1)!] = int.parse(match.group(2)!);
    }

    final List<int> storageInfo = await _fetchStorageInfo(silent: silent);

    if (!mounted) {
      return;
    }
    setState(() {
      _memInfo = parsed;
      _storageUsedKb = storageInfo[0];
      _storageTotalKb = storageInfo[1];
    });
  }

  Future<List<int>> _fetchStorageInfo({required bool silent}) async {
    final List<List<String>> commands = <List<String>>[
      <String>['shell', 'df', '-k', '/data'],
      <String>['shell', 'df', '-k', '/storage/emulated'],
      <String>['shell', 'df', '-k'],
    ];

    for (final List<String> command in commands) {
      final ProcessResult? result = await _runAdbCommand(
        command,
        showErrorDialog: !silent,
      );
      if (result == null || result.exitCode != 0) {
        continue;
      }
      final List<int> parsed = _parseStorageKbFromDf(result.stdout.toString());
      if (parsed[1] > 0) {
        return parsed;
      }
    }
    return const <int>[0, 0];
  }

  List<int> _parseStorageKbFromDf(String output) {
    final List<String> lines = output
        .split('\n')
        .map((String line) => line.trim())
        .where((String line) => line.isNotEmpty)
        .toList();

    List<String> candidates = lines
        .where((String line) =>
            !line.toLowerCase().startsWith('filesystem') &&
            (line.contains('/data') || line.contains('/storage/emulated')))
        .toList();
    if (candidates.isEmpty) {
      candidates = lines
          .where((String line) => !line.toLowerCase().startsWith('filesystem'))
          .toList();
    }

    for (final String line in candidates) {
      final List<String> parts =
          line.split(RegExp(r'\s+')).where((String s) => s.isNotEmpty).toList();
      if (parts.length < 4) {
        continue;
      }

      final int? total = int.tryParse(parts[1]);
      final int? used = int.tryParse(parts[2]);
      if (total != null && used != null && total > 0) {
        return <int>[used, total];
      }
    }
    return const <int>[0, 0];
  }

  Future<void> _killBackgroundProcesses() async {
    await _runAdbCommand(
      <String>['shell', 'am', 'kill-all'],
      successMessage: '后台进程清理完成。',
    );
    await _refreshMemoryInfo(silent: true);
  }

  Future<void> _trimCaches() async {
    await _runAdbCommand(
      <String>['shell', 'pm', 'trim-caches', '128G'],
      successMessage: '缓存清理命令已执行。',
    );
    await _refreshMemoryInfo(silent: true);
  }

  Future<void> _forceStopPackage() async {
    final String packageName = _packageController.text.trim();
    if (packageName.isEmpty) {
      _showErrorDialog('请输入包名。');
      return;
    }
    await _runAdbCommand(
      <String>['shell', 'am', 'force-stop', packageName],
      successMessage: '已尝试停止: $packageName',
    );
    await _refreshMemoryInfo(silent: true);
  }

  Future<ProcessResult?> _runAdbCommand(
    List<String> args, {
    String? successMessage,
    bool showErrorDialog = true,
  }) async {
    if (_isBusy) {
      return null;
    }
    if (!await _ensureDeviceConnected(showDialog: showErrorDialog)) {
      return null;
    }

    setState(() {
      _isBusy = true;
    });

    try {
      final ProcessResult result = await Process.run('adb', args);
      final String stderr = result.stderr.toString().trim();

      if (result.exitCode == 0) {
        if (successMessage != null) {
          _showInfoDialog(successMessage);
        }
      } else if (showErrorDialog) {
        _showErrorDialog(
          stderr.isNotEmpty ? '执行失败: $stderr' : '执行失败，退出码: ${result.exitCode}',
        );
      }
      return result;
    } catch (e) {
      if (showErrorDialog) {
        _showErrorDialog('无法执行 ADB 命令: $e');
      }
      return null;
    } finally {
      if (mounted) {
        setState(() {
          _isBusy = false;
        });
      }
    }
  }

  Future<bool> _ensureDeviceConnected({bool showDialog = true}) async {
    try {
      final ProcessResult result =
          await Process.run('adb', <String>['devices']);
      final List<String> lines = result.stdout
          .toString()
          .split('\n')
          .map((String line) => line.trim())
          .where((String line) => line.isNotEmpty)
          .toList();
      final bool connected = lines.skip(1).any(
            (String line) => line.contains('\tdevice'),
          );
      if (!mounted) {
        return false;
      }
      if (!connected && showDialog) {
        _showErrorDialog(context.l10n.buttonDeviceNotConnectedMessage);
      }
      return connected;
    } catch (e) {
      if (showDialog) {
        _showErrorDialog('无法检查设备连接状态: $e');
      }
      return false;
    }
  }

  String _formatKb(int kb) {
    if (kb <= 0) {
      return '-';
    }
    const double mb = 1024;
    const double gb = 1024 * 1024;
    if (kb >= gb) {
      return '${(kb / gb).toStringAsFixed(2)} GB';
    }
    return '${(kb / mb).toStringAsFixed(1)} MB';
  }

  String _formatRatioGb(int usedKb, int totalKb) {
    if (usedKb <= 0 || totalKb <= 0) {
      return '-';
    }
    const double kbPerGb = 1024 * 1024;
    final double usedGb = usedKb / kbPerGb;
    final double totalGb = totalKb / kbPerGb;
    return '${usedGb.toStringAsFixed(2)}GB/${totalGb.toStringAsFixed(2)}GB';
  }

  void _showErrorDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: Text(l10n.commonErrorTitle),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed) ||
                        states.contains(WidgetState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237);
                    }
                    return null;
                  },
                ),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }

  void _showInfoDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: Text(l10n.commonNoticeTitle),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed) ||
                        states.contains(WidgetState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237);
                    }
                    return null;
                  },
                ),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }
}
