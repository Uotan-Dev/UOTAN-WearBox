import 'platform_support.dart';
import 'app_theme.dart';

import 'dart:io';

import 'platform_tools.dart';

import 'package:flutter/material.dart';
import 'package:watch_assistant/wireless.dart';

import 'package:flutter_miuix/miuix.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'adb_device_info.dart';
import 'app_snackbar.dart';
import 'miuix_titled_page.dart';
import 'blur_menu.dart';
import 'driver.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'l10n/device_values.dart';
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

  // 与 HomeScreen 的底部导航栏断点保持一致
  static const double _narrowLayoutBreakpoint = 600;

  bool _isNarrow(BuildContext context) =>
      MediaQuery.sizeOf(context).width < _narrowLayoutBreakpoint;

  @override
  Widget build(BuildContext context) {
    final AdbDeviceInfo? selectedDevice = _getSelectedDeviceOrNull();
    if (_isNarrow(context)) {
      // 窄屏：未连接时提示连接设备，已连接时显示设备型号。
      final l10n = context.l10n;
      return MiuixTitledPage(
        title: selectedDevice?.model ?? l10n.homeConnectDevice,
        actions: [
          _buildRebootMenu(context, selectedDevice?.adbId),
          _buildRefreshAction(context),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
            child: selectedDevice == null
                ? _buildNoDeviceConnected(context)
                : _buildDeviceInfo(
                    context,
                    selectedDevice,
                    availableDevices: widget.devices,
                    selectedAdbId: _selectedAdbId,
                    showDeviceName: false,
                  ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 00),
          child: GestureDetector(
            onPanStart: (details) => startWindowDrag(),
            child: Container(
              // 固定高度：macOS 隐藏窗口按钮后标题栏不能因此塌缩，否则首页整体上移
              height: 48,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 00),
                      Image.asset('assets/new_logo.png', height: 0),
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
        // 窄屏时问候语和状态由 miuix 标题栏显示
        if (!_isNarrow(context)) ...[
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
        ],
        // 窄屏下占位的设备信息卡片放在选择设备下方
        if (!_isNarrow(context)) ...[
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
        ],
        _buildCardPair(
          context,
          Card(
            margin: _isNarrow(context) ? EdgeInsets.zero : null,
            color: context.palette.surface,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!_isNarrow(context)) ...[
                    Text(
                      context.l10n.homeConnectionHelp,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  // 移动端只能通过无线调试连接，不显示数据线和无线连接说明
                  if (isDesktop) ...[
                    Text(
                      l10n.homeConnectionWired,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                    _buildFlowRow(context, [
                      Text(
                        context.l10n.homeWirelessUse,
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
                    ]),
                    const SizedBox(height: 8),
                  ],
                  _buildFlowRow(context, [
                    Text(
                      isDesktop
                          ? context.l10n.homeCheckDebugPrefix
                          : context.l10n.homeCheckDebugPrefix.replaceFirst(
                              RegExp(r'^\d+\.\s*'),
                              '',
                            ),
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
                              builder: (context) => const TutorialPage(),
                            ),
                          );
                        },
                        child: Text(
                          context.l10n.homeUsbDebugLink,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    // 移动端无需安装电脑端 ADB 驱动
                    if (isDesktop) ...[
                      const SizedBox(width: 4),
                      Text(
                        context.l10n.homeInstallDriverPrefix,
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
                                builder: (context) => const DriverPage(),
                              ),
                            );
                          },
                          child: Text(
                            context.l10n.homeAdbDriverLink,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        context.l10n.homeDriverSuffix,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ]),
                ],
              ),
            ),
          ),
          _buildSelectDeviceCard(context, const <AdbDeviceInfo>[]),
          narrowBelowRight: buildMergedInfoCard(
            context,
            l10n,
            _buildPlaceholderDeviceInfo(),
            hideBatteryUnits: true,
          ),
        ),
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
        if (showDeviceName) const SizedBox(height: 4),
        if (showDeviceName && showConnectionStatus)
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5),
            child: Text(
              l10n.connect_successfully,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        if (!_isNarrow(context)) const SizedBox(height: 8),
        // 窄屏：重启操作在标题栏菜单中，设备信息放在选择设备下方
        if (_isNarrow(context) && showRebootActions) ...[
          _buildSelectDeviceCard(context, availableDevices),
          const SizedBox(height: 10),
          buildMergedInfoCard(
            context,
            l10n,
            device,
            hideBatteryUnits: hideBatteryUnits,
          ),
        ] else
          buildMergedInfoCard(
            context,
            l10n,
            device,
            hideBatteryUnits: hideBatteryUnits,
          ),
        if (showRebootActions && !_isNarrow(context)) ...[
          const SizedBox(height: 5),
          _buildCardPair(
            context,
            Card(
              color: context.palette.surface,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.homeRebootTo,
                      style: const TextStyle(
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
                                text: context.l10n.homeSystem,
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
            _buildSelectDeviceCard(context, availableDevices),
          ),
        ],
      ],
    );
  }

  // 两张并排卡片：宽屏固定高度左右排列，窄屏上下堆叠
  // [narrowBelowRight] 仅窄屏使用，紧跟在右侧卡片（选择设备）下方
  Widget _buildCardPair(
    BuildContext context,
    Widget left,
    Widget right, {
    Widget? narrowBelowRight,
  }) {
    if (_isNarrow(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isDesktop)
            _buildMiuixCard(
              context,
              context.l10n.homeConnectionHelp,
              MiuixArrowPreference(
                title: context.l10n.homeNarrowDebugHelp,
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TutorialPage(),
                    ),
                  );
                },
              ),
            )
          else
            _buildMiuixCard(
              context,
              context.l10n.homeConnectionHelp,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MiuixBasicComponent(
                    title: context.l10n.homeNarrowWiredHelp,
                  ),
                  MiuixArrowPreference(
                    title: context.l10n.homeNarrowDebugHelp,
                    onClick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TutorialPage(),
                      ),
                    ),
                  ),
                  MiuixArrowPreference(
                    title: context.l10n.homeNarrowDriverHelp,
                    onClick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DriverPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
          right,
          if (narrowBelowRight != null) ...[
            const SizedBox(height: 10),
            narrowBelowRight,
          ],
        ],
      );
    }
    return SizedBox(
      height: 162,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: left),
          const SizedBox(width: 5),
          Expanded(child: right),
        ],
      ),
    );
  }

  // 带链接的说明文本：宽屏单行排列，窄屏自动换行
  Widget _buildFlowRow(BuildContext context, List<Widget> children) {
    if (_isNarrow(context)) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: children,
      );
    }
    return Row(children: children);
  }

  Widget _buildSelectDeviceCard(
    BuildContext context,
    List<AdbDeviceInfo> devices,
  ) {
    if (_isNarrow(context)) {
      return _buildNarrowSelectDeviceCard(context, devices);
    }
    final String? dropdownValue =
        devices.any((AdbDeviceInfo device) => device.adbId == _selectedAdbId)
            ? _selectedAdbId
            : null;

    return Card(
      color: context.palette.surface,
      elevation: 0,
      child: Padding(
        padding: _isNarrow(context)
            ? const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 14)
            : const EdgeInsets.only(left: 18.0, right: 18, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.homeSelectDevice,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BlurDropdown<String>(
              bordered: true,
              value: dropdownValue,
              hint: context.l10n.homeNoConnectedDevices,
              items: devices
                  .map(
                    (AdbDeviceInfo device) => BlurMenuItem<String>(
                      value: device.adbId,
                      label: '${device.model} (${device.deviceId})',
                    ),
                  )
                  .toList(),
              onChanged: (String value) {
                setState(() {
                  _selectedAdbId = value;
                });
              },
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: context.palette.button,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.0),
                      onTap: _isRefreshing ? null : _refreshDevices,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isRefreshing)
                              Padding(
                                padding: EdgeInsetsGeometry.only(right: 4),
                                child: SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1.5,
                                    color: context.palette.text,
                                  ),
                                ),
                              ),
                            if (!_isRefreshing)
                              Icon(
                                Icons.refresh,
                                size: 18,
                                color: context.palette.text,
                              ),
                            const SizedBox(width: 4),
                            Text(
                              _isRefreshing
                                  ? context.l10n.homeRefreshing
                                  : context.l10n.homeRefreshDevices,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: context.palette.text,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Card(
                    color: context.palette.button,
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
                              builder: (context) => const WirelessPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.wifi, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              context.l10n.wirelessPageTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: context.palette.text,
                                fontSize: 14,
                              ),
                            ),
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
      showAppSnackbar(context.l10n.homeDevicesRefreshed);
    } catch (e) {
      if (!mounted) {
        return;
      }
      showAppSnackbar(context.l10n.homeRefreshFailed(e.toString()));
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
        l10n.deviceBrand(localizeDeviceValue(l10n, device.brand)),
        l10n.deviceResolution(localizeDeviceValue(l10n, device.resolution)),
      ],
      [
        l10n.deviceModel(localizeDeviceValue(l10n, device.model)),
        l10n.deviceDpi(localizeDeviceValue(l10n, device.dpi)),
      ],
      [
        l10n.deviceSerial(localizeDeviceValue(l10n, device.deviceId)),
        l10n.deviceMemory(localizeMemoryUsage(l10n, device.memory)),
      ],
      [
        l10n.deviceUptime(localizeUptime(l10n, device.uptime)),
        l10n.deviceStorage(localizeDeviceValue(l10n, device.storage)),
      ],
      [
        l10n.deviceBootloader(
          localizeBootloaderStatus(l10n, device.bootloaderStatus),
        ),
        l10n.deviceArchitecture(localizeDeviceValue(l10n, device.cpuArch)),
      ],
      [
        batteryLevelText,
        l10n.deviceBatteryHealth(
          localizeBatteryHealth(l10n, device.batteryHealth),
        ),
      ],
      [batteryVoltageText, batteryTemperatureText],
      [
        l10n.deviceAndroidVersion(
          localizeDeviceValue(l10n, device.androidVersion),
        ),
        l10n.devicePatchDate(localizeDeviceValue(l10n, device.patchDate)),
      ],
      [
        l10n.deviceSoftwareVersion(
          localizeDeviceValue(l10n, device.softwareVersion),
        ),
        l10n.deviceKernelVersion(
          localizeDeviceValue(l10n, device.kernelVersion),
        ),
      ],
    ];

    // 窄屏：卡片上方显示分类文本，卡片内每项为 miuix 基础行。
    if (_isNarrow(context)) {
      final MiuixThemeData theme = MiuixTheme.of(context);
      final double maxValueWidth = MediaQuery.sizeOf(context).width * 0.5;
      return _buildMiuixCard(
        context,
        l10n.homeDeviceInfo,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final String text in allInfoRows.expand((pair) => pair))
              Builder(
                builder: (context) {
                  final (String title, String value) = _splitTitleValue(text);
                  return MiuixBasicComponent(
                    title: title,
                    endActions: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxValueWidth),
                        child: Text(
                          value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textStyles.body2.copyWith(
                            color: theme.colors.onSurfaceVariantActions,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      );
    }

    return Card(
      color: context.palette.surface,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          right: 18,
          left: 18,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.homeDeviceInfo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            ...allInfoRows.map(
              (pair) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  children: [
                    Expanded(child: _buildTitleValueCell(pair[0])),
                    const SizedBox(width: 18),
                    Expanded(child: _buildTitleValueCell(pair[1])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 窄屏 miuix 卡片：与其它卡片对齐外边距，并按超椭圆圆角裁剪内容，
  // 避免行的按压 / 悬停底色露出直角
  Widget _buildNarrowSectionTitle(BuildContext context, String title) {
    final theme = MiuixTheme.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MiuixBasicComponentDefaults.insideMargin.left,
        8,
        MiuixBasicComponentDefaults.insideMargin.right,
        8,
      ),
      child: MiuixText(
        title,
        style: theme.textStyles.footnote1,
        color: theme.colors.onBackgroundVariant,
      ),
    );
  }

  Widget _buildMiuixCard(BuildContext context, String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildNarrowSectionTitle(context, title),
        MiuixCard(
          insideMargin: EdgeInsets.zero,
          child: ClipPath(
            clipper: const ShapeBorderClipper(
              shape: MiuixSquircleBorder(
                cornerRadius: MiuixCardDefaults.cornerRadius,
              ),
            ),
            child: child,
          ),
        ),
      ],
    );
  }

  // 窄屏标题栏右上角：刷新设备（刷新中显示进度）
  Widget _buildRefreshAction(BuildContext context) {
    return Builder(
      builder: (context) {
        final Color tint = MiuixTheme.of(context).colors.onBackground;
        return MiuixIconButton(
          enabled: !_isRefreshing,
          onPressed: _refreshDevices,
          child: _isRefreshing
              ? SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: tint),
                )
              // 与电源图标同一套线条风格（24×24，线宽 1.8）
              : SvgPicture.asset(
                  'assets/sidebar/refresh.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
                ),
        );
      },
    );
  }

  // 窄屏选择设备卡片：miuix 下拉偏好行（选择设备）+ 箭头偏好行（无线连接）
  Widget _buildNarrowSelectDeviceCard(
    BuildContext context,
    List<AdbDeviceInfo> devices,
  ) {
    final l10n = context.l10n;
    final int selected = devices.indexWhere(
      (AdbDeviceInfo device) => device.adbId == _selectedAdbId,
    );
    return _buildMiuixCard(
      context,
      l10n.homeSelectDevice,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MiuixOverlayDropdownPreference(
            title: l10n.homeSelectDevice,
            items: devices.isEmpty
                ? [l10n.homeNoConnectedDevices]
                : [
                    for (final AdbDeviceInfo device in devices)
                      '${device.model} (${device.deviceId})',
                  ],
            selectedIndex: selected < 0 ? 0 : selected,
            enabled: devices.isNotEmpty,
            onSelectedIndexChange: (int index) {
              setState(() {
                _selectedAdbId = devices[index].adbId;
              });
            },
          ),
          MiuixArrowPreference(
            title: l10n.homeConnectionWirelessLink,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WirelessPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  // 窄屏标题栏右上角的 miuix 菜单：重启到各模式
  Widget _buildRebootMenu(BuildContext context, String? selectedAdbId) {
    final l10n = context.l10n;
    final List<(String, List<String>)> targets = [
      ('Recovery', ['reboot', 'recovery']),
      ('Bootloader', ['reboot', 'bootloader']),
      ('Fastbootd', ['reboot', 'fastboot']),
      (l10n.homeSystem, ['shell', 'reboot', '-p']),
      ('9008', ['reboot', 'edl']),
    ];
    return MiuixOverlayIconDropdownMenu(
      entry: MiuixDropdownEntry(
        items: [
          for (final (String text, List<String> args) in targets)
            MiuixDropdownItem(
              text: '${l10n.homeRebootTo} $text',
              onClick: () => _runAdbCommand(selectedAdbId, args),
            ),
        ],
      ),
      child: Builder(
        builder: (context) => SvgPicture.asset(
          'assets/sidebar/power.svg',
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            MiuixTheme.of(context).colors.onBackground,
            BlendMode.srcIn,
          ),
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
        color: context.palette.button,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          onTap: () => _runAdbCommand(selectedAdbId, adbArgs),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: context.palette.text, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _runAdbCommand(String? selectedAdbId, List<String> args) async {
    if (selectedAdbId == null || selectedAdbId.isEmpty) {
      showAppSnackbar(context.l10n.homeSelectDeviceFirst);
      return;
    }
    try {
      final ProcessResult result = await Process.run(
          adbPath,
          <String>[
            '-s',
            selectedAdbId,
            ...args,
          ],
          environment: toolEnvironment);
      if (!mounted) {
        return;
      }
      final String stderr = result.stderr.trim();
      if (result.exitCode == 0) {
        showAppSnackbar(context.l10n.homeCommandSent);
      } else {
        showAppSnackbar(
          stderr.isNotEmpty
              ? stderr
              : context.l10n.commandExitFailure(result.exitCode.toString()),
        );
      }
    } catch (e) {
      if (!mounted) {
        return;
      }
      showAppSnackbar(context.l10n.homeAdbError(e.toString()));
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
            style: TextStyle(
              fontSize: 16,
              color: context.palette.textSecondary,
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
