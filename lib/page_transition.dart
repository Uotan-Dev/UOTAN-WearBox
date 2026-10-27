import 'package:flutter/material.dart';

/// 宽屏导航栏切换页面的入场动画：淡入并从下方轻微上移
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

/// 宽屏二级页面：Windows 11 设置风格的左右"钻入"动画
/// - 进入：新页面从右侧滑入并淡入，旧页面快速淡出
/// - 返回：上层页面快速淡出，下层页面从左侧滑入并淡入
const double kDrillInOffset = 80;

/// WinUI 的减速曲线（Fluent "decelerate"）
const Curve kDrillInCurve = Cubic(0.1, 0.9, 0.2, 1.0);

/// 淡入淡出只占用动画前段，让旧页面尽快让位
const Interval _drillFade = Interval(0, 0.35, curve: Curves.easeOut);

/// 二级页面路由动画：
/// - 窄屏：iOS 风格，从右侧滑入，下层页面视差左移，支持左缘右滑返回
/// - 宽屏：Windows 11 设置风格的左右钻入动画
class AppPageTransitionsBuilder extends PageTransitionsBuilder {
  const AppPageTransitionsBuilder();

  static const CupertinoPageTransitionsBuilder _cupertino =
      CupertinoPageTransitionsBuilder();

  // 路由动画时长在创建时确定、无法区分窄屏宽屏，两种布局共用 400ms
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
    return AnimatedBuilder(
      animation: Listenable.merge([animation, secondaryAnimation]),
      child: child,
      builder: (context, child) {
        double opacity = 1;
        double dx = 0;

        // 本页面自身的进入 / 返回
        final double t = animation.value;
        if (animation.status == AnimationStatus.reverse) {
          // 返回：原地快速淡出
          opacity *= 1 - _drillFade.transform(1 - t);
        } else if (t < 1) {
          // 进入：从右侧滑入并淡入
          opacity *= _drillFade.transform(t);
          dx += kDrillInOffset * (1 - kDrillInCurve.transform(t));
        }

        // 被上层页面覆盖 / 重新露出
        final double s = secondaryAnimation.value;
        if (secondaryAnimation.status == AnimationStatus.reverse) {
          // 上层页面返回：从左侧滑入并淡入
          final double p = 1 - s;
          opacity *= _drillFade.transform(p);
          dx -= kDrillInOffset * (1 - kDrillInCurve.transform(p));
        } else if (s > 0) {
          // 上层页面进入：原地快速淡出
          opacity *= 1 - _drillFade.transform(s);
        }

        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: Transform.translate(offset: Offset(dx, 0), child: child),
        );
      },
    );
  }
}
