import '../platform_support.dart';
import '../app_theme.dart';
import '../miuix_titled_page.dart';
import 'package:watch_assistant/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        isNarrowLayout(context) ? 20 : 30,
        20,
        isNarrowLayout(context) ? 20 : 30,
        30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.privacyParagraph2,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            context.l10n.privacyParagraph3,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph4,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph5,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph6,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph7,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph8,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph9,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph10,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph11,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph12,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph13,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph14,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph15,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph16,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph17,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph18,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph19,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph20,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph21,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph22,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph23,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph24,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph25,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph26,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph27,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph28,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph29,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph30,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph31,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph32,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph33,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph34,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.privacyParagraph35,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph36,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph37,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.privacyParagraph38,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
    if (isNarrowLayout(context)) {
      return MiuixTitledPage(
        title: context.l10n.privacyParagraph1,
        showBackButton: true,
        body: body,
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0), // 设置 AppBar 的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 40), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => startWindowDrag(), // 允许拖动窗口
            child: Container(
              color: Colors.transparent, // 设置为透明背景
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右对齐
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: context.palette.text, size: 20), // 返回图标
                        onPressed: () {
                          Navigator.pop(context); // 返回到上一个页面
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        context.l10n.privacyParagraph1, // 页面标题
                        style: TextStyle(
                          color: context.palette.text,
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
      body: body,
    );
  }
}
