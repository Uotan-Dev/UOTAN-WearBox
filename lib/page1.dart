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
        padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
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
            '$greeting, ${l10n.homeWelcomeMessage}',
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'MiSansMed',
              height: 1.25,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            l10n.homeNoDeviceDetected,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 5),
        _buildDeviceInfo(
          context,
          _buildPlaceholderDeviceInfo(),
          showConnectionStatus: false,
          showDeviceName: false,
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                color: const Color(0xFFF9F9F9),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.homeConnectionMethodsTitle,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.homeConnectionWired,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            '2. 使用',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(width: 4),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WirelessPage()),
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
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Card(
                color: const Color(0xFFF9F9F9),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.homeTroubleshootTitle,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
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
                                      builder: (context) =>
                                          const TutorialPage()),
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
                      const SizedBox(height: 8),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  AdbDeviceInfo _buildPlaceholderDeviceInfo() {
    const placeholder = '-';
    return AdbDeviceInfo(
      deviceId: placeholder,
      brand: placeholder,
      model: placeholder,
      memory: placeholder,
      storage: placeholder,
      androidVersion: placeholder,
      apiLevel: placeholder,
      patchDate: placeholder,
      softwareVersion: placeholder,
      kernelVersion: placeholder,
      batteryLevel: placeholder,
      batteryHealth: placeholder,
      batteryVoltage: placeholder,
      batteryTemperature: placeholder,
      resolution: placeholder,
      dpi: placeholder,
      bootloaderStatus: placeholder,
      uptime: placeholder,
      cpuArch: placeholder,
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

  Widget _buildDeviceInfo(
    BuildContext context,
    AdbDeviceInfo device, {
    bool showConnectionStatus = true,
    bool showDeviceName = true,
  }) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDeviceName)
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              '${device.model}',
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'MiSansMed',
                height: 1.25,
              ),
            ),
          ),
        if (showDeviceName)
          const SizedBox(
            height: 4,
          ),
        if (showDeviceName)
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5),
            child: Text(
              l10n.connect_successfully,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        SizedBox(height: 8),
        buildMergedInfoCard(l10n, device),
      ],
    );
  }

  Widget buildMergedInfoCard(AppLocalizations l10n, AdbDeviceInfo device) {
    final allInfoRows = <List<String>>[
      [
        l10n.deviceBrand(device.brand),
        l10n.deviceResolution(device.resolution)
      ],
      [l10n.deviceModel(device.model), l10n.deviceDpi(device.dpi)],
      [l10n.deviceSerial(device.deviceId), l10n.deviceMemory(device.memory)],
      [l10n.deviceUptime(device.uptime), l10n.deviceStorage(device.storage)],
      [
        l10n.deviceBootloader(device.bootloaderStatus),
        l10n.deviceArchitecture(device.cpuArch)
      ],
      [
        l10n.deviceBatteryLevel(device.batteryLevel),
        l10n.deviceBatteryHealth(device.batteryHealth)
      ],
      [
        l10n.deviceBatteryVoltage(device.batteryVoltage),
        l10n.deviceBatteryTemperature(device.batteryTemperature)
      ],
      [
        l10n.deviceAndroidVersion(device.androidVersion),
        l10n.devicePatchDate(device.patchDate)
      ],
      [
        l10n.deviceSoftwareVersion(device.softwareVersion),
        l10n.deviceKernelVersion(device.kernelVersion)
      ],
    ];

    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '设备信息',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...allInfoRows.map(
              (pair) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  children: [
                    Expanded(
                      child:
                          Text(pair[0], style: const TextStyle(fontSize: 16)),
                    ),
                    Expanded(
                      child:
                          Text(pair[1], style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
