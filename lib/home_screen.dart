import 'package:flutter/material.dart';
import 'package:watch_assistant/utils.dart';
import 'package:window_manager/window_manager.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'adb_device_info.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WindowListener {
  int _selectedIndex = 0;
  List<AdbDeviceInfo> _devices = []; // 用于存储设备信息
  String currentVersion = '16.0'; // 当前应用版本号
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
        final remoteVersion = lines.firstWhere((line) => line.startsWith('[version]'))
            .replaceAll('[version]', '')
            .trim();
        final releaseDate = lines.firstWhere((line) => line.startsWith('[date]'))
            .replaceAll('[date]', '')
            .trim();

        if (remoteVersion != currentVersion) {
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
  void _showUpdateDialog(String remoteVersion, String releaseDate) {
    showDialog(
      context: context,
      barrierDismissible: false,  // 设置为false，禁止点击对话框外部区域取消
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: const Text('版本更新'),
          content: Text(
              '发现新版本: $remoteVersion\n发布日期: $releaseDate'),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: const Text('下次一定'),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框

              },
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: const Text('立即更新'),
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
  void _showNoNetworkDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // 设置为false，禁止点击对话框外部区域取消
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: const Text('无法连接服务器'),
          content: Text(message),
          actions: [
             TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: const Text('退出'),
              onPressed: () {
               windowManager.close();
              },
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: const Text('重试'),
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
    _pages.clear();
    _pages.add(Page1(devices: _devices));
    _pages.add(const Page2());
    _pages.add(const Page3());

    return Scaffold(
      body: _isCheckingUpdate
           ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 垂直居中对齐
                children: [
                  Image.asset(
                    'assets/logo2.png', // 加载 logo
                    width: 120, // 设置 Logo 的宽度
                    height: 120, // 设置 Logo 的高度
                  ),
                  
                
                ],
              ),
            )
          : Row(
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
                  indicatorColor: const Color.fromARGB(255, 237, 237, 237), // 选中项的背景颜色
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_filled),
                      selectedIcon: Icon(Icons.home_filled),
                      label: Text(
                        '主页',
                        style: TextStyle(fontSize: 13), // 调整文本大小为13
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.view_cozy),
                      selectedIcon: Icon(Icons.view_cozy),
                      label: Text(
                        '功能',
                        style: TextStyle(fontSize: 13), // 调整文本大小为13
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      selectedIcon: Icon(Icons.settings),
                      label: Text(
                        '关于',
                        style: TextStyle(fontSize: 13), // 调整文本大小为13
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
    );
  }
}
