import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 页面入场动画：淡入并从下方轻微上移。宽屏下导航栏切换页面和进入二级页面共用这一套参数
const Duration kPageEnterDuration = Duration(milliseconds: 260);
const Curve kPageEnterCurve = Curves.easeOutCubic;
const double kPageEnterOffset = 12;

/// 窄屏下 iOS 风格左右滑动动画的时长（导航栏切换和二级页面共用）
const Duration kCupertinoPageDuration = Duration(milliseconds: 400);

/// 与 HomeScreen 的底部导航栏断点保持一致
const double kNarrowLayoutBreakpoint = 600;

/// 对进度 [t]（0→1）应用淡入上移效果
Widget fadeRise(double t, Widget child) {
  return Opacity(
    opacity: t,
    child: Transform.translate(
      offset: Offset(0, kPageEnterOffset * (1 - t)),
      child: child,
    ),
  );
}

/// 二级页面路由动画：
/// - 窄屏：iOS 风格，从右侧滑入，下层页面视差左移，支持左缘右滑返回
/// - 宽屏：新页面淡入上移，下层页面同时淡出；返回时反向播放
class FadeRisePageTransitionsBuilder extends PageTransitionsBuilder {
  const FadeRisePageTransitionsBuilder();

  static const CupertinoPageTransitionsBuilder _cupertino =
      CupertinoPageTransitionsBuilder();

  // 路由动画时长在创建时确定、无法区分窄屏宽屏，因此取较长的 iOS 时长；
  // 宽屏动画只占用前 260ms，观感与之前一致
  static const double _wideEnd = 260 / 400;

  @override
  Duration get transitionDuration => kCupertinoPageDuration;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (MediaQuery.sizeOf(context).width < kNarrowLayoutBreakpoint) {
      return _cupertino.buildTransitions<T>(
          route, context, animation, secondaryAnimation, child);
    }
    final Animation<double> enter = CurvedAnimation(
      parent: animation,
      curve: const Interval(0, _wideEnd, curve: kPageEnterCurve),
      reverseCurve: const Interval(0, _wideEnd, curve: kPageEnterCurve).flipped,
    );
    final Animation<double> covered = CurvedAnimation(
      parent: secondaryAnimation,
      curve: const Interval(0, _wideEnd),
      // 返回时与上层页面淡出同步恢复
      reverseCurve: const FlippedCurve(Interval(0, _wideEnd)),
    );
    return AnimatedBuilder(
      animation: Listenable.merge([enter, covered]),
      child: child,
      builder: (context, child) => Opacity(
        // 被新页面覆盖时淡出，避免透出旧页面内容
        opacity: 1 - covered.value,
        child: fadeRise(enter.value, child!),
      ),
    );
  }
}
