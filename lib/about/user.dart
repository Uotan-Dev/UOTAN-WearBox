import '../platform_support.dart';
import '../app_theme.dart';
import '../miuix_titled_page.dart';
import 'package:watch_assistant/l10n/l10n.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

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
            context.l10n.agreementParagraph2,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            context.l10n.agreementParagraph3,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph4,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph5,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph6,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph7,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph8,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph9,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph10,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph11,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph12,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph13,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph14,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph15,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph16,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph17,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph18,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph19,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph20,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            context.l10n.agreementParagraph21,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            context.l10n.agreementParagraph22,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph23,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph24,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph25,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph26,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph27,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph28,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph29,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph30,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph31,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph32,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph33,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph34,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph35,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph36,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph37,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph38,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph39,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph40,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph41,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph42,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph43,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph44,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph45,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph46,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph47,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph48,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph49,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph50,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph51,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph52,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph53,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph54,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph55,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph56,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph57,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph58,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph59,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph60,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph61,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph62,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph63,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph64,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph65,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph66,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph67,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph68,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph69,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph70,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph71,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph72,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MiSansMed',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph73,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph74,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.agreementParagraph75,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.agreementParagraph76,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
    if (isNarrowLayout(context)) {
      return MiuixTitledPage(
        title: context.l10n.agreementParagraph1,
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
                        context.l10n.agreementParagraph1, // 页面标题
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
