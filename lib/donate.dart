import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0), // 设置AppBar的高度
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
                        '捐赠', // 页面标题
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0), // 设置顶部和底部边距
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // 中心对齐
            children: [
               const SizedBox(height: 15), // 添加空隙
              const Align(
                alignment: Alignment.center, // 文本居中对齐
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0), // 为文本添加水平边距
                  child: Text(
                    '欢迎捐赠！感谢您的支持！', // 捐赠页面的内容
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 第一个二维码图片的卡片
                  Card(
                    color: const Color(0xFFF9F9F9), // Card 背景颜色为 #F9F9F9
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // 设置圆角
                    ),
                    elevation: 0, // 去掉阴影
                    child: Padding(
                      padding: const EdgeInsets.all(10.0), // 图片周围的内边距
                      child: Image.network(
                        'https://wear.gnayoah.com/wx.jpg',
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // 第二个二维码图片的卡片
                  Card(
                    color: const Color(0xFFF9F9F9), // Card 背景颜色为 #F9F9F9
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // 设置圆角
                    ),
                    elevation: 0, // 去掉阴影
                    child: Padding(
                      padding: const EdgeInsets.all(10.0), // 图片周围的内边距
                      child: Image.network(
                        'https://wear.gnayoah.com/zfb.jpg',
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
