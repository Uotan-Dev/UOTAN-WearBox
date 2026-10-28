import 'package:flutter/material.dart';
import 'package:flutter_miuix/miuix.dart';

import 'app_theme.dart';
import 'page_transition.dart';
import 'platform_support.dart';

/// 是否为窄屏布局（与 HomeScreen 的底部导航栏断点一致）
bool isNarrowLayout(BuildContext context) =>
    MediaQuery.sizeOf(context).width < kNarrowLayoutBreakpoint;

/// 窄屏一级页面：顶部为 miuix 可折叠标题栏（左对齐大标题，随内容上滑折叠为居中小标题）。
///
/// [body] 的最外层应为可滚动组件（ListView / GridView / SingleChildScrollView），
/// 其竖向滚动驱动标题折叠；内容不足一屏时通过回弹折叠。
/// [actions] 显示在标题栏右上角，可使用 miuix 弹出菜单。
class MiuixTitledPage extends StatefulWidget {
  const MiuixTitledPage({
    super.key,
    required this.title,
    this.subtitle = '',
    this.actions,
    this.showBackButton = false,
    this.onBackPressed,
    required this.body,
  });

  final String title;
  final String subtitle;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget body;

  @override
  State<MiuixTitledPage> createState() => _MiuixTitledPageState();
}

class _MiuixTitledPageState extends State<MiuixTitledPage> {
  final MiuixExitUntilCollapsedScrollBehavior _behavior = miuixScrollBehavior();

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final MiuixThemeData miuixTheme =
        palette.isDark ? MiuixThemeData.dark() : MiuixThemeData.light();
    return Scaffold(
      // 标题栏菜单等 miuix 弹出层由应用根部的 MiuixPopupHost 绘制，遮罩覆盖整个窗口
      body: MiuixTheme(
        data: miuixTheme,
        child: Column(
          children: [
            // 桌面端窄窗口时标题区域可拖动窗口；顶部让出窗口按钮，避免与右上角操作按钮重叠
            GestureDetector(
              onPanStart: (_) => startWindowDrag(),
              child: Padding(
                padding: EdgeInsets.only(top: isDesktop ? 32 : 0),
                // 重置继承的文字样式（MiSans 字体等），标题使用 miuix 默认字体、字号与字重
                child: DefaultTextStyle(
                  style: const TextStyle(),
                  child: MiuixTopAppBar(
                    title: widget.title,
                    subtitle: widget.subtitle,
                    navigationIcon: widget.showBackButton
                        ? Tooltip(
                            message: MaterialLocalizations.of(context)
                                .backButtonTooltip,
                            child: MiuixIconButton(
                              onPressed: widget.onBackPressed ??
                                  () => Navigator.of(context).maybePop(),
                              child: MiuixIcon(vector: MiuixIcons.os4.back),
                            ),
                          )
                        : null,
                    actions: widget.actions,
                    scrollBehavior: _behavior,
                    color: palette.background,
                    // 状态栏区域已由外层 SafeArea 留出
                    defaultWindowInsetsPadding: false,
                  ),
                ),
              ),
            ),
            Expanded(
              child: MiuixScrollBehaviorListener(
                behavior: _behavior,
                // 内容不足一屏时也允许拖动回弹，标题才能折叠（miuix 的短页面逻辑）
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                  ),
                  child: widget.body,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
