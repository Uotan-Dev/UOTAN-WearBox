import 'package:flutter/material.dart';
import 'package:watch_assistant/utils.dart';
import 'package:watch_assistant/l10n/l10n.dart';
import 'package:window_manager/window_manager.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'adb_device_info.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onLocaleChanged,
    required this.locale,
  });

  final ValueChanged<Locale?> onLocaleChanged;
  final Locale? locale;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WindowListener {
  int _selectedIndex = 0;
  List<AdbDeviceInfo> _devices = []; // 用于存储设备信息
  double currentVersion = 16.1; // 当前应用版本号
  bool _isCheckingUpdate = true; // 是否正在检查更新的状态

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    checkAdbDevicesPeriodically(
      setState: setState,
      onDevicesUpdated: (devices) {
        setState(() {
          _devices = devices;
        });
      },
    );
    _checkNetworkAndUpdate(); // 初始化时检查网络和版本更新
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  final List<Widget> _pages = [];

  // 检查网络连接并访问URL
  Future<void> _checkNetworkAndUpdate() async {
    await Future.delayed(const Duration(milliseconds: 500)); // 修改延迟为0.5秒
    setState(() {
      _isCheckingUpdate = true; // 开始检查时显示进度条
    });

    try {
      // 尝试发送请求到 wear.gnayoah.com
      final response = await http.get(Uri.parse('https://wear.gnayoah.com'));
      if (response.statusCode == 200) {
        // 网站访问正常，继续检查版本更新
        await _checkForUpdates();
      } else {
        // 无法访问，显示错误提示
        _showNoNetworkDialog('请检查网络或稍后再试。');
      }
    } catch (e) {
      // 捕获异常，显示网络错误提示
      _showNoNetworkDialog('请检查网络或稍后再试。');
    } finally {
      setState(() {
        _isCheckingUpdate = false; // 检查完成后隐藏进度条
      });
    }
  }

  // 检查远程版本号是否最新
  Future<void> _checkForUpdates() async {
    try {
      final response = await http.get(
        Uri.parse('https://wear.gnayoah.com/version/windows.txt'),
      );

      if (response.statusCode == 200) {
        final lines = response.body.split('\n');
        double _safeParseDouble(String s) {
          return double.tryParse(s) ?? 0.0;
        }

// 使用
        final remoteVersion = _safeParseDouble(
          lines
              .firstWhere((line) => line.startsWith('[version]'))
              .replaceAll('[version]', '')
              .trim(),
        );

        final releaseDate = lines
            .firstWhere((line) => line.startsWith('[date]'))
            .replaceAll('[date]', '')
            .trim();

        if (remoteVersion > currentVersion) {
          _showUpdateDialog(remoteVersion, releaseDate);
        }
      } else {
        print('Failed to load version info');
      }
    } catch (e) {
      print('Error checking version: $e');
    }
  }

  // 显示更新提示框，带有发布日期和去更新按钮
  void _showUpdateDialog(double remoteVersion, String releaseDate) {
    showDialog(
      context: context,
      barrierDismissible: false, // 设置为false，禁止点击对话框外部区域取消
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: Text(l10n.updateDialogTitle),
          content: Text(l10n.updateDialogMessage(remoteVersion, releaseDate)),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(
                          255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              // child: const Text('下次一定'),
              child: const Text(''),
              onPressed: () {
                //  Navigator.of(context).pop(); // 关闭对话框
              },
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(
                          255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: Text(l10n.updateDialogUpdate),
              onPressed: () {
                _launchURL(); // 点击跳转到浏览器
              },
            ),
          ],
        );
      },
    );
  }

  // 显示无网络连接或无法访问的提示框
  void _showNoNetworkDialog([String? message]) {
    showDialog(
      context: context,
      barrierDismissible: false, // 设置为false，禁止点击对话框外部区域取消
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: Text(l10n.networkErrorTitle),
          content: Text(message ?? l10n.networkErrorMessage),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(
                          255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: Text(l10n.networkErrorExit),
              onPressed: () {
                windowManager.close();
              },
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(
                          255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: Text(l10n.networkErrorRetry),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
                _checkNetworkAndUpdate(); // 重新检查网络
              },
            ),
          ],
        );
      },
    );
  }

  // 打开浏览器跳转到指定URL
  void _launchURL() async {
    const url = 'https://wear.gnayoah.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    _pages
      ..clear()
      ..add(Page1(devices: _devices))
      ..add(const Page2())
      ..add(Page3(
        onLocaleChanged: widget.onLocaleChanged,
        currentLocale: widget.locale,
        currentVersion: '$currentVersion',
      ));

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500), // 动画时长
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child); // 使用淡入淡出过渡
        },
        child: _isCheckingUpdate
            ? Center(
                key: const ValueKey('loading'), // 唯一键值
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 垂直居中对齐
                  children: [
                    /// const SizedBox(height: 80),
                    /// Image.asset(
                    //   'assets/logo2.png', // 加载 logo
                    //   width: 120, // 设置 Logo 的宽度
                    //   height: 120, // 设置 Logo 的高度
                    //  ),
                    //  const SizedBox(height: 80),
                    const SizedBox(
                      width: 60, // 设置进度条的宽度
                      height: 60, // 设置进度条的高度
                      child: CircularProgressIndicator(
                        strokeWidth: 4, // 设置进度条的粗细，默认是 4.0
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                key: const ValueKey('content'), // 唯一键值
                children: [
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.all, // 始终显示按钮文本
                    groupAlignment: 0.0, // 按钮上下居中
                    backgroundColor: const Color(0xFFF9F9F9), // 设置背景颜色为 #F9F9F9
                    useIndicator: true, // 启用指示器
                    indicatorColor:
                        const Color.fromARGB(255, 237, 237, 237), // 选中项的背景颜色
                    destinations: [
                      NavigationRailDestination(
                        icon: const Icon(Icons.home_filled),
                        selectedIcon: const Icon(Icons.home_filled),
                        label: Text(
                          context.l10n.navigationHome,
                          style: const TextStyle(fontSize: 13), // 调整文本大小为13
                        ),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.view_cozy),
                        selectedIcon: const Icon(Icons.view_cozy),
                        label: Text(
                          context.l10n.navigationFeatures,
                          style: const TextStyle(fontSize: 13), // 调整文本大小为13
                        ),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.settings),
                        selectedIcon: const Icon(Icons.settings),
                        label: Text(
                          context.l10n.navigationAbout,
                          style: const TextStyle(fontSize: 13), // 调整文本大小为13
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: _pages[_selectedIndex],
                  ),
                ],
              ),
      ),
    );
  }
}
