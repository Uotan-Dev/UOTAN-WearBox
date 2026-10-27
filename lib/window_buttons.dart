import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// 自绘的最小化 / 关闭按钮（macOS 使用系统原生红绿灯，不显示）。
///
/// 由 MaterialApp.builder 统一叠加在窗口右上角，所有页面位置一致。
class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  // 去掉鼠标悬浮 / 点击时的背景高亮
  static const ButtonStyle _style = ButtonStyle(
    overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      // 固定高度与原首页标题栏一致；图片按钮的尺寸由这个高度限制，
      // 去掉后会按图片原始尺寸显示
      child: SizedBox(
        height: 48,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              style: _style,
              icon: Image.asset('assets/mini.png'),
              onPressed: () {
                windowManager.minimize();
              },
            ),
            IconButton(
              style: _style,
              icon: Image.asset('assets/close.png'),
              onPressed: () {
                windowManager.close();
              },
            ),
          ],
        ),
      ),
    );
  }
}
