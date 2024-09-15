import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'home_screen.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Info Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        fontFamily: 'OPPOSans', // 使用自定义字体
        scaffoldBackgroundColor: Colors.white, // 设置全局背景为白色
      ),
      home: const HomeScreen(),
    );
  }
}
