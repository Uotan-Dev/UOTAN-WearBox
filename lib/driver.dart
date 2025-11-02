import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 20), // 返回图标
                        onPressed: () {
                          Navigator.pop(context); // 返回到上一个页面
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.driverTitle,
                        style: const TextStyle(
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
        padding: const EdgeInsets.only(
            left: 30.0, right: 30, bottom: 30, top: 20), // 设置页面内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.driverIntro,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 22),
            Text(
              l10n.driverStep1Title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  l10n.driverStep1LinkPrefix,
                  style: const TextStyle(fontSize: 16),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click, // 设置鼠标光标为点击手型
                  child: GestureDetector(
                    onTap: () => _launchURL(
                      context,
                      'https://developer.android.google.cn/studio/run/win-usb',
                    ),
                    child: Text(
                      l10n.driverStep1LinkText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 30, 93, 229),
                      ),
                    ),
                  ),
                ),
                Text(
                  l10n.driverStep1LinkSuffix,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/0.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 20),
            Text(
              l10n.driverStep1DownloadInstructions,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.driverStep2Title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.driverStep2Description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/1.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 30),
            Text(
              l10n.driverStep3Title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.driverStep3Description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.driverStep4Title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.driverStep4Description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.driverStep5Title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/2.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 30),
            Text(
              l10n.driverStep6Title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.driverStep6Description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/driver/3.png', // 指定第一步的图片路径
              fit: BoxFit.contain, // 调整图片的适应方式
            ),
            const SizedBox(height: 30),
            Text(
              l10n.driverStep7Title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.driverStep7Description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 打开 URL 的方法
  void _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception(context.l10n.driverUrlLaunchError(url));
    }
  }
}
