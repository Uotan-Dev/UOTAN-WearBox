# 开发与发布

## 环境要求

- Flutter SDK（Dart `^3.5.0`），已启用对应桌面平台：

  ```bash
  flutter config --enable-windows-desktop --enable-macos-desktop --enable-linux-desktop
  ```

- 各平台构建工具链：
  - **Windows**：Visual Studio，含「使用 C++ 的桌面开发」工作负载
  - **macOS**：Xcode + CocoaPods
  - **Linux**：`clang`、`cmake`、`ninja-build`、`pkg-config`、`libgtk-3-dev`
- 调试用的 Android platform-tools（`adb` / `fastboot`）。macOS 构建会自动下载并内置，其他平台需自行加入 PATH。

## 本地运行

```bash
flutter pub get
```

```bash
flutter run -d windows
```

将 `windows` 替换为 `macos` 或 `linux` 即可在对应平台运行。

静态检查（规则见 `analysis_options.yaml`，基于 `flutter_lints`）：

```bash
flutter analyze
```

## 构建

```bash
flutter build windows --release
```

产物位置：

| 平台 | 路径 |
| :--- | :--- |
| Windows | `build/windows/x64/runner/Release/` |
| macOS | `build/macos/Build/Products/Release/Uotan WearBox.app` |
| Linux | `build/linux/x64/release/bundle/` |

### Windows 发布注意

Windows 版本通过 PATH 查找 `adb`。分发时建议将 `adb.exe`、`AdbWinApi.dll`、`AdbWinUsbApi.dll`、`fastboot.exe` 放在 exe 同目录，保证用户未安装 platform-tools 时也能使用。

### macOS 发布注意

- Bundle ID：`com.gnayoah.wearbox`，产品名：`Uotan WearBox`（见 `macos/Runner/Configs/AppInfo.xcconfig`）
- 构建阶段「Bundle platform-tools」会把经过签名校验的 adb / fastboot 打包进 `Contents/Resources/platform-tools`，详见 [adb-integration.md](adb-integration.md#macos-内置-platform-tools)
- 应用需要执行外部进程，修改 entitlements 时注意不要开启会阻止子进程执行的沙盒限制

## 版本号

版本号需要在两处同步修改：

1. `pubspec.yaml` 的 `version`，例如 `16.2.0+3`
2. `lib/home_screen.dart` 中的 `currentVersion`（`double`，例如 `16.2`），用于更新检查比较

## 更新检查

启动时 `HomeScreen` 依次执行：

1. 请求 `https://wear.gnayoah.com`，失败则提示网络错误
2. 请求 `https://wear.gnayoah.com/version/windows.txt`，格式：

   ```
   [version]16.3
   [date]2026-10-26
   ```

3. 若远程 `[version]` 大于本地 `currentVersion`，弹出更新对话框（可关闭，非强制）

发布新版本时，先上传安装包，再更新服务器上的 `windows.txt`。注意版本以 `double` 比较，`16.10` 会被视为小于 `16.9`，次版本号请避免超过一位数，或改为语义化版本比较。

## 提交规范

提交信息格式为 `type(scope): 中文描述`，例如：

```
fix(layout): 优化页面布局，调整GridView以适应不同屏幕宽度
feat(update): 取消强制更新，更新弹窗可关闭
```

常用 type：`feat`、`fix`、`docs`、`refactor`、`chore`。
