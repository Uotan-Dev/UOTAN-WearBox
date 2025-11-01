import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

class RotatePage extends StatefulWidget {
  const RotatePage({super.key});

  @override
  _RotatePageState createState() => _RotatePageState();
}

class _RotatePageState extends State<RotatePage> {
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
                        l10n.rotatePageTitle,
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
        child: GridView.count(
          crossAxisCount: 2, // 一行两个按钮
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5, // 维持按钮原高度
          children: _buildButtons(),
        ),
      ),
    );
  }

  List<Widget> _buildButtons() {
    final l10n = context.l10n;
    final List<Map<String, String>> buttonData = [
      {"name": l10n.rotateButtonLeft, "rotation": "1"},
      {"name": l10n.rotateButtonRight, "rotation": "3"},
      {"name": l10n.rotateButtonFlip, "rotation": "2"},
      {"name": l10n.rotateButtonReset, "rotation": "0"},
    ];

    return buttonData.map((button) {
      return _buildButton(button["name"]!, () => _rotateScreen(button["rotation"]!, button["name"]!));
    }).toList();
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

  Future<void> _rotateScreen(String rotation, String directionLabel) async {
    if (!_isDeviceConnected) {
      final l10n = context.l10n;
      _showMessage(context, l10n.buttonDeviceNotConnectedTitle, l10n.buttonConnectFirstMessage);
      return;
    }

    try {
      ProcessResult result = await Process.run(
          'adb', ['shell', 'settings', 'put', 'system', 'user_rotation', rotation]);
      if (result.exitCode == 0) {
        _showMessage(context, context.l10n.fileManagerSuccessTitle, context.l10n.rotateSuccessMessage(directionLabel));
      } else {
        _showMessage(context, context.l10n.commonErrorTitle, context.l10n.rotateExecuteFailure(result.stderr.toString()));
      }
    } catch (e) {
      _showMessage(context, context.l10n.commonErrorTitle, context.l10n.rotateExecuteFailure(e.toString()));
    }
  }

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
