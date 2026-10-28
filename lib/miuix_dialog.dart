import 'package:flutter/material.dart';
import 'package:flutter_miuix/miuix.dart';

import 'app_theme.dart';

/// 以 miuix（HyperOS）样式弹出对话框，用法与 [showDialog] 一致。
///
/// 弹窗放在根 Navigator 的透明路由中，路由内用 [MiuixOverlayDialog] 绘制面板、遮罩和进出场动画；
/// 路由的进入 / 返回驱动 `show`，因此调用方仍可用 `Navigator.pop` 关闭并返回结果。
/// [barrierDismissible] 为 true 时点击面板外关闭。
Future<T?> showMiuixDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) {
  return Navigator.of(context, rootNavigator: true).push<T>(
    _MiuixDialogRoute<T>(builder: builder, dismissible: barrierDismissible),
  );
}

class _MiuixDialogRoute<T> extends PopupRoute<T> {
  _MiuixDialogRoute({required this.builder, required this.dismissible});

  final WidgetBuilder builder;
  final bool dismissible;

  // 遮罩由 MiuixPopupHost 绘制
  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  // 返回时等待 miuix 退场动画（最长 300ms）播完再移除路由
  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 320);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _MiuixDialogShell(
      animation: animation,
      dismissible: dismissible,
      builder: builder,
    );
  }

  // 动画全部交给 miuix，路由本身不做过渡
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

class _MiuixDialogShell extends StatefulWidget {
  const _MiuixDialogShell({
    required this.animation,
    required this.dismissible,
    required this.builder,
  });

  final Animation<double> animation;
  final bool dismissible;
  final WidgetBuilder builder;

  @override
  State<_MiuixDialogShell> createState() => _MiuixDialogShellState();
}

class _MiuixDialogShellState extends State<_MiuixDialogShell> {
  // 首帧先以隐藏状态挂载，下一帧再显示，以触发 miuix 的入场动画
  bool _show = false;

  @override
  void initState() {
    super.initState();
    widget.animation.addStatusListener(_onStatus);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.animation.status != AnimationStatus.reverse) {
        setState(() => _show = true);
      }
    });
  }

  @override
  void dispose() {
    widget.animation.removeStatusListener(_onStatus);
    super.dispose();
  }

  void _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.reverse && _show) {
      setState(() => _show = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final MiuixThemeData theme =
        context.palette.isDark ? MiuixThemeData.dark() : MiuixThemeData.light();
    return MiuixTheme(
      data: theme,
      child: MiuixPopupScope(
        establishRoot: true,
        child: MiuixPopupHost(
          windowDimmingColor: theme.colors.windowDimming,
          child: MiuixOverlayDialog(
            show: _show,
            onDismissRequest: widget.dismissible
                ? () => Navigator.of(context).maybePop()
                : null,
            content: Builder(builder: widget.builder),
          ),
        ),
      ),
    );
  }
}

/// miuix 样式的对话框内容，参数与 [AlertDialog] 对应：标题、正文居中，操作按钮横向等分。
/// [backgroundColor] 仅为兼容原调用保留，面板颜色由 miuix 主题决定。
class MiuixAlertDialog extends StatelessWidget {
  const MiuixAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.backgroundColor,
  });

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final MiuixThemeData theme = MiuixTheme.of(context);
    final List<Widget> buttons = actions ?? const <Widget>[];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: theme.textStyles.title4.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colors.onBackground,
              ),
              child: title!,
            ),
          ),
        if (content != null)
          Flexible(
            child: SingleChildScrollView(
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: theme.textStyles.body1.copyWith(
                  color: theme.colors.onSurfaceSecondary,
                ),
                child: content!,
              ),
            ),
          ),
        if (buttons.isNotEmpty) ...[
          const SizedBox(height: 24),
          Row(
            children: [
              for (int i = 0; i < buttons.length; i++) ...[
                if (i > 0) const SizedBox(width: 12),
                Expanded(
                  child: _DialogActionScope(
                    // 最后一个按钮为主要操作（确认）
                    primary: i == buttons.length - 1 && buttons.length > 1,
                    child: buttons[i],
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}

class _DialogActionScope extends InheritedWidget {
  const _DialogActionScope({required this.primary, required super.child});

  final bool primary;

  @override
  bool updateShouldNotify(_DialogActionScope oldWidget) =>
      oldWidget.primary != primary;
}

/// 对话框操作按钮，参数与 [TextButton] 对应，渲染为 [MiuixTextButton]。
/// [style] 仅为兼容原调用保留；在 [MiuixAlertDialog] 中最后一个按钮使用主色。
class MiuixDialogButton extends StatelessWidget {
  const MiuixDialogButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final bool primary = context
            .dependOnInheritedWidgetOfExactType<_DialogActionScope>()
            ?.primary ??
        false;
    final Widget label = child;
    final String text = label is Text ? (label.data ?? '') : '';
    return MiuixTextButton(
      text,
      onPressed: onPressed,
      enabled: onPressed != null,
      colors: primary
          ? MiuixButtonDefaults.buttonColorsPrimary(context)
          : MiuixButtonDefaults.buttonColors(context),
    );
  }
}
