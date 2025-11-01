import 'package:flutter/material.dart';
import 'package:watch_assistant/wireless.dart';
import 'package:window_manager/window_manager.dart';

import 'adb_device_info.dart';
import 'driver.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'tutorial.dart';

class Page1 extends StatelessWidget {
  final List<AdbDeviceInfo> devices;

  const Page1({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/new_logo.png',
                        height: 35,
                      ),
                    ],
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
        padding: const EdgeInsets.all(25.0),
        child: devices.isEmpty
            ? _buildNoDeviceConnected(context)
            : _buildDeviceInfo(context, devices[0]),
      ),
    );
  }

  Widget _buildNoDeviceConnected(BuildContext context) {
    final l10n = context.l10n;
    final greeting = _getGreetingBasedOnTime(l10n);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            '$greeting\n${l10n.homeWelcomeMessage}',
            style: const TextStyle(
              fontSize: 34,
              fontFamily: 'OPPOSansMed',
              height: 1.25,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            l10n.homeNoDeviceDetected,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 15),
        Card(
          color: const Color(0xFFF9F9F9),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.homeConnectionMethodsTitle,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.homeConnectionWired,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      l10n.homeConnectionWirelessPrefix,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 4),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WirelessPage()),
                          );
                        },
                        child: Text(
                          l10n.homeConnectionWirelessLink,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      l10n.homeConnectionWirelessSuffix,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.homeTroubleshootTitle,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      l10n.homeTroubleshootUsbDebug,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 4),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TutorialPage()),
                          );
                        },
                        child: Text(
                          l10n.homeTroubleshootUsbDebugLink,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      l10n.homeTroubleshootDriver,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 4),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DriverPage()),
                          );
                        },
                        child: Text(
                          l10n.homeTroubleshootDriverLink,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.homeTroubleshootReinstall,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.homeTroubleshootRestart,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getGreetingBasedOnTime(AppLocalizations l10n) {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 0 && hour < 6) {
      return l10n.homeGreetingEarlyMorning;
    } else if (hour >= 6 && hour < 12) {
      return l10n.homeGreetingMorning;
    } else if (hour >= 12 && hour < 18) {
      return l10n.homeGreetingAfternoon;
    } else {
      return l10n.homeGreetingEvening;
    }
  }

  Widget _buildDeviceInfo(BuildContext context, AdbDeviceInfo device) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' ${device.model}',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          ' ${l10n.connect_successfully}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        buildBasicInfoCard(context, l10n.deviceBasicInfoTitle, [
          [
            l10n.deviceBrand(device.brand),
            l10n.deviceResolution(device.resolution)
          ],
          [l10n.deviceModel(device.model), l10n.deviceDpi(device.dpi)],
          [
            l10n.deviceSerial(device.deviceId),
            l10n.deviceMemory(device.memory)
          ],
          [
            l10n.deviceUptime(device.uptime),
            l10n.deviceStorage(device.storage)
          ],
          [
            l10n.deviceBootloader(device.bootloaderStatus),
            l10n.deviceArchitecture(device.cpuArch)
          ],
        ]),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: buildInfoCard(l10n.deviceBatteryStatusTitle, [
                l10n.deviceBatteryLevel(device.batteryLevel),
                l10n.deviceBatteryHealth(device.batteryHealth),
                l10n.deviceBatteryVoltage(device.batteryVoltage),
                l10n.deviceBatteryTemperature(device.batteryTemperature),
              ]),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: buildInfoCard(l10n.deviceSystemVersionTitle, [
                l10n.deviceAndroidVersion(device.androidVersion),
                l10n.devicePatchDate(device.patchDate),
                l10n.deviceSoftwareVersion(device.softwareVersion),
                l10n.deviceKernelVersion(device.kernelVersion),
              ]),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBasicInfoCard(
      BuildContext context, String title, List<List<String>> info) {
    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...info.map(
              (pair) => Row(
                children: [
                  Expanded(
                    child: Text(
                      pair[0],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      pair[1],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, List<String> info) {
    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (final item in info)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
