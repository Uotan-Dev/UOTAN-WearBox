import 'dart:io';

import 'package:flutter/services.dart';

/// 解析 adb / fastboot 可执行文件路径。
///
/// macOS 上从 Finder 启动的 GUI 应用拿不到 shell 的 PATH（不含 /opt/homebrew/bin 等），
/// 直接 Process.run('adb') 会找不到命令，所以需要按常见安装位置主动查找。
/// Android 上使用随 APK 打包的 libadb.so / libfastboot.so（需先调用 [initPlatformTools]）。
String get adbPath => _adbPath ??= _resolveTool('adb');
String get fastbootPath => _fastbootPath ??= _resolveTool('fastboot');

String? _adbPath;
String? _fastbootPath;

/// 运行 adb / fastboot 时附加的环境变量。
///
/// Android 应用进程没有可写的 HOME，adb 需要在 HOME 下保存密钥（.android/adbkey），
/// 因此指向应用私有目录；桌面端为 null，沿用当前进程环境。
Map<String, String>? toolEnvironment;

const MethodChannel _channel = MethodChannel('wearbox/platform_tools');

/// 启动时调用：Android 上获取随 APK 打包的工具路径和可写目录
Future<void> initPlatformTools() async {
  if (!Platform.isAndroid) {
    return;
  }
  final Map<Object?, Object?>? paths =
      await _channel.invokeMapMethod<Object?, Object?>('getPaths');
  if (paths == null) {
    return;
  }
  final String libDir = paths['nativeLibraryDir']! as String;
  _adbPath = '$libDir/libadb.so';
  _fastbootPath = '$libDir/libfastboot.so';
  toolEnvironment = <String, String>{
    'HOME': paths['filesDir']! as String,
    'TMPDIR': paths['cacheDir']! as String,
  };
}

String _resolveTool(String name) {
  if (!Platform.isMacOS && !Platform.isLinux) {
    return name;
  }

  final Map<String, String> env = Platform.environment;
  final String home = env['HOME'] ?? '';
  final List<String> dirs = <String>[
    // 随应用打包的 platform-tools（WearBox.app/Contents/Resources/platform-tools）
    '${File(Platform.resolvedExecutable).parent.parent.path}/Resources/platform-tools',
    if (env['ANDROID_HOME'] != null) '${env['ANDROID_HOME']}/platform-tools',
    if (env['ANDROID_SDK_ROOT'] != null)
      '${env['ANDROID_SDK_ROOT']}/platform-tools',
    ...?env['PATH']?.split(':'),
    '/opt/homebrew/bin',
    '/usr/local/bin',
    '/opt/homebrew/share/android-commandlinetools/platform-tools',
    '/usr/local/share/android-commandlinetools/platform-tools',
    '$home/Library/Android/sdk/platform-tools',
    '$home/Android/Sdk/platform-tools',
    '$home/platform-tools',
    '/usr/bin',
  ];

  for (final String dir in dirs) {
    if (dir.isEmpty) {
      continue;
    }
    final File file = File('$dir/$name');
    if (file.existsSync()) {
      return file.path;
    }
  }
  return name;
}
