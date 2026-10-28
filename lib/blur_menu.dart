import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'app_theme.dart';

/// 自绘下拉菜单：毛玻璃（高斯模糊）背景、圆角、柔和投影，选中项用灰色圆角底加粗显示

extension _MenuColors on AppPalette {
  Color get menuSelected =>
      isDark ? const Color(0x1AFFFFFF) : const Color(0x10000000);
  Color get menuHover =>
      isDark ? const Color(0x10FFFFFF) : const Color(0x0A000000);
  Color get menuOutline =>
      isDark ? const Color(0x1FFFFFFF) : const Color(0x14000000);
}

class BlurMenuItem<T> {
  const BlurMenuItem({required this.value, required this.label, this.color});

  final T value;
  final String label;

  /// 文本颜色（如删除等危险操作可用红色），为空时使用默认颜色
  final Color? color;
}

/// 在 [anchor]（全局坐标）附近弹出菜单，返回选中的值；点击外部或按 Esc 关闭时返回 null。
/// [highlightSelected] 为 true 时高亮 [selected] 对应的项，其余项文字变浅。
Future<T?> showBlurMenu<T>({
  required BuildContext context,
  required Rect anchor,
  required List<BlurMenuItem<T>> items,
  T? selected,
  bool highlightSelected = false,
  double minWidth = 0,
}) {
  return Navigator.of(context, rootNavigator: true).push(
    _BlurMenuRoute<T>(
      anchor: anchor,
      items: items,
      selected: selected,
      highlightSelected: highlightSelected,
      minWidth: minWidth,
    ),
  );
}

class _BlurMenuRoute<T> extends PopupRoute<T> {
  _BlurMenuRoute({
    required this.anchor,
    required this.items,
    required this.selected,
    required this.highlightSelected,
    required this.minWidth,
  });

  final Rect anchor;
  final List<BlurMenuItem<T>> items;
  final T? selected;
  final bool highlightSelected;
  final double minWidth;

  // 菜单是否向上弹出，由布局时的可用空间决定，用于缩放动画的原点
  bool _openUpwards = false;

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 160);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 110);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Animation<double> curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    return CustomSingleChildLayout(
      delegate: _BlurMenuLayout(
        anchor: anchor,
        onDirection: (upwards) => _openUpwards = upwards,
      ),
      child: AnimatedBuilder(
        animation: curved,
        builder: (context, child) => Opacity(
          opacity: curved.value,
          // 弹出时从靠近锚点的一侧轻微缩放展开
          child: Transform.scale(
            scale: 0.94 + 0.06 * curved.value,
            alignment:
                _openUpwards ? Alignment.bottomCenter : Alignment.topCenter,
            child: child,
          ),
        ),
        child: _BlurMenuPanel<T>(
          items: items,
          selected: selected,
          highlightSelected: highlightSelected,
          minWidth: minWidth,
          onSelected: (value) => Navigator.of(context).pop(value),
        ),
      ),
    );
  }
}

/// 菜单定位：默认在锚点下方，空间不足时翻到上方；锚点偏右时右对齐；始终保持在窗口内
class _BlurMenuLayout extends SingleChildLayoutDelegate {
  _BlurMenuLayout({required this.anchor, required this.onDirection});

  final Rect anchor;
  final ValueChanged<bool> onDirection;

  static const double _gap = 6;
  static const double _margin = 8;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest)
        .deflate(const EdgeInsets.all(_margin));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double x = anchor.center.dx > size.width / 2
        ? anchor.right - childSize.width
        : anchor.left;
    x = x.clamp(
        _margin, math.max(_margin, size.width - childSize.width - _margin));

    double y = anchor.bottom + _gap;
    final bool upwards = y + childSize.height > size.height - _margin &&
        anchor.top - _gap - childSize.height >= _margin;
    if (upwards) {
      y = anchor.top - _gap - childSize.height;
    }
    y = y.clamp(
        _margin, math.max(_margin, size.height - childSize.height - _margin));
    onDirection(upwards);
    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_BlurMenuLayout oldDelegate) =>
      oldDelegate.anchor != anchor;
}

class _BlurMenuPanel<T> extends StatelessWidget {
  const _BlurMenuPanel({
    required this.items,
    required this.selected,
    required this.highlightSelected,
    required this.minWidth,
    required this.onSelected,
  });

  final List<BlurMenuItem<T>> items;
  final T? selected;
  final bool highlightSelected;
  final double minWidth;
  final ValueChanged<T> onSelected;

  static final BorderRadius _radius = BorderRadius.circular(14);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: CustomPaint(
        painter: OuterShadowPainter(radius: 14, dark: context.palette.isDark),
        child: ClipRRect(
          borderRadius: _radius,
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              constraints: BoxConstraints(minWidth: minWidth),
              decoration: BoxDecoration(
                color: context.palette.menuPanel,
                borderRadius: _radius,
                border:
                    Border.all(color: context.palette.menuOutline, width: 0.5),
              ),
              padding: const EdgeInsets.all(6),
              child: IntrinsicWidth(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final item in items)
                        _BlurMenuTile(
                          label: item.label,
                          color: item.color,
                          selected: highlightSelected && item.value == selected,
                          highlightSelected: highlightSelected,
                          onTap: () => onSelected(item.value),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 只在圆角面板外侧绘制投影（菜单、底部导航栏共用）：BoxShadow 会画在半透明面板下面把毛玻璃弄脏，这里先挖掉面板区域
class OuterShadowPainter extends CustomPainter {
  const OuterShadowPainter({required this.radius, required this.dark});

  final double radius;

  // 深色背景下投影需要更深才能看出层次
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect =
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius));
    canvas.save();
    canvas.clipPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect((Offset.zero & size).inflate(60)),
        Path()..addRRect(rrect),
      ),
    );
    for (final BoxShadow shadow in [
      BoxShadow(
        color: dark ? const Color(0x66000000) : const Color(0x1F000000),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
      BoxShadow(
        color: dark ? const Color(0x33000000) : const Color(0x0F000000),
        blurRadius: 4,
        offset: const Offset(0, 1),
      ),
    ]) {
      canvas.drawRRect(rrect.shift(shadow.offset), shadow.toPaint());
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(OuterShadowPainter oldDelegate) =>
      oldDelegate.radius != radius || oldDelegate.dark != dark;
}

class _BlurMenuTile extends StatefulWidget {
  const _BlurMenuTile({
    required this.label,
    required this.color,
    required this.selected,
    required this.highlightSelected,
    required this.onTap,
  });

  final String label;
  final Color? color;
  final bool selected;
  final bool highlightSelected;
  final VoidCallback onTap;

  @override
  State<_BlurMenuTile> createState() => _BlurMenuTileState();
}

class _BlurMenuTileState extends State<_BlurMenuTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final Color textColor = widget.color ??
        (widget.highlightSelected && !widget.selected
            ? palette.subtext
            : palette.text);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          decoration: BoxDecoration(
            color: widget.selected
                ? palette.menuSelected
                : (_hovered ? palette.menuHover : const Color(0x00000000)),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.fromLTRB(14, 10, 18, 10),
          child: Text(
            widget.label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
              // 选中项使用中粗字重
              fontFamily: widget.selected ? 'MiSansMed' : null,
            ),
          ),
        ),
      ),
    );
  }
}

/// 下拉选择框：点击后弹出 [showBlurMenu]。
/// [bordered] 为 true 时是带白底和描边的输入框样式，否则是紧凑的文本按钮样式。
class BlurDropdown<T> extends StatefulWidget {
  const BlurDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
    this.bordered = false,
  });

  final T? value;
  final List<BlurMenuItem<T>> items;
  final ValueChanged<T> onChanged;
  final String? hint;
  final bool bordered;

  @override
  State<BlurDropdown<T>> createState() => _BlurDropdownState<T>();
}

class _BlurDropdownState<T> extends State<BlurDropdown<T>> {
  bool _open = false;
  bool _hovered = false;

  bool get _enabled => widget.items.isNotEmpty;

  Future<void> _showMenu() async {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Rect anchor = box.localToGlobal(Offset.zero) & box.size;
    setState(() => _open = true);
    final T? result = await showBlurMenu<T>(
      context: context,
      anchor: anchor,
      items: widget.items,
      selected: widget.value,
      highlightSelected: true,
      minWidth: widget.bordered ? anchor.width : 0,
    );
    if (!mounted) {
      return;
    }
    setState(() => _open = false);
    if (result != null && result != widget.value) {
      widget.onChanged(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    BlurMenuItem<T>? current;
    for (final item in widget.items) {
      if (item.value == widget.value) {
        current = item;
      }
    }
    final bool showHint = current == null;
    final Widget label = Text(
      current?.label ?? widget.hint ?? '',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 15,
        color: showHint ? palette.textSecondary : palette.text,
      ),
    );
    final Widget chevron = AnimatedRotation(
      turns: _open ? 0.5 : 0,
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOutCubic,
      child: CustomPaint(
        size: const Size(14, 14),
        painter: ChevronPainter(
          direction: AxisDirection.down,
          color: palette.text.withValues(alpha: _enabled ? 0.6 : 0.25),
        ),
      ),
    );

    final Widget content = widget.bordered
        ? Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: palette.field,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _open || _hovered ? palette.disabled : palette.border,
              ),
            ),
            child: Row(
              children: [
                Expanded(child: label),
                const SizedBox(width: 8),
                chevron,
              ],
            ),
          )
        : AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: _open || _hovered ? palette.menuHover : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: label),
                const SizedBox(width: 6),
                chevron,
              ],
            ),
          );

    return MouseRegion(
      cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _enabled ? _showMenu : null,
        child: content,
      ),
    );
  }
}

/// 圆滑箭头：按 24×24 的 SVG 路径绘制，圆头圆角线条，尖角处用曲线过渡
/// 等价 SVG（向左）：<path d="M14.5 6.5 L9.9 11.1 Q9 12 9.9 12.9 L14.5 17.5"
///   stroke-width="2" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
class ChevronPainter extends CustomPainter {
  const ChevronPainter({required this.direction, required this.color});

  final AxisDirection direction;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24);
    // 以向左为基准，绕中心旋转得到其他方向
    final double turns = switch (direction) {
      AxisDirection.left => 0,
      AxisDirection.up => 0.25,
      AxisDirection.right => 0.5,
      AxisDirection.down => 0.75,
    };
    canvas.translate(12, 12);
    canvas.rotate(turns * 2 * math.pi);
    canvas.translate(-12, -12);
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;
    canvas.drawPath(
      Path()
        ..moveTo(14.5, 6.5)
        ..lineTo(9.9, 11.1)
        ..quadraticBezierTo(9, 12, 9.9, 12.9)
        ..lineTo(14.5, 17.5),
      paint,
    );
  }

  @override
  bool shouldRepaint(ChevronPainter oldDelegate) =>
      oldDelegate.direction != direction || oldDelegate.color != color;
}
