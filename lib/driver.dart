import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

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
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20), // 返回图标
                        onPressed: () {
                          Navigator.pop(context); // 返回到上一个页面
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'USB 驱动安装指南', // 页面标题
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'MiSansLight', // 使用自定义字体
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30, top: 20), // 设置页面内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '本教程仅适用于 Windows 系统，使用 MacOS 或 Linux 系统的用户无需安装 USB 驱动',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 22),
            const Text(
              '1. 下载 USB 驱动程序',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  '进入 ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 5),
                MouseRegion(
                  cursor: SystemMouseCursors.click, // 设置鼠标光标为点击手型
                  child: GestureDetector(
                    onTap: () {
                      // 打开驱动程序下载链接
                      _launchURL('https://developer.android.google.cn/studio/run/win-usb');
                    },
                    child: const Text(
                      'Android USB 驱动',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 30, 93, 229),
                        
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  ' 下载页面（此网址可在中国大陆直接访问）',
                  style: TextStyle(fontSize: 16),
                ),
                
              ],
            ),
             
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/0.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 20),
            const Text(
                  '点击 “Download the Google USB Driver ZIP file (ZIP)” 同意许可后下载 “usb_driver_r13-windows.zip” 并解压至任意位置。',
                  style: TextStyle(fontSize: 16),
                ),
            const SizedBox(height: 30),
            const Text(
              '2. 打开 “设备管理器” ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '打开设置并进入 系统信息，打开 “设备管理器” 。',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/1.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 30),
            const Text(
              '3. 连接设备',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '将您的设备通过数据线/充电底座连接电脑，在设备管理器中找到 其它设备 或 便携式设备 选项并展开。',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              '4. 更新驱动程序',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '右键单击您连接的设备的名称，然后选择 更新驱动程序。',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              '5. 在弹出的窗口中选择浏览我的电脑以查找驱动程序',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/2.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 30),
            const Text(
              '6. 选择驱动程序 ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '点击 浏览 然后找到您刚下载的 USB 驱动程序文件夹 “usb_driver_r13-windows”。',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/3.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 30),
            const Text(
              '7. 安装驱动程序',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '点击 下一步 安装驱动程序，随后安装完成。',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 打开 URL 的方法
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '无法打开链接: $url';
    }
  }
}
