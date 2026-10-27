import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// 自绘的最小化 / 最大化 / 关闭按钮（macOS 使用系统原生红绿灯，不显示）。
///
/// 由 MaterialApp.builder 统一叠加在窗口右上角，所有页面位置一致。
/// 样式参照 Windows 原生标题栏按钮：46×32 方形，无圆角，关闭按钮悬浮时为红底白图标。
class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> with WindowListener {
  static const Color _hoverColor = Color(0x1A000000);
  static const Color _pressedColor = Color(0x33000000);

  bool _maximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    windowManager.isMaximized().then((value) {
      if (mounted) {
        setState(() => _maximized = value);
      }
    });
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowMaximize() => setState(() => _maximized = true);

  @override
  void onWindowUnmaximize() => setState(() => _maximized = false);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CaptionButton(
          hoverColor: _hoverColor,
          pressedColor: _pressedColor,
          onPressed: () {
            windowManager.minimize();
          },
          iconBuilder: (color) => _assetIcon('assets/mini.png', color),
        ),
        _CaptionButton(
          hoverColor: _hoverColor,
          pressedColor: _pressedColor,
          onPressed: () {
            if (_maximized) {
              windowManager.unmaximize();
            } else {
              windowManager.maximize();
            }
          },
          iconBuilder: (color) => CustomPaint(
            painter: _MaximizeIconPainter(
              restore: _maximized,
              color: color ?? _MaximizeIconPainter.defaultColor,
            ),
          ),
        ),
        _CaptionButton(
          hoverColor: const Color(0xFFC42B1C),
          pressedColor: const Color(0xFFC84031),
          hoverIconColor: Colors.white,
          onPressed: () {
            windowManager.close();
          },
          iconBuilder: (color) => _assetIcon('assets/close.png', color),
        ),
      ],
    );
  }

  static Widget _assetIcon(String asset, Color? color) {
    return Image.asset(
      asset,
      fit: BoxFit.contain,
      color: color,
      colorBlendMode: BlendMode.srcIn,
    );
  }
}

class _CaptionButton extends StatefulWidget {
  const _CaptionButton({
    required this.hoverColor,
    required this.pressedColor,
    required this.onPressed,
    required this.iconBuilder,
    this.hoverIconColor,
  });

  final Color hoverColor;
  final Color pressedColor;
  final VoidCallback onPressed;

  /// 参数为图标颜色，为空时使用默认颜色
  final Widget Function(Color? color) iconBuilder;

  /// 悬浮 / 按下时图标改用的颜色，为空则保持默认
  final Color? hoverIconColor;

  @override
  State<_CaptionButton> createState() => _CaptionButtonState();
}

class _CaptionButtonState extends State<_CaptionButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final bool active = _hovered || _pressed;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onPressed,
        child: Container(
          width: 46,
          height: 32,
          color: _pressed
              ? widget.pressedColor
              : (_hovered ? widget.hoverColor : Colors.transparent),
          child: widget.iconBuilder(active ? widget.hoverIconColor : null),
        ),
      ),
    );
  }
}

/// 最大化（单个方框）/ 还原（两个重叠方框）图标，线宽和颜色与 mini.png、close.png 一致
class _MaximizeIconPainter extends CustomPainter {
  const _MaximizeIconPainter({required this.restore, required this.color});

  static const Color defaultColor = Color(0xE6000000);

  final bool restore;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    // 图标区域 10×10，居中；+0.5 让 1px 线条对齐像素
    final double left = (size.width / 2 - 5).roundToDouble() + 0.5;
    final double top = (size.height / 2 - 5).roundToDouble() + 0.5;

    if (!restore) {
      canvas.drawRect(Rect.fromLTWH(left, top, 9, 9), paint);
      return;
    }

    // 前面的方框（左下）
    canvas.drawRect(Rect.fromLTWH(left, top + 2, 7, 7), paint);
    // 后面的方框只画露出的上边和右边
    canvas.drawPath(
      Path()
        ..moveTo(left + 2, top + 2)
        ..lineTo(left + 2, top)
        ..lineTo(left + 9, top)
        ..lineTo(left + 9, top + 7)
        ..lineTo(left + 7, top + 7),
      paint,
    );
  }

  @override
  bool shouldRepaint(_MaximizeIconPainter oldDelegate) =>
      oldDelegate.restore != restore || oldDelegate.color != color;
}
