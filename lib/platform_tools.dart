import 'dart:io';

/// 解析 adb / fastboot 可执行文件路径。
///
/// macOS 上从 Finder 启动的 GUI 应用拿不到 shell 的 PATH（不含 /opt/homebrew/bin 等），
/// 直接 Process.run('adb') 会找不到命令，所以需要按常见安装位置主动查找。
String get adbPath => _adbPath ??= _resolveTool('adb');
String get fastbootPath => _fastbootPath ??= _resolveTool('fastboot');

String? _adbPath;
String? _fastbootPath;

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
