# adb / fastboot 集成

柚坛手表助手不内置 ADB 协议实现，所有设备操作都通过调用本机的 `adb` 与 `fastboot` 可执行文件完成。

## 可执行文件路径解析

源码：[lib/platform_tools.dart](../lib/platform_tools.dart)

所有调用都应使用全局的 `adbPath` / `fastbootPath`，**不要直接写 `'adb'`**。

```dart
import 'platform_tools.dart';

await Process.run(adbPath, <String>['devices']);
```

解析规则：

- **Windows**：直接返回 `adb` / `fastboot`，依赖 PATH（或与程序同目录的 platform-tools）。
- **macOS / Linux**：从 Finder 等 GUI 方式启动的应用拿不到 shell 的 PATH，因此按以下顺序查找第一个存在的文件：
  1. 应用包内置：`<App>.app/Contents/Resources/platform-tools`
  2. `$ANDROID_HOME/platform-tools`、`$ANDROID_SDK_ROOT/platform-tools`
  3. 进程环境中的 `PATH`
  4. 常见安装位置：`/opt/homebrew/bin`、`/usr/local/bin`、Homebrew android-commandlinetools、`~/Library/Android/sdk/platform-tools`、`~/Android/Sdk/platform-tools`、`~/platform-tools`、`/usr/bin`
  5. 都找不到时回退为裸命令名
- 解析结果在首次访问时缓存，进程生命周期内不再重新查找。

### macOS 内置 platform-tools

[macos/scripts/bundle_platform_tools.sh](../macos/scripts/bundle_platform_tools.sh) 已作为 Xcode 构建阶段「Bundle platform-tools」接入 Runner 工程：

1. 若 `macos/platform-tools/` 中没有 `adb` / `fastboot`，则从 Google 下载 `platform-tools-latest-darwin.zip`
2. 用 `codesign` 校验二进制的 TeamIdentifier 为 Google（`EQHXZ8M8AV`），不通过则构建失败
3. 用 `ditto` 复制进 `.app/Contents/Resources/platform-tools`，保留原有签名

`macos/platform-tools/` 已加入 `.gitignore`。如需强制更新版本，删除该目录后重新构建即可。

## 设备枚举与信息采集

源码：[lib/utils.dart](../lib/utils.dart)、[lib/adb_device_info.dart](../lib/adb_device_info.dart)

`fetchAdbDevices()` 解析 `adb devices` 输出中状态为 `device` 的行，并对每台设备逐项采集信息，组装成 `AdbDeviceInfo`：

| 字段 | 来源 |
| :--- | :--- |
| 品牌 / 型号 / 序列号 | `getprop ro.product.brand` / `ro.product.model` / `ro.serialno` |
| Android 版本 / API | `ro.build.version.release` / `ro.build.version.sdk` |
| 安全补丁 / 软件版本 | `ro.build.version.security_patch` / `ro.build.version.incremental` |
| CPU 架构 | `ro.product.cpu.abi` |
| 内存 | `cat /proc/meminfo`（`MemTotal - MemAvailable`） |
| 存储 | 依次尝试 `df -k /data`、`df -k /storage/emulated`、`df -h /data` |
| 分辨率 / DPI | `wm size` / `wm density` |
| BL 锁状态 | `ro.boot.verifiedbootstate`：`red` 视为 unlocked，其余视为 locked |
| 运行时间 / 内核 | `uptime` / `uname -r` |
| 电池 | `dumpsys battery` 中的 level、health、voltage、temperature（÷10 得到 ℃） |

`checkAdbDevicesPeriodically()` 每 **3 秒**调用一次 `fetchAdbDevices()` 并通过回调更新 `HomeScreen`。注意每台设备每轮会执行二十余条 adb 命令，新增采集项时请考虑轮询开销。

## 命令调用约定

### 多设备

- 主页（`page1.dart`、`utils.dart`）通过 `adb -s <adbId>` 指定设备。
- 大部分功能页**未**传 `-s`，默认作用于唯一连接的设备；连接多台设备时 adb 会报错 `more than one device`。新增功能时建议优先支持 `-s`。

### 连接检查

各功能页在执行命令前运行 `adb devices`，若无 `\tdevice` 行则弹窗提示「请先连接设备」。fastboot 功能使用 `fastboot devices` 做同样检查。

### 同步与流式执行

| 场景 | 方式 | 示例 |
| :--- | :--- | :--- |
| 短命令、只关心结果 | `Process.run`，检查 `exitCode` 与 `stderr` | 大部分功能 |
| 长时间运行、需要实时日志 | `Process.start`，监听 `stdout` / `stderr` 流 | APK 安装、fastboot 刷写 |
| 可能卡死的命令 | `Process.run(...).timeout(...)`，捕获 `TimeoutException` | 电池、内存模块 |

### 错误处理

推荐模式（参考 `function/battery.dart` 的 `_runAdb`）：

```dart
Future<ProcessResult?> _runAdb(List<String> args) async {
  if (_busy) return null;                 // 防止重复点击
  if (!await _ensureDeviceConnected()) return null;
  setState(() => _busy = true);
  try {
    final ProcessResult result =
        await Process.run(adbPath, args).timeout(_adbTimeout);
    if (result.exitCode != 0) {
      _showErrorDialog(result.stderr.toString().trim());
    }
    return result;
  } on TimeoutException {
    _showErrorDialog('ADB 命令超时，请检查设备连接后重试。');
    return null;
  } finally {
    if (mounted) setState(() => _busy = false);
  }
}
```

要点：

- 参数以 `List<String>` 传入，不要拼接成一条 shell 字符串，避免空格、引号和注入问题
- `await` 之后访问 `context` / `setState` 前检查 `mounted`
- 用户可见的错误文案应走 l10n（部分旧代码仍硬编码中文，修改时可顺手迁移）

## 无线调试

源码：[lib/wireless.dart](../lib/wireless.dart)

用户输入 `IP:端口` 后执行 `adb connect <target>`，连接成功后设备会出现在 `adb devices` 中，由轮询自动识别。电脑与手表需处于同一子网。
