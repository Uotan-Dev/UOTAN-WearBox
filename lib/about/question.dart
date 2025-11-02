import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

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

  // 将包含 <b>...</b> 标记的本地化字符串渲染为富文本
  Widget _buildRichText(String text, {double fontSize = 16}) {
    final normalStyle = TextStyle(fontSize: fontSize);
    final boldStyle = TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);

    final spans = <TextSpan>[];
    int start = 0;
    while (true) {
      final open = text.indexOf('<b>', start);
      if (open == -1) {
        if (start < text.length) {
          spans.add(TextSpan(text: text.substring(start), style: normalStyle));
        }
        break;
      }
      if (open > start) {
        spans.add(TextSpan(text: text.substring(start, open), style: normalStyle));
      }
      final close = text.indexOf('</b>', open + 3);
      if (close == -1) {
        // 若缺少结束标签，将剩余部分按普通文本处理
        spans.add(TextSpan(text: text.substring(open), style: normalStyle));
        break;
      }
      final boldText = text.substring(open + 3, close);
      spans.add(TextSpan(text: boldText, style: boldStyle));
      start = close + 4;
    }

    return Text.rich(TextSpan(children: spans));
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
                      Text(
                        context.l10n.faqPageTitle,
                        style: const TextStyle(
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
            
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                context.l10n.faqMenuTitle,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
            ),
            // 点击菜单滚动到第一个问题
            ListTile(
              title: Text(context.l10n.faqMenuDeviceCannotConnect),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion1); // 滚动到第一个问题
              },
            ),
            // 点击菜单滚动到第二个问题
            ListTile(
              title: Text(context.l10n.faqMenuHowEnableUsbDebug),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion2); // 滚动到第二个问题
              },
            ),
            // 点击菜单滚动到第三个问题
            ListTile(
              title: Text(context.l10n.faqMenuWhyAdbDebug),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion3); // 滚动到第三个问题
              },
            ),
            // 点击菜单滚动到第四个问题
            ListTile(
              title: Text(context.l10n.faqMenuHowWirelessConnect),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion4); // 滚动到第四个问题
              },
            ),
            // 点击菜单滚动到第五个问题
            ListTile(
              title: Text(context.l10n.faqMenuHowGetWirelessIpPort),
              onTap: () {
                Navigator.pop(context); // 关闭 Drawer
                _scrollToSection(_keyQuestion5); // 滚动到第五个问题
              },
            ),
            // 点击菜单滚动到第六个问题
            ListTile(
              title: Text(context.l10n.faqMenuFeatureNoResponse),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.faqQ1Title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ1Body,
                    style: const TextStyle(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.faqQ2Title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ2Intro,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  _buildRichText(context.l10n.faqQ2Step1),
                  _buildRichText(context.l10n.faqQ2Step2),
                  _buildRichText(context.l10n.faqQ2Step3),
                  _buildRichText(context.l10n.faqQ2Step4),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // 第三个问题
            Container(
              key: _keyQuestion3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.faqQ3Title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ3Body,
                    style: const TextStyle(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.faqQ4Title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ4Intro,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ4Bullet1,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  _buildRichText(context.l10n.faqQ4Bullet2),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ4Conclusion,
                    style: const TextStyle(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.faqQ5Title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ5Intro,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ5Body,
                    style: const TextStyle(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.faqQ6Title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ6Body1,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ6Body2,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    context.l10n.faqQ6Body3,
                    style: const TextStyle(
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
