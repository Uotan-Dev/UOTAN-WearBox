import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_assistant/wireless.dart';
import 'package:window_manager/window_manager.dart';

import 'adb_device_info.dart';
import 'driver.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'tutorial.dart';

class Page1 extends StatefulWidget {
  final List<AdbDeviceInfo> devices;
  final Future<void> Function() onRefreshDevices;

  const Page1({
    super.key,
    required this.devices,
    required this.onRefreshDevices,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String? _selectedAdbId;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _selectedAdbId =
        widget.devices.isNotEmpty ? widget.devices.first.adbId : null;
  }

  @override
  void didUpdateWidget(covariant Page1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.devices.isEmpty) {
      _selectedAdbId = null;
      return;
    }
    final bool selectedExists = widget.devices.any(
      (AdbDeviceInfo device) => device.adbId == _selectedAdbId,
    );
    if (!selectedExists) {
      _selectedAdbId = widget.devices.first.adbId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AdbDeviceInfo? selectedDevice = _getSelectedDeviceOrNull();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 00),
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
                      const SizedBox(width: 00),
                      Image.asset(
                        'assets/new_logo.png',
                        height: 0,
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
        padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
        child: selectedDevice == null
            ? _buildNoDeviceConnected(context)
            : _buildDeviceInfo(
                context,
                selectedDevice,
                availableDevices: widget.devices,
                selectedAdbId: _selectedAdbId,
              ),
      ),
    );
  }

  AdbDeviceInfo? _getSelectedDeviceOrNull() {
    if (widget.devices.isEmpty) {
      return null;
    }
    for (final AdbDeviceInfo device in widget.devices) {
      if (device.adbId == _selectedAdbId) {
        return device;
      }
    }
    return widget.devices.first;
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
            greeting,
            // '$greeting, ${l10n.homeWelcomeMessage}',
            style: const TextStyle(
              fontSize: 24,
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
          availableDevices: const <AdbDeviceInfo>[],
          selectedAdbId: null,
          showConnectionStatus: false,
          showDeviceName: false,
          hideBatteryUnits: true,
          showRebootActions: false,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 162,
          child: Row(
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
                          '连接帮助',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
                                          const WirelessPage(),
                                    ),
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
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text(
                              '3. 检查是否已开启',
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
                                          const TutorialPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'USB 调试',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '并安装了',
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
                                      builder: (context) => const DriverPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'ADB 驱动',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '程序',
                              style: TextStyle(fontSize: 15),
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
                child: _buildSelectDeviceCard(context, const <AdbDeviceInfo>[]),
              )
            ],
          ),
        )
      ],
    );
  }

  AdbDeviceInfo _buildPlaceholderDeviceInfo() {
    const placeholder = '--';
    return AdbDeviceInfo(
      adbId: placeholder,
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
    required List<AdbDeviceInfo> availableDevices,
    required String? selectedAdbId,
    bool showConnectionStatus = true,
    bool showDeviceName = true,
    bool hideBatteryUnits = false,
    bool showRebootActions = true,
  }) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDeviceName)
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              device.model,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'MiSansMed',
                height: 1.25,
              ),
            ),
          ),
        if (showDeviceName)
          const SizedBox(
            height: 4,
          ),
        if (showDeviceName && showConnectionStatus)
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5),
            child: Text(
              l10n.connect_successfully,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        const SizedBox(height: 8),
        buildMergedInfoCard(
          context,
          l10n,
          device,
          hideBatteryUnits: hideBatteryUnits,
        ),
        if (showRebootActions) ...[
          const SizedBox(height: 5),
          SizedBox(
            height: 162,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Card(
                    color: const Color(0xFFF9F9F9),
                    elevation: 0,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '重启至',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildRebootButton(
                                      context,
                                      text: 'Recovery',
                                      selectedAdbId: selectedAdbId,
                                      adbArgs: const ['reboot', 'recovery'],
                                    ),
                                    const SizedBox(height: 2),
                                    _buildRebootButton(
                                      context,
                                      text: 'Bootloader',
                                      selectedAdbId: selectedAdbId,
                                      adbArgs: const ['reboot', 'bootloader'],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 4),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildRebootButton(
                                      context,
                                      text: 'Fastbootd',
                                      selectedAdbId: selectedAdbId,
                                      adbArgs: const ['reboot', 'fastboot'],
                                    ),
                                    const SizedBox(height: 2),
                                    _buildRebootButton(
                                      context,
                                      text: '系统',
                                      selectedAdbId: selectedAdbId,
                                      adbArgs: const ['shell', 'reboot', '-p'],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 4),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildRebootButton(
                                      context,
                                      text: '9008',
                                      selectedAdbId: selectedAdbId,
                                      adbArgs: const ['reboot', 'edl'],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: _buildSelectDeviceCard(context, availableDevices),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSelectDeviceCard(
      BuildContext context, List<AdbDeviceInfo> devices) {
    final String? dropdownValue = devices.any(
      (AdbDeviceInfo device) => device.adbId == _selectedAdbId,
    )
        ? _selectedAdbId
        : null;

    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '选择设备',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: DropdownButtonFormField<String>(
                initialValue: dropdownValue,
                isExpanded: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
                  ),
                ),
                dropdownColor: Colors.white,
                hint: const Text(
                  '无已连接设备',
                ),
                items: devices
                    .map(
                      (AdbDeviceInfo device) => DropdownMenuItem<String>(
                        value: device.adbId,
                        child: Text(
                          '${device.model} (${device.deviceId})',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedAdbId = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: const Color.fromARGB(255, 237, 237, 237),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.0),
                      onTap: _isRefreshing ? null : _refreshDevices,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isRefreshing)
                              const Padding(
                                padding: EdgeInsetsGeometry.only(right: 4),
                                child: SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1.5,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            if (!_isRefreshing)
                              const Icon(
                                Icons.refresh,
                                size: 18,
                                color: Colors.black,
                              ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              _isRefreshing ? '刷新中...' : '刷新设备',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Card(
                    color: const Color.fromARGB(255, 237, 237, 237),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WirelessPage(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wifi, size: 18),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '无线连接',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshDevices() async {
    setState(() {
      _isRefreshing = true;
    });
    try {
      await widget.onRefreshDevices();
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('设备列表已刷新')),
      );
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('刷新设备失败: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshing = false;
        });
      }
    }
  }

  Widget buildMergedInfoCard(
    BuildContext context,
    AppLocalizations l10n,
    AdbDeviceInfo device, {
    bool hideBatteryUnits = false,
  }) {
    final String batteryLevelText = hideBatteryUnits
        ? '${_splitTitleValue(l10n.deviceBatteryLevel('0')).$1}: ${device.batteryLevel}'
        : l10n.deviceBatteryLevel(device.batteryLevel);
    final String batteryVoltageText = hideBatteryUnits
        ? '${_splitTitleValue(l10n.deviceBatteryVoltage('0')).$1}: ${device.batteryVoltage}'
        : l10n.deviceBatteryVoltage(device.batteryVoltage);
    final String batteryTemperatureText = hideBatteryUnits
        ? '${_splitTitleValue(l10n.deviceBatteryTemperature('0')).$1}: ${device.batteryTemperature}'
        : l10n.deviceBatteryTemperature(device.batteryTemperature);

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
      [batteryLevelText, l10n.deviceBatteryHealth(device.batteryHealth)],
      [batteryVoltageText, batteryTemperatureText],
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
        padding:
            const EdgeInsets.only(top: 18, right: 18, left: 18, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '设备信息',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            ...allInfoRows.map(
              (pair) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTitleValueCell(pair[0]),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: _buildTitleValueCell(pair[1]),
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

  Widget _buildRebootButton(
    BuildContext context, {
    required String text,
    required String? selectedAdbId,
    required List<String> adbArgs,
  }) {
    return SizedBox(
      width: 125,
      child: Card(
        color: const Color.fromARGB(255, 237, 237, 237),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          onTap: () => _runAdbCommand(selectedAdbId, adbArgs),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _runAdbCommand(String? selectedAdbId, List<String> args) async {
    if (selectedAdbId == null || selectedAdbId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请先选择设备')),
      );
      return;
    }
    try {
      final ProcessResult result =
          await Process.run('adb', <String>['-s', selectedAdbId, ...args]);
      if (!mounted) {
        return;
      }
      final messenger = ScaffoldMessenger.of(context);
      final String stderr = result.stderr.toString().trim();
      if (result.exitCode == 0) {
        messenger.showSnackBar(
          const SnackBar(content: Text('命令已发送')),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              stderr.isNotEmpty ? stderr : '执行失败: ${result.exitCode}',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ADB 执行异常: $e')),
      );
    }
  }

  Widget _buildTitleValueCell(String rawText) {
    final (title, value) = _splitTitleValue(rawText);
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 7,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 132, 132, 132),
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  (String, String) _splitTitleValue(String text) {
    final int separatorIndex = text.indexOf(RegExp(r'[:：]'));
    if (separatorIndex == -1) {
      return (text.trim(), '-');
    }
    final String title = text.substring(0, separatorIndex).trim();
    final String value = text.substring(separatorIndex + 1).trim();
    return (title, value);
  }
}
