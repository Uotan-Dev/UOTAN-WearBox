import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final ScrollController _scrollController = ScrollController(); // 用于控制滚动

  // 定义每个问题的 GlobalKey，以便于跳转到对应位置
  final GlobalKey _keyQuestion1 = GlobalKey();
  final GlobalKey _keyQuestion2 = GlobalKey();
  final GlobalKey _keyQuestion3 = GlobalKey();
  final GlobalKey _keyQuestion4 = GlobalKey();
  final GlobalKey _keyQuestion5 = GlobalKey(); 
  final GlobalKey _keyQuestion6 = GlobalKey(); // 新增第6个问题的 GlobalKey

  // 滚动到指定问题的函数
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500), // 滚动的动画时间
        curve: Curves.easeInOut, // 滚动的效果
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0), // 设置 AppBar 的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 40), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(), // 允许拖动窗口
            child: Container(
              color: Colors.transparent, // 设置为透明背景
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右对齐
                children: [
                  Row(
                    children: [
                      // 添加返回按钮
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 20), // 返回图标
                        onPressed: () {
                          Navigator.pop(context); // 返回到上一个页面
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '常见问题', // 页面标题
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'MiSansLight', // 使用自定义字体
                        ),
                      ),
                    ],
                  ),
                  // 使用 Builder 包裹菜单图标
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black, size: 24), // 菜单图标
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer(); // 打开 Drawer
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // 添加 Drawer 菜单
      endDrawer: Drawer(
        backgroundColor: Color(0xFFf9f9f9), // 设置 Drawer 背景颜色为白色
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                '目录',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
            ),
            // 点击菜单滚动到第一个问题
            ListTile(
              title: const Text('设备无法连接'),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion1); // 滚动到第一个问题
              },
            ),
            // 点击菜单滚动到第二个问题
            ListTile(
              title: const Text('如何启用 USB 调试'),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion2); // 滚动到第二个问题
              },
            ),
            // 点击菜单滚动到第三个问题
            ListTile(
              title: const Text('为什么我的设备显示的是 ADB 调试'),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion3); // 滚动到第三个问题
              },
            ),
            // 点击菜单滚动到第四个问题
            ListTile(
              title: const Text('如何通过无线连接'),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion4); // 滚动到第四个问题
              },
            ),
            // 点击菜单滚动到第五个问题
            ListTile(
              title: const Text('如何获取无线调试IP地址和端口号'),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion5); // 滚动到第五个问题
              },
            ),
            // 点击菜单滚动到第六个问题
            ListTile(
              title: const Text('部分功能没反应'),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion6); // 滚动到第六个问题
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 10, top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // 第一个问题
            Container(
              key: _keyQuestion1, // 关键点，用于滚动到这里
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. 设备无法连接或无法检测到设备',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '请确保已启用 USB 调试功能，并在设备连接时授权 USB 调试权限。这是柚坛手表助手与您的设备进行通信的必要条件。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // 第二个问题
            Container(
              key: _keyQuestion2,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. 如何启用 USB 调试模式',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '请按照以下步骤操作：',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text('• 进入 ', style: TextStyle(fontSize: 16)),
                      Text('系统设置', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('，找到并点击 ', style: TextStyle(fontSize: 16)),
                      Text('关于本机', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('。', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('• 连续点击 ', style: TextStyle(fontSize: 16)),
                      Text('版本号', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(' 数次，直至提示已进入开发者模式。', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('• 返回 ', style: TextStyle(fontSize: 16)),
                      Text('设置', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(' 主界面，进入 ', style: TextStyle(fontSize: 16)),
                      Text('开发者选项', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('。', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('• 在开发者选项中，启用 ', style: TextStyle(fontSize: 16)),
                      Text('USB 调试', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(' 功能。', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // 第三个问题
            Container(
              key: _keyQuestion3,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3. 为什么我的设备显示的是 ADB 调试',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'ADB 调试 与 USB 调试 实质上是相同的功能。ADB 调试是通过 USB 接口与设备进行通信和调试的方式，因此两者没有区别。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // 第四个问题
            Container(
              key: _keyQuestion4,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4. 如何通过无线连接',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '要实现设备的无线调试连接，请确保以下设置正确：',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '• 确保您的计算机和手表设备处于同一局域网内（无论是 2.4GHz 还是 5GHz 网络，关键在于设备需位于相同的 IP 网段内）。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text('• 在手表的开发者选项中，启用 ', style: TextStyle(fontSize: 16)),
                      Text('无线调试', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(' 或 ', style: TextStyle(fontSize: 16)),
                      Text('WLAN 调试', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(' 功能。', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '启用无线调试选项后，即可通过柚坛手表助手与手表进行无线操作。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // 第五个问题
            Container(
              key: _keyQuestion5,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5. 如何获取无线调试IP地址和端口号',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '您可以通过以下步骤获取：',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '进入手表的开发者选项，找到并点击“无线调试信息”，即可查看当前设备的 IP 地址和端口号。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // 第六个问题：新增的功能没反应问题
            Container(
              key: _keyQuestion6,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6. 部分功能没反应',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '部分功能可能会因为不同品牌系统的限制而不可用，特别是定制安卓系统。柚坛手表助手支持90%的定制安卓系统功能，典型设备如 OPPO Watch、Meizu Watch 等。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'WearOS by Google 系统设备支持 99% 的功能，典型设备如 Pixel Watch、Mi Watch、TicWatch 等。您可以多次重试操作。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '如遇某功能无效，您可以重试操作或重新连接设备。',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
