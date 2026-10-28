import 'package:flutter/material.dart';

import 'page_transition.dart';

/// 应用配色：浅色沿用原有界面的取值，深色参考 Windows 11 深色模式
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.background,
    required this.surface,
    required this.button,
    required this.border,
    required this.text,
    required this.textSecondary,
    required this.subtext,
    required this.disabled,
    required this.hover,
    required this.pressed,
    required this.menuPanel,
    required this.field,
  });

  /// 页面背景
  final Color background;

  /// 卡片、导航栏、弹窗背景
  final Color surface;

  /// 卡片内按钮背景、选中指示器
  final Color button;

  /// 输入框、分隔线描边
  final Color border;

  /// 主要文字和图标
  final Color text;

  /// 次要文字（数值、说明、分组标题）
  final Color textSecondary;

  /// 介于主要与次要之间的说明文字
  final Color subtext;

  /// 不可用状态的图标和描边
  final Color disabled;

  /// 悬停叠加色
  final Color hover;

  /// 按下叠加色
  final Color pressed;

  /// 毛玻璃菜单面板底色（半透明）
  final Color menuPanel;

  /// 卡片上凸起的输入框、分段选择指示器等
  final Color field;

  static const AppPalette light = AppPalette(
    background: Colors.white,
    surface: Color(0xFFF9F9F9),
    button: Color.fromARGB(255, 237, 237, 237),
    border: Color(0xFFDCDCDC),
    text: Colors.black,
    textSecondary: Color.fromARGB(255, 132, 132, 132),
    subtext: Color.fromARGB(255, 80, 80, 80),
    disabled: Color(0xFFC4C4C4),
    hover: Color(0x1A000000),
    pressed: Color(0x33000000),
    menuPanel: Color(0xCCFFFFFF),
    field: Colors.white,
  );

  static const AppPalette dark = AppPalette(
    background: Color(0xFF1F1F1F),
    surface: Color(0xFF2B2B2B),
    button: Color(0xFF3A3A3A),
    border: Color(0xFF474747),
    text: Color(0xFFF2F2F2),
    textSecondary: Color(0xFF9E9E9E),
    subtext: Color(0xFFBDBDBD),
    disabled: Color(0xFF5C5C5C),
    hover: Color(0x1FFFFFFF),
    pressed: Color(0x33FFFFFF),
    menuPanel: Color(0xCC2B2B2B),
    field: Color(0xFF383838),
  );

  /// 窄屏（移动端风格）配色：沿用 miuix 默认的灰色页面 + 白色卡片，深色为黑色页面 + 深灰卡片
  static final AppPalette lightNarrow = light.copyWith(
    background: const Color(0xFFF7F7F7),
    surface: Colors.white,
    button: const Color(0xFFF0F0F0),
    field: const Color(0xFFF7F7F7),
  );

  static final AppPalette darkNarrow = dark.copyWith(
    background: Colors.black,
    surface: const Color(0xFF242424),
    button: const Color(0xFF434343),
    field: const Color(0xFF2E2E2E),
  );

  bool get isDark => background.computeLuminance() < 0.5;

  @override
  AppPalette copyWith({
    Color? background,
    Color? surface,
    Color? button,
    Color? border,
    Color? text,
    Color? textSecondary,
    Color? subtext,
    Color? disabled,
    Color? hover,
    Color? pressed,
    Color? menuPanel,
    Color? field,
  }) {
    return AppPalette(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      button: button ?? this.button,
      border: border ?? this.border,
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      subtext: subtext ?? this.subtext,
      disabled: disabled ?? this.disabled,
      hover: hover ?? this.hover,
      pressed: pressed ?? this.pressed,
      menuPanel: menuPanel ?? this.menuPanel,
      field: field ?? this.field,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) {
      return this;
    }
    return AppPalette(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      button: Color.lerp(button, other.button, t)!,
      border: Color.lerp(border, other.border, t)!,
      text: Color.lerp(text, other.text, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      subtext: Color.lerp(subtext, other.subtext, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      hover: Color.lerp(hover, other.hover, t)!,
      pressed: Color.lerp(pressed, other.pressed, t)!,
      menuPanel: Color.lerp(menuPanel, other.menuPanel, t)!,
      field: Color.lerp(field, other.field, t)!,
    );
  }
}

extension AppPaletteContext on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
}

/// 按亮度构建应用主题
ThemeData buildAppTheme(Brightness brightness) {
  final AppPalette palette =
      brightness == Brightness.dark ? AppPalette.dark : AppPalette.light;
  final ThemeData base = ThemeData(
    brightness: brightness,
    primarySwatch: Colors.blue,
    fontFamily: 'MiSans',
    scaffoldBackgroundColor: palette.background,
    canvasColor: palette.background,
    cardColor: palette.surface,
    dividerColor: palette.border,
    // 二级页面转场：宽屏为 Windows 11 设置风格左右钻入，窄屏为 iOS 风格
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        for (final TargetPlatform platform in TargetPlatform.values)
          platform: const AppPageTransitionsBuilder(),
      },
    ),
    extensions: [palette],
  );
  return base.copyWith(
    textTheme: base.textTheme.apply(
      bodyColor: palette.text,
      displayColor: palette.text,
    ),
    iconTheme: base.iconTheme.copyWith(color: palette.text),
    dialogTheme: base.dialogTheme.copyWith(backgroundColor: palette.surface),
    snackBarTheme: base.snackBarTheme,
  );
}

/// 窄屏时把主题配色切换为 miuix 风格（灰底白卡片）
ThemeData applyNarrowPalette(ThemeData theme) {
  final AppPalette palette = theme.brightness == Brightness.dark
      ? AppPalette.darkNarrow
      : AppPalette.lightNarrow;
  return theme.copyWith(
    scaffoldBackgroundColor: palette.background,
    canvasColor: palette.background,
    cardColor: palette.surface,
    extensions: [palette],
  );
}
