import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:window_manager/window_manager.dart';

import 'app_theme.dart';

class AppSidebarItem {
  const AppSidebarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  /// assets/sidebar 下的 SVG 文件名（线性 / 填充）
  final String icon;
  final String selectedIcon;
  final String label;
}

/// 宽屏侧边栏，宽度与原 NavigationRail 一致（80），配色跟随 AppPalette（支持深色模式）。
class AppSidebar extends StatelessWidget {
  const AppSidebar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<AppSidebarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    return Container(
      width: 80,
      color: palette.surface,
      child: Column(
        children: [
          // 顶部空白可拖动窗口；macOS 需让出红绿灯位置
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (_) => windowManager.startDragging(),
            child: SizedBox(
              height: Platform.isMacOS ? 44 : 20,
              width: double.infinity,
            ),
          ),
          Image.asset('assets/logo2.png', width: 38, height: 38),
          const SizedBox(height: 10),
          Container(width: 28, height: 1, color: palette.border),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < items.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: _SidebarButton(
                      item: items[i],
                      selected: i == selectedIndex,
                      onTap: () => onSelected(i),
                    ),
                  ),
              ],
            ),
          ),
          // 与顶部 logo 区域对称，保持按钮组视觉居中
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _SidebarButton extends StatefulWidget {
  const _SidebarButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final AppSidebarItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_SidebarButton> createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<_SidebarButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final bool selected = widget.selected;
    final Color foreground = selected ? palette.text : palette.subtext;
    // 三种状态都用选中色（palette.button）只改透明度：AnimatedContainer 按通道线性插值，
    // 若混入 Colors.transparent 或黑色系的 palette.hover，过渡中途会出现半透明深灰，
    // 表现为点击时选中项、旧选中项闪黑一下
    final Color pill = palette.button.withValues(
      alpha: selected ? 1 : (_hovered ? 0.6 : 0),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pressed = false;
      }),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _pressed ? 0.94 : 1,
          duration: const Duration(milliseconds: 120),
          child: SizedBox(
            width: 72,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  width: 52,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: pill,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: SvgPicture.asset(
                      'assets/sidebar/${selected ? widget.item.selectedIcon : widget.item.icon}.svg',
                      key: ValueKey<bool>(selected),
                      width: 22,
                      height: 22,
                      colorFilter: ColorFilter.mode(foreground, BlendMode.srcIn),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontFamily: selected ? 'MiSansMed' : 'MiSans',
                    fontSize: 12.5,
                    color: foreground,
                  ),
                  child: Text(
                    widget.item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
