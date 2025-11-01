import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

class PairPage extends StatefulWidget {
  const PairPage({super.key});

  @override
  _PairPageState createState() => _PairPageState();
}

class _PairPageState extends State<PairPage> {
  bool _isDeviceConnected = false;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      _checkDeviceConnection().then((connected) {
        if (!mounted) {
          return;
        }
        setState(() {
          _isDeviceConnected = connected;
        });
        if (!connected) {
          final l10n = context.l10n;
          _showMessage(context, l10n.buttonDeviceNotConnectedTitle, l10n.buttonDeviceNotConnectedMessage);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.pairingPageTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'MiSansLight',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.pairingStepTitle(1),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              l10n.pairingStepDescription1,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.pairingStepTitle(2),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            _buildButton(l10n.pairingClearServicesButton, _clearGoogleServicesAndReboot),
            const SizedBox(height: 30), // 间隔
            Text(
              l10n.pairingStepTitle(3),
              style: const TextStyle(fontSize: 20),
            ),
           
            _buildButton(l10n.pairingEnableBluetoothButton, _enableBluetoothDiscoverable),
            const SizedBox(height: 30), // 间隔
            Text(
              l10n.pairingStepTitle(4),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              l10n.pairingStepDescription4,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Card(
      color: const Color(0xFFF9F9F9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onPressed,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// **第一步：清除 Google Play 服务并重启**
  Future<void> _clearGoogleServicesAndReboot() async {
    if (!_isDeviceConnected) {
      final l10n = context.l10n;
      _showMessage(context, l10n.buttonDeviceNotConnectedTitle, l10n.buttonConnectFirstMessage);
      return;
    }

    try {
      // 清除 Google Play 服务
      ProcessResult clearResult = await Process.run('adb', ['shell', 'pm', 'clear', 'com.google.android.gms']);
      if (clearResult.exitCode != 0) {
        _showMessage(context, context.l10n.commonErrorTitle, context.l10n.pairingClearFailure(clearResult.stderr.toString()));
        return;
      }

      // 重启设备
      ProcessResult rebootResult = await Process.run('adb', ['shell', 'reboot']);
      if (rebootResult.exitCode == 0) {
        _showMessage(context, context.l10n.fileManagerSuccessTitle, context.l10n.pairingRebooting);
      } else {
        _showMessage(context, context.l10n.commonErrorTitle, context.l10n.pairingRebootFailure(rebootResult.stderr.toString()));
      }
    } catch (e) {
      _showMessage(context, context.l10n.commonErrorTitle, context.l10n.pairingExecuteFailure(e.toString()));
    }
  }

  /// **第二步：开启蓝牙可见模式**
  Future<void> _enableBluetoothDiscoverable() async {
    if (!_isDeviceConnected) {
      final l10n = context.l10n;
      _showMessage(context, l10n.buttonDeviceNotConnectedTitle, l10n.buttonConnectFirstMessage);
      return;
    }

    try {
      ProcessResult result = await Process.run('adb', [
        'shell',
        'am',
        'start',
        '-a',
        'android.bluetooth.adapter.action.REQUEST_DISCOVERABLE'
      ]);
      if (result.exitCode == 0) {
        _showMessage(context, context.l10n.fileManagerSuccessTitle, context.l10n.pairingBluetoothEnabled);
      } else {
        _showMessage(context, context.l10n.commonErrorTitle, context.l10n.pairingExecuteFailure(result.stderr.toString()));
      }
    } catch (e) {
      _showMessage(context, context.l10n.commonErrorTitle, context.l10n.pairingExecuteFailure(e.toString()));
    }
  }

  /// **检查 ADB 设备连接**
  Future<bool> _checkDeviceConnection() async {
    try {
      ProcessResult result = await Process.run('adb', ['devices']);
      String output = result.stdout.toString();
      List<String> lines = output.split('\n');
      for (var line in lines.skip(1)) {
        if (line.contains('\tdevice')) {
          return true;
        }
      }
    } catch (e) {
      debugPrint('Failed to check device connection: $e');
    }
    return false;
  }

  /// **弹窗显示执行结果**
  void _showMessage(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed) || states.contains(WidgetState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237);
                    }
                    return null;
                  },
                ),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
              ),
              child: Text(l10n.dialogOk),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
