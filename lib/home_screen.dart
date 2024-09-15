import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'adb_device_info.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WindowListener {
  int _selectedIndex = 0;
  List<AdbDeviceInfo> _devices = []; // 用于存储设备信息

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
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  final List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    _pages.clear();
    _pages.add(Page1(devices: _devices));
    _pages.add(const Page2());
    _pages.add(const Page3());

    return Scaffold(
      body: Row(
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
                  style: TextStyle(fontSize: 13), // 调整文本大小为14
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.view_cozy),
                selectedIcon: Icon(Icons.view_cozy),
                label: Text(
                  '功能',
                  style: TextStyle(fontSize: 13), // 调整文本大小为14
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings),
                label: Text(
                  '关于',
                  style: TextStyle(fontSize: 13), // 调整文本大小为14
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
