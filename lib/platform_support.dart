import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

/// 是否为桌面端（Windows / macOS / Linux）。窗口管理、自绘标题栏按钮等只在桌面端生效
final bool isDesktop = !kIsWeb &&
    (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

/// 拖动窗口（仅桌面端；移动端无窗口概念，直接忽略）
void startWindowDrag() {
  if (isDesktop) {
    windowManager.startDragging();
  }
}

/// 退出应用：桌面端关闭窗口，移动端退出 Activity
Future<void> closeApp() async {
  if (isDesktop) {
    await windowManager.close();
  } else {
    await SystemNavigator.pop();
  }
}
