import 'dart:io';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'MiSans',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(
        onLocaleChanged: _handleLocaleChanged,
        locale: _overrideLocale,
      ),
    );
  }
}
