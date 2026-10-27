import 'dart:io';
import 'platform_tools.dart';

import 'package:flutter/material.dart';
import 'package:watch_assistant/wireless.dart';
import 'package:window_manager/window_manager.dart';

import 'adb_device_info.dart';
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
  int _infoPage = 0; // 窄屏下设备信息的当前页
  bool _infoPageForward = true; // 最近一次翻页方向，决定滑动动画方向

  // 窄屏下设备信息每页显示的条目数
  static const int _infoItemsPerPage = 6;

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
    final bool narrow = _isNarrow(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 00),
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(),
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
                      Image.asset(
                        'assets/new_logo.png',
                        height: 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Builder(builder: (context) {
        final Widget content = Padding(
          padding: narrow
              ? const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 16)
              : const EdgeInsets.only(right: 25, left: 25, top: 10),
          child: selectedDevice == null
              ? _buildNoDeviceConnected(context)
              : _buildDeviceInfo(
                  context,
                  selectedDevice,
                  availableDevices: widget.devices,
                  selectedAdbId: _selectedAdbId,
                ),
        );
        // 窄屏下内容高度超出窗口，改为可滚动
        return narrow ? SingleChildScrollView(child: content) : content;
      }),
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
        // 窄屏下未连接设备时隐藏占位的设备信息卡片
        if (_isNarrow(context))
          const SizedBox(height: 8)
        else ...[
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
            color: const Color(0xFFF9F9F9),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.homeConnectionHelp,
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
                  _buildFlowRow(
                    context,
                    [
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
                                builder: (context) => const WirelessPage(),
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
                  _buildFlowRow(
                    context,
                    [
                      Text(
                        context.l10n.homeCheckDebugPrefix,
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
                  ),
                ],
              ),
            ),
          ),
          _buildSelectDeviceCard(context, const <AdbDeviceInfo>[]),
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
          _buildCardPair(
            context,
            Card(
              color: const Color(0xFFF9F9F9),
              elevation: 0,
              child: Padding(
                padding: _isNarrow(context)
                    ? const EdgeInsets.only(
                        left: 18.0, right: 18, top: 18, bottom: 14)
                    : const EdgeInsets.only(left: 18.0, right: 18, top: 18),
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
                    if (_isNarrow(context))
                      Wrap(
                        spacing: 4,
                        children: [
                          for (final (String text, List<String> args) in [
                            ('Recovery', ['reboot', 'recovery']),
                            ('Bootloader', ['reboot', 'bootloader']),
                            ('Fastbootd', ['reboot', 'fastboot']),
                            (
                              context.l10n.homeSystem,
                              ['shell', 'reboot', '-p']
                            ),
                            ('9008', ['reboot', 'edl']),
                          ])
                            _buildRebootButton(
                              context,
                              text: text,
                              selectedAdbId: selectedAdbId,
                              adbArgs: args,
                            ),
                        ],
                      )
                    else
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
  Widget _buildCardPair(BuildContext context, Widget left, Widget right) {
    if (_isNarrow(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [left, const SizedBox(height: 5), right],
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
                              _isRefreshing
                                  ? context.l10n.homeRefreshing
                                  : context.l10n.homeRefreshDevices,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.wifi, size: 18),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              context.l10n.wirelessPageTitle,
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
        SnackBar(content: Text(context.l10n.homeDevicesRefreshed)),
      );
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.homeRefreshFailed(e.toString()))),
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
        l10n.deviceBrand(localizeDeviceValue(l10n, device.brand)),
        l10n.deviceResolution(localizeDeviceValue(l10n, device.resolution))
      ],
      [
        l10n.deviceModel(localizeDeviceValue(l10n, device.model)),
        l10n.deviceDpi(localizeDeviceValue(l10n, device.dpi))
      ],
      [
        l10n.deviceSerial(localizeDeviceValue(l10n, device.deviceId)),
        l10n.deviceMemory(localizeMemoryUsage(l10n, device.memory))
      ],
      [
        l10n.deviceUptime(localizeUptime(l10n, device.uptime)),
        l10n.deviceStorage(localizeDeviceValue(l10n, device.storage))
      ],
      [
        l10n.deviceBootloader(
            localizeBootloaderStatus(l10n, device.bootloaderStatus)),
        l10n.deviceArchitecture(localizeDeviceValue(l10n, device.cpuArch))
      ],
      [
        batteryLevelText,
        l10n.deviceBatteryHealth(
            localizeBatteryHealth(l10n, device.batteryHealth))
      ],
      [batteryVoltageText, batteryTemperatureText],
      [
        l10n.deviceAndroidVersion(
            localizeDeviceValue(l10n, device.androidVersion)),
        l10n.devicePatchDate(localizeDeviceValue(l10n, device.patchDate))
      ],
      [
        l10n.deviceSoftwareVersion(
            localizeDeviceValue(l10n, device.softwareVersion)),
        l10n.deviceKernelVersion(
            localizeDeviceValue(l10n, device.kernelVersion))
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
            if (_isNarrow(context))
              ..._buildPagedInfoItems(
                allInfoRows.expand((pair) => pair).toList(),
              )
            else ...[
              Text(
                context.l10n.homeDeviceInfo,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
            ],
            if (!_isNarrow(context))
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

  // 窄屏设备信息：标题栏带左右箭头分页，避免单列条目过长
  List<Widget> _buildPagedInfoItems(List<String> items) {
    final int pageCount = (items.length / _infoItemsPerPage).ceil();
    final int page = _infoPage.clamp(0, pageCount - 1);
    final int start = page * _infoItemsPerPage;
    final int end = (start + _infoItemsPerPage).clamp(0, items.length);

    Widget arrow({required bool left, required int? target}) => IconButton(
          icon: CustomPaint(
            size: const Size(16, 16),
            painter: ChevronPainter(
              direction: left ? AxisDirection.left : AxisDirection.right,
              color: target == null
                  ? const Color(0xFFC4C4C4)
                  : const Color(0xE6000000),
            ),
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints.tightFor(width: 28, height: 24),
          splashRadius: 16,
          // 不额外扩展到 48px 点击区域，避免撑高标题行
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: target == null
              ? null
              : () => setState(() {
                    _infoPageForward = target > page;
                    _infoPage = target;
                  }),
        );

    return [
      Row(
        children: [
          Text(
            context.l10n.homeDeviceInfo,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // 右移翻页控件，使右箭头笔画的右端与下方数据右对齐：
          // 按钮内边距 (28 - 16) / 2 + 箭头图形右侧留白 16 * 8 / 24
          Transform.translate(
            offset: const Offset(6 + 16 * 8 / 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                arrow(left: true, target: page > 0 ? page - 1 : null),
                Text(
                  '${page + 1}/$pageCount',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 132, 132, 132),
                  ),
                ),
                arrow(
                  left: false,
                  target: page < pageCount - 1 ? page + 1 : null,
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 6),
      // 翻页动画：新页从翻页方向滑入并淡入，旧页反向滑出并淡出
      ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          layoutBuilder: (currentChild, previousChildren) => Stack(
            alignment: Alignment.topLeft,
            children: [
              ...previousChildren,
              if (currentChild != null) currentChild
            ],
          ),
          transitionBuilder: (child, animation) {
            final bool incoming = child.key == ValueKey<int>(page);
            final double direction = _infoPageForward ? 1 : -1;
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset((incoming ? 0.3 : -0.3) * direction, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Column(
            key: ValueKey<int>(page),
            children: [
              for (final String text in items.sublist(start, end))
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: _buildTitleValueCell(text),
                ),
            ],
          ),
        ),
      ),
    ];
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
        SnackBar(content: Text(context.l10n.homeSelectDeviceFirst)),
      );
      return;
    }
    try {
      final ProcessResult result =
          await Process.run(adbPath, <String>['-s', selectedAdbId, ...args]);
      if (!mounted) {
        return;
      }
      final messenger = ScaffoldMessenger.of(context);
      final String stderr = result.stderr.trim();
      if (result.exitCode == 0) {
        messenger.showSnackBar(
          SnackBar(content: Text(context.l10n.homeCommandSent)),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              stderr.isNotEmpty
                  ? stderr
                  : context.l10n.commandExitFailure(result.exitCode.toString()),
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.homeAdbError(e.toString()))),
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
