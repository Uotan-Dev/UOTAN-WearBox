import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

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
                        '开启USB调试教程（适用于多数设备）', // 页面标题
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 10), // 设置图片周围的内边距
          child: Image.asset(
            'assets/adb.png', // 指定图片的路径
            fit: BoxFit.contain, // 调整图片的适应方式
          ),
        ),
      ),
    );
  }
}
