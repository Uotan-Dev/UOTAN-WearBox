import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'home_screen.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // 设置窗口选项，去掉顶栏
  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 570), // 设置窗口宽度和高度
    center: true, // 窗口居中
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden, // 隐藏顶栏
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _localePrefsKey = 'selected_locale';
  Locale? _overrideLocale;

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
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
      locale: _overrideLocale,
      supportedLocales: const [
        Locale('zh'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OPPOSans', // 使用自定义字体
        scaffoldBackgroundColor: Colors.white, // 设置全局背景为白色
      ),
      home: HomeScreen(
        onLocaleChanged: _handleLocaleChanged,
        locale: _overrideLocale,
      ),
    );
  }
}
