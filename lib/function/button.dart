import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool _isDeviceConnected = false;

  @override
  void initState() {
    super.initState();
    _checkDeviceConnection().then((connected) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isDeviceConnected = connected;
      });
      if (!connected) {
        final l10n = context.l10n;
        _showMessage(context, l10n.buttonDeviceNotConnectedTitle,
            l10n.buttonDeviceNotConnectedMessage);
      }
    });
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
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.buttonPageTitle,
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
          crossAxisCount: 4, // 一行四个按钮
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 3, // 维持按钮原高度
          children: _buildButtons(context),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    final l10n = context.l10n;
    final List<Map<String, String>> buttonData = [
      {"name": l10n.buttonNameHome, "keycode": "3"},
      {"name": l10n.buttonNameBack, "keycode": "4"},
      {"name": l10n.buttonNamePower, "keycode": "26"},
      {"name": l10n.buttonNameVolumeUp, "keycode": "24"},
      {"name": l10n.buttonNameVolumeDown, "keycode": "25"},
      {"name": l10n.buttonNameSpeakerMute, "keycode": "164"},
      {"name": l10n.buttonNameMicMute, "keycode": "91"},
      {"name": l10n.buttonNameCallDial, "keycode": "5"},
      {"name": l10n.buttonNameCallEnd, "keycode": "6"},
      {"name": l10n.buttonNamePlayPause, "keycode": "85"},
      {"name": l10n.buttonNameNextTrack, "keycode": "87"},
      {"name": l10n.buttonNamePreviousTrack, "keycode": "88"},
      {"name": l10n.buttonNameScreenOn, "keycode": "224"},
      {"name": l10n.buttonNameScreenOff, "keycode": "223"},
    ];

    return buttonData.map((button) {
      return _buildButton(
          button["name"]!, () => _sendAdbKey(button["keycode"]!));
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

  Future<void> _sendAdbKey(String keycode) async {
    if (!_isDeviceConnected) {
      final l10n = context.l10n;
      _showMessage(context, l10n.buttonDeviceNotConnectedTitle,
          l10n.buttonConnectFirstMessage);
      return;
    }

    try {
      ProcessResult result =
          await Process.run('adb', ['shell', 'input', 'keyevent', keycode]);
      if (result.exitCode == 0) {
        debugPrint(context.l10n.buttonSendKeySuccess(keycode));
      } else {
        _showMessage(context, context.l10n.commonErrorTitle,
            context.l10n.buttonExecutionFailed(result.stderr.toString()));
      }
    } catch (e) {
      _showMessage(context, context.l10n.commonErrorTitle,
          context.l10n.buttonExecutionFailed(e.toString()));
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
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: Text(title),
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
              child: const Text('确定'),
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
