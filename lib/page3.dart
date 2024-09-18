import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'donate.dart'; // 导入donate.dart

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // 设置AppBar的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 20), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(), // 允许拖动窗口
            child: Container(
              color: Colors.transparent, // 设置为透明背景
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右对齐
                children: [
                  const Text(
                    '柚坛手表助手', // 可以显示当前页面的名称
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: 'MiSansLight', // 使用自定义字体
                    ),
                  ),
                  Row(
                    children: [
                      // 最小化按钮
                      IconButton(
                        icon: Image.asset('assets/mini.png'),
                        onPressed: () {
                          windowManager.minimize();
                        },
                      ),
                      // 关闭按钮
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
      body: Column(
        children: [
          // 固定版本号文本，居左对齐
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '版本: 16.0   开发&设计: Gnayoah', // 版本号文本
                style: TextStyle(fontSize: 16, fontFamily: 'MiSansLight'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0), // 列表的外边距
              children: [
                _buildOptionCard(context, '常见问题', '不会使用、无法连接或无法操作，请先阅读常见问题说明', 'assets/icons/help_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png'),
                const SizedBox(height: 10), // 添加空隙
                _buildOptionCard(context, '捐赠', '本项目为免费项目，感谢捐赠支持 (❁´◡`❁)', 'assets/icons/volunteer_activism_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png'),
                const SizedBox(height: 10), // 添加空隙
                _buildOptionCard(context, '问题反馈', '反馈 Bug 或其他问题，请先阅读常见问题，如无法解决请向我们反馈', 'assets/icons/feedback_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png', isEmail: true),
                const SizedBox(height: 10), // 添加空隙
                _buildOptionCard(context, '访问官网', '提供 Windows、MacOS 和 Linux 最新版本免费下载', 'assets/icons/globe_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png', url: 'http://wear.gnayoah.com'),
                const SizedBox(height: 10), // 添加空隙
                _buildOptionCard(context, '访问柚坛社区', '玩机交流社群', 'assets/icons/uotan.png', url: 'http://uotan.cn'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, String title, String subtitle, String iconPath, {String? url, bool isEmail = false}) {
    return Material(
      color: const Color(0xFFF9F9F9), // Card 背景颜色为 #F9F9F9
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // 设置圆角
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0), // 设置悬浮时的圆角效果
        onTap: () {
          if (isEmail) {
            _launchEmail(); // 发送邮件
          } else if (url != null) {
            _launchURL(url); // 打开指定URL
          } else if (title == '捐赠') {
            // 导航到捐赠页面
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DonatePage()),
            );
          } else {
            print('$title 被点击');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle), // 添加小字文本
            leading: Image.asset(
              iconPath,
              width: 20, // 自定义图标的宽度
              height: 20, // 自定义图标的高度
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14, // 设置trailing图标大小
            ),
          ),
        ),
      ),
    );
  }

  // 打开指定的URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication); // 在外部浏览器打开
    } else {
      print('无法打开URL: $url');
    }
  }

  // 发送邮件
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'feedback@Gnayoah.com',
      queryParameters: {
        'subject': '柚坛手表助手 - 问题反馈',
        'body': '反馈日期：\n系统版本：\n反馈内容：'
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      print('无法发送邮件至: ${emailUri.toString()}');
    }
  }
}
