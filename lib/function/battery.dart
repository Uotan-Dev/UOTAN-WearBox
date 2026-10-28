import '../platform_support.dart';
import '../app_theme.dart';
import 'dart:async';
import '../platform_tools.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_assistant/l10n/l10n.dart';
import 'package:watch_assistant/l10n/device_values.dart';

class BatteryManagerPage extends StatefulWidget {
  const BatteryManagerPage({super.key});

  @override
  State<BatteryManagerPage> createState() => _BatteryManagerPageState();
}

class _BatteryManagerPageState extends State<BatteryManagerPage> {
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();

  static const Duration _adbTimeout = Duration(seconds: 8);

  bool _loading = true;
  bool _busy = false;
  bool _isRefreshing = false;
  bool _initializedInput = false;

  bool _simulateNotCharging = false;
  bool _simulateWirelessCharging = false;
  bool _simulateUsbCharging = false;

  String _batteryLevel = '-';
  String _batteryHealth = '-';
  String _batteryVoltage = '-';
  String _batteryTemperature = '-';

  Timer? _autoRefreshTimer;

  @override
  void initState() {
    super.initState();
    _refreshBatteryInfo();
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted || _busy || _isRefreshing) {
        return;
      }
      _refreshBatteryInfo(silent: true);
    });
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    _temperatureController.dispose();
    _levelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: !_busy,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
              onPanStart: (_) => startWindowDrag(),
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: context.palette.text, size: 20),
                      onPressed: _busy ? null : () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      l10n.featureBatteryManager,
                      style: TextStyle(
                        color: context.palette.text,
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
        body: _loading
            ? Center(
                child: CircularProgressIndicator(color: context.palette.text))
            : Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(child: _buildUsageCard()),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                      children: [
                        _buildBatteryStatusCard(),
                        const SizedBox(height: 12),
                        _buildBatteryActionCard()
                      ],
                    )),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildUsageCard() {
    final int level = int.tryParse(_batteryLevel) ?? 0;
    final int safeLevel = level.clamp(0, 100);

    return Card(
      color: context.palette.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: _buildUsageRing(
                  progress: safeLevel / 100,
                  color: const Color.fromARGB(255, 30, 93, 229),
                  percentText: '$safeLevel%',
                  usageText: context.l10n.batteryCurrentLevel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBatteryStatusCard() {
    final l10n = context.l10n;
    final int level = int.tryParse(_batteryLevel) ?? 0;

    return Card(
      color: context.palette.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              l10n.deviceBatteryStatusTitle,
              style: const TextStyle(fontSize: 20, fontFamily: 'MiSansLight'),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: level.clamp(0, 100) / 100,
              color: context.palette.subtext,
              backgroundColor: context.palette.border,
              minHeight: 8,
              borderRadius: BorderRadius.circular(999),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(l10n.deviceBatteryLevel(_batteryLevel)),
            _buildInfoRow(l10n.deviceBatteryHealth(
                localizeBatteryHealth(l10n, _batteryHealth))),
            _buildInfoRow(l10n.deviceBatteryVoltage(_batteryVoltage)),
            _buildInfoRow(l10n.deviceBatteryTemperature(_batteryTemperature)),
          ],
        ),
      ),
    );
  }

  Widget _buildBatteryActionCard() {
    return Card(
      color: context.palette.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              context.l10n.featureBatteryManager,
              style: const TextStyle(fontSize: 20, fontFamily: 'MiSansLight'),
            ),
            const SizedBox(height: 10),
            _buildInputRow(
              labelText: context.l10n.batteryTemperatureLabel,
              controller: _temperatureController,
              onTap: _setTemperature,
            ),
            const SizedBox(height: 10),
            _buildInputRow(
              labelText: context.l10n.batteryLevelLabel,
              controller: _levelController,
              onTap: _setBatteryLevel,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                _buildModeButton(
                  text: context.l10n.batterySimulateDischarging,
                  onTap: _setNotCharging,
                  isActive: _simulateNotCharging,
                ),
                _buildModeButton(
                  text: context.l10n.batterySimulateWireless,
                  onTap: _setWirelessCharging,
                  isActive: _simulateWirelessCharging,
                ),
                _buildModeButton(
                  text: context.l10n.batterySimulateUsb,
                  onTap: _setUsbCharging,
                  isActive: _simulateUsbCharging,
                ),
                _buildModeButton(
                  text: context.l10n.batteryRestoreDefault,
                  onTap: () => _resetBattery(showMessage: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow({
    required String labelText,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 80,
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 46,
            child: TextField(
              controller: controller,
              enabled: !_busy,
              style: const TextStyle(fontSize: 15),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: context.palette.field,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: context.palette.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: context.palette.border),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 72,
          height: 46,
          child: _buildActionButton(
              text: context.l10n.batteryModify, onTap: onTap),
        ),
      ],
    );
  }

  Widget _buildModeButton({
    required String text,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    final Color bgColor = isActive
        ? const Color.fromARGB(255, 30, 93, 229)
        : context.palette.button;
    final Color fgColor = isActive ? Colors.white : context.palette.text;

    return Card(
      margin: EdgeInsets.zero,
      color: bgColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.0),
        onTap: _busy ? null : onTap,
        child: Center(
          widthFactor: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(text, style: TextStyle(color: fgColor, fontSize: 16)),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      {required String text, required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.palette.button,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.0),
        onTap: _busy ? null : onTap,
        child: Center(
          child: Text(text,
              style: TextStyle(color: context.palette.text, fontSize: 15)),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _buildUsageRing({
    required double progress,
    required Color color,
    required String percentText,
    required String usageText,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
                  backgroundColor: context.palette.border,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Text(percentText,
                  style: TextStyle(fontSize: 42, color: context.palette.text)),
            ],
          ),
        ),
        const SizedBox(height: 65),
        Text(usageText,
            style: TextStyle(fontSize: 16, color: context.palette.text)),
      ],
    );
  }

  Future<void> _refreshBatteryInfo({bool silent = false}) async {
    if (_isRefreshing) {
      return;
    }
    _isRefreshing = true;

    try {
      final bool connected = await _ensureDeviceConnected(showDialog: !silent);
      if (!connected) {
        if (mounted && _loading) {
          setState(() => _loading = false);
        }
        return;
      }

      final ProcessResult? result = await _runAdb(
        <String>['shell', 'dumpsys', 'battery'],
        showDialogOnSuccess: false,
        showDialogOnError: !silent,
        showConnectDialog: !silent,
        trackBusy: false,
      );
      if (result == null || result.exitCode != 0) {
        if (mounted && _loading) {
          setState(() => _loading = false);
        }
        return;
      }

      final Map<String, String> info =
          _parseBatteryInfo(result.stdout.toString());
      final String level = info['level'] ?? '-';
      final String healthCode = info['health'] ?? '';
      final String voltage = info['voltage'] ?? '-';
      final String temperatureRaw = info['temperature'] ?? '';
      final int temperatureInt = int.tryParse(temperatureRaw) ?? -1;
      final String temperature = temperatureInt >= 0
          ? (temperatureInt / 10.0).toStringAsFixed(1)
          : '-';
      final bool usb = info['usb'] == '1';
      final bool wireless = info['wireless'] == '1';
      final int status = int.tryParse(info['status'] ?? '') ?? 0;

      if (!mounted) {
        return;
      }

      setState(() {
        _batteryLevel = level;
        _batteryHealth = healthCode;
        _batteryVoltage = voltage;
        _batteryTemperature = temperature;

        _simulateUsbCharging = usb;
        _simulateWirelessCharging = wireless;
        _simulateNotCharging = status == 4 && !usb && !wireless;

        if (!_initializedInput) {
          _initializedInput = true;
          _levelController.text = level == '-' ? '' : level;
          _temperatureController.text = temperature == '-' ? '' : temperature;
        }
        _loading = false;
      });
    } finally {
      _isRefreshing = false;
    }
  }

  Map<String, String> _parseBatteryInfo(String output) {
    final Map<String, String> info = <String, String>{};
    for (final String rawLine in output.split('\n')) {
      final String line = rawLine.trim();
      if (!line.contains(':')) {
        continue;
      }
      final int index = line.indexOf(':');
      if (index <= 0) {
        continue;
      }
      info[line.substring(0, index).trim().toLowerCase()] =
          line.substring(index + 1).trim();
    }
    return info;
  }

  Future<void> _resetBattery({bool showMessage = true}) async {
    final ProcessResult? result = await _runAdb(
      <String>['shell', 'dumpsys', 'battery', 'reset'],
      successMessage: showMessage ? context.l10n.batteryResetSuccess : null,
      showDialogOnSuccess: showMessage,
    );
    if (result != null && result.exitCode == 0) {
      await _refreshBatteryInfo(silent: true);
    }
  }

  Future<void> _setTemperature() async {
    final String raw = _temperatureController.text.trim();
    if (raw.isEmpty) {
      _showErrorDialog(context.l10n.batteryEnterTemperature);
      return;
    }
    final double? value = double.tryParse(raw);
    if (value == null) {
      _showErrorDialog(context.l10n.batteryInvalidTemperature);
      return;
    }

    final int adbValue = (value * 10).round();
    final ProcessResult? result = await _runAdb(
      <String>[
        'shell',
        'dumpsys',
        'battery',
        'set',
        'temperature',
        '$adbValue'
      ],
      successMessage:
          context.l10n.batteryTemperatureChanged(value.toStringAsFixed(1)),
    );
    if (result != null && result.exitCode == 0) {
      await _refreshBatteryInfo(silent: true);
    }
  }

  Future<void> _setBatteryLevel() async {
    final String raw = _levelController.text.trim();
    if (raw.isEmpty) {
      _showErrorDialog(context.l10n.batteryEnterLevel);
      return;
    }
    final int? value = int.tryParse(raw);
    if (value == null || value < 0 || value > 100) {
      _showErrorDialog(context.l10n.batteryInvalidLevel);
      return;
    }

    final ProcessResult? result = await _runAdb(
      <String>['shell', 'dumpsys', 'battery', 'set', 'level', '$value'],
      successMessage: context.l10n.batteryLevelChanged(value.toString()),
    );
    if (result != null && result.exitCode == 0) {
      await _refreshBatteryInfo(silent: true);
    }
  }

  Future<void> _setNotCharging() async {
    final bool ok = await _applyBatteryValues(<MapEntry<String, String>>[
      const MapEntry<String, String>('ac', '0'),
      const MapEntry<String, String>('usb', '0'),
      const MapEntry<String, String>('wireless', '0'),
      const MapEntry<String, String>('status', '4'),
    ]);
    if (ok) {
      await _refreshBatteryInfo(silent: true);
    }
  }

  Future<void> _setWirelessCharging() async {
    final bool ok = await _applyBatteryValues(<MapEntry<String, String>>[
      const MapEntry<String, String>('wireless', '1'),
      const MapEntry<String, String>('usb', '0'),
      const MapEntry<String, String>('ac', '0'),
      const MapEntry<String, String>('status', '2'),
    ]);
    if (ok) {
      await _refreshBatteryInfo(silent: true);
    }
  }

  Future<void> _setUsbCharging() async {
    final bool ok = await _applyBatteryValues(<MapEntry<String, String>>[
      const MapEntry<String, String>('usb', '1'),
      const MapEntry<String, String>('wireless', '0'),
      const MapEntry<String, String>('ac', '0'),
      const MapEntry<String, String>('status', '2'),
    ]);
    if (ok) {
      await _refreshBatteryInfo(silent: true);
    }
  }

  Future<bool> _applyBatteryValues(
      List<MapEntry<String, String>> values) async {
    if (values.isEmpty || _busy) {
      return false;
    }

    final bool connected = await _ensureDeviceConnected(showDialog: true);
    if (!connected) {
      return false;
    }

    setState(() => _busy = true);
    try {
      for (final MapEntry<String, String> entry in values) {
        final ProcessResult result = await Process.run(
          adbPath,
          <String>[
            'shell',
            'dumpsys',
            'battery',
            'set',
            entry.key,
            entry.value
          ],
          environment: toolEnvironment,
        ).timeout(_adbTimeout);
        if (result.exitCode != 0) {
          final String stderr = result.stderr.trim();
          _showErrorDialog(stderr.isEmpty
              ? context.l10n.adbCommandFailed
              : context.l10n.adbCommandError(stderr));
          return false;
        }
      }
      return true;
    } on TimeoutException {
      _showErrorDialog(context.l10n.adbCommandTimeout);
      return false;
    } catch (e) {
      _showErrorDialog(context.l10n.adbExecutionError(e.toString()));
      return false;
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<ProcessResult?> _runAdb(
    List<String> args, {
    String? successMessage,
    bool showDialogOnSuccess = true,
    bool showDialogOnError = true,
    bool showConnectDialog = true,
    bool trackBusy = true,
  }) async {
    if (trackBusy && _busy) {
      return null;
    }

    final bool connected =
        await _ensureDeviceConnected(showDialog: showConnectDialog);
    if (!connected) {
      return null;
    }

    if (trackBusy) {
      setState(() => _busy = true);
    }

    try {
      final ProcessResult result =
          await Process.run(adbPath, args, environment: toolEnvironment).timeout(_adbTimeout);
      final String stderr = result.stderr.trim();

      if (result.exitCode != 0 && showDialogOnError) {
        _showErrorDialog(stderr.isEmpty
            ? context.l10n.adbCommandFailed
            : context.l10n.adbCommandError(stderr));
      } else if (result.exitCode == 0 &&
          successMessage != null &&
          showDialogOnSuccess) {
        _showInfoDialog(successMessage);
      }
      return result;
    } on TimeoutException {
      if (showDialogOnError) {
        _showErrorDialog(context.l10n.adbCommandTimeout);
      }
      return null;
    } catch (e) {
      if (showDialogOnError) {
        _showErrorDialog(context.l10n.adbExecutionError(e.toString()));
      }
      return null;
    } finally {
      if (trackBusy && mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<bool> _ensureDeviceConnected({bool showDialog = true}) async {
    try {
      final ProcessResult result =
          await Process.run(adbPath, <String>['devices'], environment: toolEnvironment).timeout(_adbTimeout);
      final List<String> lines = result.stdout
          .toString()
          .split('\n')
          .map((String line) => line.trim())
          .where((String line) => line.isNotEmpty)
          .toList();
      final bool connected =
          lines.skip(1).any((String line) => line.contains('\tdevice'));

      if (!mounted) {
        return false;
      }
      if (!connected && showDialog) {
        _showErrorDialog(context.l10n.buttonDeviceNotConnectedMessage);
      }
      return connected;
    } on TimeoutException {
      if (!mounted) {
        return false;
      }
      if (showDialog) {
        _showErrorDialog(context.l10n.adbConnectionTimeout);
      }
      return false;
    } catch (e) {
      if (!mounted) {
        return false;
      }
      if (showDialog) {
        _showErrorDialog(context.l10n.adbConnectionError(e.toString()));
      }
      return false;
    }
  }

  void _showErrorDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.palette.surface,
          title: Text(context.l10n.commonErrorTitle),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.dialogOk),
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
        return AlertDialog(
          backgroundColor: context.palette.surface,
          title: Text(context.l10n.commonNoticeTitle),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }
}
