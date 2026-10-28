import 'package:flutter/material.dart';
import 'package:flutter_miuix/miuix.dart';

import 'app_theme.dart';
import 'miuix_titled_page.dart';

/// 全局 miuix Snackbar 队列，由 [AppSnackbarHost] 统一显示
final MiuixSnackbarHostState appSnackbarState = MiuixSnackbarHostState();

/// 显示一条 miuix Snackbar。[replace] 为 true 时先关闭当前显示的消息
Future<void> showAppSnackbar(
  String message, {
  bool replace = false,
}) async {
  if (replace) {
    await (await appSnackbarState.newestSnackbarData())?.dismiss();
  }
  await appSnackbarState.showSnackbar(message);
}

/// 叠加在所有页面之上的 Snackbar 显示区域，位于窗口底部（窄屏时避开底部导航栏）
class AppSnackbarHost extends StatelessWidget {
  const AppSnackbarHost({super.key});

  // 窄屏底部导航栏（MiuixNavigationBar）的高度
  static const double _bottomBarHeight = 64;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final double bottom = MediaQuery.paddingOf(context).bottom +
        (isNarrowLayout(context) ? _bottomBarHeight : 0);
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: MiuixTheme(
        data: palette.isDark ? MiuixThemeData.dark() : MiuixThemeData.light(),
        child: MiuixSnackbarHost(state: appSnackbarState),
      ),
    );
  }
}
