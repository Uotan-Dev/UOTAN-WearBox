import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'function/app.dart';
import 'function/display.dart';
import 'function/file.dart';
import 'function/installApp.dart';
import 'function/type.dart';
import 'function/button.dart';
import 'function/pair.dart';
import 'function/rotate.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final featureItems = _buildFeatureItems(l10n);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      l10n.featuresTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontFamily: 'MiSansLight',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/mini.png'),
                        onPressed: () {
                          windowManager.minimize();
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/close.png'),
                        onPressed: () {
                          windowManager.close();
                        },
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
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3,
          ),
          itemCount: featureItems.length,
          itemBuilder: (context, index) {
            final item = featureItems[index];
            return Material(
              color: const Color(0xFFF9F9F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {
                  if (!item.isImplemented) {
                    _showMessage(
                      context,
                      l10n.featureComingSoonTitle,
                      l10n.featureComingSoonMessage(item.label),
                    );
                    return;
                  }

                  switch (item.action) {
                    case _FeatureAction.installApp:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InstallAppPage()),
                      );
                      break;
                    case _FeatureAction.appManagement:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppManagementPage()),
                      );
                      break;
                    case _FeatureAction.fileManagement:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdbFileManagerPage()),
                      );
                      break;
                    case _FeatureAction.sendText:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TypeTextPage()),
                      );
                      break;
                    case _FeatureAction.displaySettings:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DisplaySettingsPage()),
                      );
                      break;
                    case _FeatureAction.keySimulation:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ButtonPage()),
                      );
                      break;
                    case _FeatureAction.rotateScreen:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RotatePage()),
                      );
                      break;
                    case _FeatureAction.rePair:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PairPage()),
                      );
                      break;
                    case _FeatureAction.memoryClean:
                    case _FeatureAction.batteryManager:
                    case _FeatureAction.capture:
                    case _FeatureAction.flashTool:
                      _showMessage(
                        context,
                        l10n.featureComingSoonTitle,
                        l10n.featureComingSoonMessage(item.label),
                      );
                      break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5),
                      Image.asset(
                        item.iconPath,
                        width: 20,
                        height: 20,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AutoSizeText(
                          item.label,
                          style: const TextStyle(fontSize: 16),
                          maxLines: 2, // 最多两行
                          minFontSize: 12, // 最小字号，可根据需要调
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<_FeatureItemData> _buildFeatureItems(AppLocalizations l10n) {
    return [
      _FeatureItemData(
        iconPath:
            'assets/icons/download_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureInstallApp,
        action: _FeatureAction.installApp,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/apps_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureAppManagement,
        action: _FeatureAction.appManagement,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/drive_file_move_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureFileManagement,
        action: _FeatureAction.fileManagement,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/edit_note_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureSendText,
        action: _FeatureAction.sendText,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/aod_watch_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureDisplaySettings,
        action: _FeatureAction.displaySettings,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/memory_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureMemoryClean,
        action: _FeatureAction.memoryClean,
        isImplemented: false,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/watch_button_press_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureKeySimulation,
        action: _FeatureAction.keySimulation,
      ),
      _FeatureItemData(
        iconPath: 'assets/icons/battery_profile.png',
        label: l10n.featureBatteryManager,
        action: _FeatureAction.batteryManager,
        isImplemented: false,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/screen_rotation_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureRotateScreen,
        action: _FeatureAction.rotateScreen,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/screenshot_tablet_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureCapture,
        action: _FeatureAction.capture,
        isImplemented: false,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/transition_push_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureRePair,
        action: _FeatureAction.rePair,
      ),
      _FeatureItemData(
        iconPath:
            'assets/icons/android_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        label: l10n.featureFlashTool,
        action: _FeatureAction.flashTool,
        isImplemented: false,
      ),
    ];
  }

  void _showMessage(BuildContext context, String title, String message) {
    final l10n = context.l10n;
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

enum _FeatureAction {
  installApp,
  appManagement,
  fileManagement,
  sendText,
  displaySettings,
  memoryClean,
  keySimulation,
  batteryManager,
  rotateScreen,
  capture,
  rePair,
  flashTool,
}

class _FeatureItemData {
  const _FeatureItemData({
    required this.iconPath,
    required this.label,
    required this.action,
    this.isImplemented = true,
  });

  final String iconPath;
  final String label;
  final _FeatureAction action;
  final bool isImplemented;
}
