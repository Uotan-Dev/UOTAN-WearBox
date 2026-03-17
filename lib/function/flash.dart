import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class FlashToolPage extends StatefulWidget {
  const FlashToolPage({super.key});

  @override
  State<FlashToolPage> createState() => _FlashToolPageState();
}

class _FlashToolPageState extends State<FlashToolPage> {
  static const List<String> _leftPresetPartitions = <String>[
    'system',
    'product',
    'vendor',
    'boot',
  ];

  static const List<String> _rightPresetPartitions = <String>[
    'system_ext',
    'odm',
    'vendor_boot',
    'init_boot',
  ];

  final Map<String, TextEditingController> _presetPathControllers =
      <String, TextEditingController>{};
  final TextEditingController _customPathController = TextEditingController();
  final TextEditingController _customPartitionController =
      TextEditingController();
  final ScrollController _logScrollController = ScrollController();

  bool _isBusy = false;
  final List<String> _logs = <String>[];

  @override
  void initState() {
    super.initState();
    for (final String partition in <String>[
      ..._leftPresetPartitions,
      ..._rightPresetPartitions
    ]) {
      _presetPathControllers[partition] = TextEditingController();
    }
    _addLog('Uotan Wearbox Flash Tool ready.');
  }

  @override
  void dispose() {
    for (final TextEditingController controller
        in _presetPathControllers.values) {
      controller.dispose();
    }
    _customPathController.dispose();
    _customPartitionController.dispose();
    _logScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !_isBusy,
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
                    const Text(
                      '刷机工具',
                      style: TextStyle(
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
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _buildPresetSection(),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 230,
                        child: _buildLogSection(),
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

  Widget _buildPresetSection() {
    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth < 760) {
                  return Column(
                    children: <Widget>[
                      ..._leftPresetPartitions
                          .map((String p) => _buildPartitionRow(p)),
                      ..._rightPresetPartitions
                          .map((String p) => _buildPartitionRow(p)),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: _leftPresetPartitions
                            .map((String p) => _buildPartitionRow(p))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: Column(
                        children: _rightPresetPartitions
                            .map((String p) => _buildPartitionRow(p))
                            .toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 94,
                  child: Text(
                    '自定义分区',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  child: _buildPathField(
                    _customPathController,
                    hint: '',
                  ),
                ),
                const SizedBox(width: 8),
                _buildActionButton(
                  text: '文件',
                  onTap: () => _pickImageForController(_customPathController),
                ),
                const SizedBox(width: 10),
                const Text('刷入至', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                SizedBox(
                  width: 180,
                  child: _buildPathField(
                    _customPartitionController,
                    hint: '',
                  ),
                ),
                const SizedBox(width: 4),
                _buildActionButton(
                  text: '刷入',
                  onTap: _flashCustomPartition,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartitionRow(String partition) {
    final TextEditingController controller = _presetPathControllers[partition]!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 94,
            child: Text(
              _formatPartitionLabel(partition),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: _buildPathField(controller, hint: ''),
          ),
          const SizedBox(width: 8),
          _buildActionButton(
            text: '文件',
            onTap: () => _pickImageForController(controller),
          ),
          const SizedBox(width: 4),
          _buildActionButton(
            text: '刷入',
            onTap: () => _flashPartition(partition, controller.text),
          ),
        ],
      ),
    );
  }

  Widget _buildLogSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Card(
          color: const Color(0xFFF9F9F9),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '日志输出',
                  style: TextStyle(fontSize: 20, fontFamily: 'MiSansLight'),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFDCDCDC)),
                    ),
                    child: SingleChildScrollView(
                      controller: _logScrollController,
                      child: SelectableText(
                        _logs.isEmpty ? '暂无日志' : _logs.join('\n'),
                        style: const TextStyle(
                          fontFamily: 'Consolas',
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        const SizedBox(width: 12),
        SizedBox(
          width: 220,
          child: Card(
            color: const Color(0xFFF9F9F9),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    '快捷操作',
                    style: TextStyle(fontSize: 20, fontFamily: 'MiSansLight'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: _buildActionButton(
                      text: '禁用vbmeta',
                      onTap: _disableVbmeta,
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    width: double.infinity,
                    child: _buildActionButton(
                      text: '切换槽位',
                      onTap: _switchActiveSlot,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPathField(
    TextEditingController controller, {
    required String hint,
  }) {
    return TextField(
      controller: controller,
      enabled: !_isBusy,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
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
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return Opacity(
      opacity: _isBusy ? 0.6 : 1,
      child: Card(
        color: const Color.fromARGB(255, 237, 237, 237),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          onTap: _isBusy ? null : onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageForController(TextEditingController controller) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['img', 'bin'],
    );
    final String? path = result?.files.single.path;
    if (path == null || path.isEmpty) {
      return;
    }
    setState(() {
      controller.text = path;
    });
    _addLog('Selected file: $path');
  }

  Future<void> _flashPartition(String partition, String imagePath) async {
    final String trimmedPath = imagePath.trim();
    if (trimmedPath.isEmpty) {
      _showErrorDialog('请先选择镜像文件。');
      return;
    }
    await _runFastbootCommand(
      <String>['flash', partition, trimmedPath],
      actionLabel: 'flash $partition',
    );
  }

  Future<void> _flashCustomPartition() async {
    final String path = _customPathController.text.trim();
    final String partition = _customPartitionController.text.trim();
    if (path.isEmpty) {
      _showErrorDialog('请先选择镜像文件。');
      return;
    }
    if (partition.isEmpty) {
      _showErrorDialog('请输入分区名。');
      return;
    }
    await _flashPartition(partition, path);
  }

  Future<void> _disableVbmeta() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['img', 'bin'],
      dialogTitle: '选择 vbmeta 镜像文件',
    );
    final String? path = result?.files.single.path;
    if (path == null || path.isEmpty) {
      return;
    }
    _addLog('Selected vbmeta image: $path');
    await _runFastbootCommand(
      <String>[
        '--disable-verity',
        '--disable-verification',
        'flash',
        'vbmeta',
        path,
      ],
      actionLabel: 'disable vbmeta',
    );
  }

  Future<void> _switchActiveSlot() async {
    if (!await _ensureFastbootDeviceReady()) {
      return;
    }

    try {
      final ProcessResult result =
          await Process.run('fastboot', <String>['getvar', 'current-slot']);
      final String mergedOutput =
          '${result.stdout}\n${result.stderr}'.toLowerCase();
      final RegExpMatch? match =
          RegExp(r'current-slot:\s*([ab])').firstMatch(mergedOutput);

      if (match == null) {
        _addLog('Could not parse current slot from output: $mergedOutput');
        _showErrorDialog('无法识别当前槽位。请检查 fastboot 输出日志。');
        return;
      }

      final String currentSlot = match.group(1)!;
      final String targetSlot = currentSlot == 'a' ? 'b' : 'a';
      await _runFastbootCommand(
        <String>['--set-active=$targetSlot'],
        actionLabel: 'switch slot $currentSlot -> $targetSlot',
      );
    } catch (e) {
      _addLog('Switch slot failed: $e');
      _showErrorDialog('切换槽位失败: $e');
    }
  }

  Future<void> _runFastbootCommand(
    List<String> args, {
    required String actionLabel,
  }) async {
    if (_isBusy) {
      return;
    }
    if (!await _ensureFastbootDeviceReady()) {
      return;
    }

    setState(() {
      _isBusy = true;
    });

    _addLog('----------------------------------------');
    _addLog('Start: $actionLabel');
    _addLog('> fastboot ${args.join(' ')}');

    try {
      final Process process = await Process.start('fastboot', args);
      process.stdout.transform(utf8.decoder).listen(_appendProcessLog);
      process.stderr.transform(utf8.decoder).listen(_appendProcessLog);

      final int code = await process.exitCode;
      if (code == 0) {
        _addLog('Done: $actionLabel');
      } else {
        _addLog('Failed: $actionLabel (exit code $code)');
        _showErrorDialog('操作失败，退出码: $code');
      }
    } catch (e) {
      _addLog('Failed to run fastboot: $e');
      _showErrorDialog('无法执行 fastboot 命令: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isBusy = false;
        });
      }
    }
  }

  Future<bool> _ensureFastbootDeviceReady() async {
    try {
      final ProcessResult result =
          await Process.run('fastboot', <String>['devices']);
      final String output = result.stdout.toString();
      final List<String> lines = output
          .split('\n')
          .map((String line) => line.trim())
          .where((String line) => line.isNotEmpty)
          .toList();
      final bool hasFastbootDevice = lines.any(
        (String line) => line.contains(RegExp(r'\sfastboot$')),
      );
      if (!hasFastbootDevice) {
        _showErrorDialog('未检测到 fastboot 设备，请确认设备已进入 fastboot 模式。');
      }
      return hasFastbootDevice;
    } catch (e) {
      _showErrorDialog('无法检测 fastboot 设备，请确认 fastboot 已安装并可用。\n$e');
      return false;
    }
  }

  String _formatPartitionLabel(String partition) {
    if (partition.isEmpty) {
      return partition;
    }
    final List<String> segments = partition.split('_');
    return segments
        .map((String s) =>
            s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}')
        .join('_');
  }

  void _appendProcessLog(String chunk) {
    final List<String> lines = chunk
        .replaceAll('\r\n', '\n')
        .split('\n')
        .where((String line) => line.trim().isNotEmpty)
        .toList();
    for (final String line in lines) {
      _addLog(line);
    }
  }

  void _addLog(String line) {
    final String timestamp = DateTime.now()
        .toIso8601String()
        .replaceFirst('T', ' ')
        .split('.')
        .first;
    if (!mounted) {
      _logs.add('[$timestamp] $line');
      return;
    }
    setState(() {
      _logs.add('[$timestamp] $line');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_logScrollController.hasClients) {
        return;
      }
      _logScrollController
          .jumpTo(_logScrollController.position.maxScrollExtent);
    });
  }

  void _showErrorDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: const Text('错误'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237);
                    }
                    return null;
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }
}
