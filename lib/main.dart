import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_miuix/miuix.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'home_screen.dart';
import 'app_snackbar.dart';
import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'page_transition.dart';
import 'platform_support.dart';
import 'platform_tools.dart';
import 'window_buttons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPlatformTools();
  if (Platform.isAndroid) {
    // 内容绘制到状态栏和手势导航条下方，由 _MobileFrame 着色以实现沉浸
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
  if (isDesktop) {
    await _initDesktopWindow();
  }

  runApp(const MyApp());
}

Future<void> _initDesktopWindow() async {
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1000, 680),
    center: true,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
    // 允许缩放为窄窗口，窄窗口下导航栏会移动到页面底部
    minimumSize: Size(360, 600),
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    if (Platform.isMacOS) {
      // 窗口尺寸固定，禁用原生红绿灯中的缩放（绿色）按钮
      await windowManager.setMaximizable(false);
    }
    await windowManager.show();
    await windowManager.focus();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _localePrefsKey = 'selected_locale';
  static const _themeModePrefsKey = 'theme_mode';
  Locale? _overrideLocale;
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
    _loadSavedThemeMode();
  }

  void _handleThemeModeChanged(ThemeMode mode) {
    if (_themeMode == mode) {
      return;
    }
    setState(() {
      _themeMode = mode;
    });
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString(_themeModePrefsKey, mode.name));
  }

  Future<void> _loadSavedThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString(_themeModePrefsKey);
    final ThemeMode mode = ThemeMode.values.firstWhere(
      (m) => m.name == name,
      orElse: () => ThemeMode.system,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _themeMode = mode;
    });
  }

  void _handleLocaleChanged(Locale? locale) {
    if (_overrideLocale == locale) {
      return;
    }
    setState(() {
      _overrideLocale = locale;
    });
    _persistLocale(locale);
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localePrefsKey);
    if (code == null || code.isEmpty || code == 'system') {
      if (!mounted) {
        return;
      }
      setState(() {
        _overrideLocale = null;
      });
      return;
    }
    final locale = Locale(code);
    if (!mounted) {
      return;
    }
    setState(() {
      _overrideLocale = locale;
    });
  }

  Future<void> _persistLocale(Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.setString(_localePrefsKey, 'system');
    } else {
      await prefs.setString(_localePrefsKey, locale.languageCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _overrideLocale,
      supportedLocales: const [
        Locale('zh'),
        Locale('en'),
        Locale('ja'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateTitle: (context) => context.l10n.appTitle,
      // 最小化 / 关闭按钮统一叠加在所有页面右上角（macOS 使用原生红绿灯）
      builder: (context, child) {
        final Widget page;
        if (!isDesktop) {
          page = _MobileFrame(child: child!);
        } else if (Platform.isMacOS) {
          page = child!;
        } else {
          page = Stack(
            children: [
              child!,
              const Positioned(
                top: 0,
                right: 0,
                child: WindowButtons(),
              ),
            ],
          );
        }
        // miuix Snackbar 叠加在所有页面之上；miuix 弹出菜单在根部绘制，遮罩覆盖整个窗口
        final Widget framed = _MiuixRoot(
          child: Stack(
            children: [
              page,
              const Positioned.fill(
                child: Material(
                  type: MaterialType.transparency,
                  child: AppSnackbarHost(),
                ),
              ),
            ],
          ),
        );
        // 窄屏（含移动端）统一使用 miuix 风格的灰底白卡片配色；
        // 包在最外层，移动端状态栏 / 小白条区域的底色也随之一致
        if (MediaQuery.sizeOf(context).width < kNarrowLayoutBreakpoint) {
          return Theme(
            data: applyNarrowPalette(Theme.of(context)),
            child: framed,
          );
        }
        return framed;
      },
      theme: buildAppTheme(Brightness.light),
      darkTheme: buildAppTheme(Brightness.dark),
      themeMode: _themeMode,
      home: HomeScreen(
        onLocaleChanged: _handleLocaleChanged,
        locale: _overrideLocale,
        onThemeModeChanged: _handleThemeModeChanged,
        themeMode: _themeMode,
      ),
    );
  }
}

/// 提供 miuix 主题和根弹出层宿主（标题栏菜单等 miuix 弹出层绘制在这里）
class _MiuixRoot extends StatelessWidget {
  const _MiuixRoot({required this.child});

  final Widget child;

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
          child: child,
        ),
      ),
    );
  }
}

/// 移动端外框：状态栏、手势导航条透明，其下方用页面背景色铺满（沉浸），
/// 内容通过 SafeArea 避开系统栏；状态栏图标颜色跟随深浅色主题
class _MobileFrame extends StatelessWidget {
  const _MobileFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (palette.isDark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark)
          .copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
      ),
      child: ColoredBox(
        color: palette.background,
        child: SafeArea(child: child),
      ),
    );
  }
}
