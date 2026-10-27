# 架构概览

## 目录结构

```
lib/
├── main.dart              # 入口：窗口初始化、MaterialApp、语言切换与持久化
├── home_screen.dart       # 主框架：更新检查、设备轮询、导航（侧边栏 / 底部栏）
├── page1.dart             # 「主页」：设备信息、设备选择、重启到各模式
├── page2.dart             # 「功能」：功能卡片网格，跳转到 function/ 下各页面
├── page3.dart             # 「关于」：语言切换、协议、FAQ、捐赠、外部链接
├── function/              # 各功能页面（每个文件一个功能，见 features.md）
├── about/                 # 用户协议 / 隐私政策 / 常见问题
├── utils.dart             # adb 设备枚举与设备属性采集
├── adb_device_info.dart   # 设备信息数据类 AdbDeviceInfo
├── platform_tools.dart    # adb / fastboot 可执行文件路径解析
├── wireless.dart          # 无线调试连接（adb connect）
├── driver.dart            # Windows USB 驱动安装引导
├── tutorial.dart          # USB 调试开启教程
├── donate.dart            # 捐赠页
├── window_buttons.dart    # 自绘最小化 / 最大化 / 关闭按钮（非 macOS）
└── l10n/                  # 多语言资源与生成代码（见 localization.md）
```

平台目录 `windows/`、`macos/`、`linux/` 为 Flutter 生成的宿主工程，除 macOS 的 platform-tools 打包脚本外基本未做改动。

## 启动流程

1. `main()` 调用 `windowManager.ensureInitialized()`，以 `WindowOptions` 创建窗口：
   - 默认尺寸 `1000 × 680`，居中，隐藏系统标题栏（`TitleBarStyle.hidden`）
   - 最小尺寸 `360 × 600`，允许缩放到窄窗口
   - macOS 上禁用原生「缩放」按钮（`setMaximizable(false)`）
2. `MyApp` 从 `SharedPreferences` 读取键 `selected_locale`，决定是否覆盖系统语言。
3. `MaterialApp.builder` 在非 macOS 平台把 `WindowButtons` 叠加到所有页面右上角；macOS 使用原生红绿灯按钮。
4. 进入 `HomeScreen`：
   - 启动每 3 秒一次的设备轮询 `checkAdbDevicesPeriodically`（见 [adb-integration.md](adb-integration.md)）
   - 延迟 0.5 秒后执行网络检查与版本更新检查，期间显示 Logo + 加载圈

## 页面与导航

`HomeScreen` 持有三个顶层页面，通过 `_selectedIndex` 切换：

| 索引 | 页面 | 说明 |
| :--- | :--- | :--- |
| 0 | `Page1` | 主页。接收 `HomeScreen` 维护的设备列表 `_devices`，可手动刷新 |
| 1 | `Page2` | 功能。卡片网格，点击后 `Navigator.push` 进入 `function/` 下对应页面 |
| 2 | `Page3` | 关于。接收 `onLocaleChanged` 回调以切换语言 |

子页面一律通过 `Navigator.push` 进入，返回时使用页面自身的 `context` 执行 `Navigator.pop`。

## 响应式布局

`HomeScreen` 使用 `LayoutBuilder`，断点为 `_narrowLayoutBreakpoint = 600`：

- **宽度 ≥ 600**：`_buildWideLayout`，左侧 `NavigationRail` + 右侧内容
- **宽度 < 600**：`_buildNarrowLayout`，导航移动到页面底部

功能页的 `GridView` 会根据可用宽度调整列数，以适配不同窗口尺寸。新增页面时请在窄窗口（约 360px）下自测。

## 窗口按钮

`window_buttons.dart` 实现 Windows / Linux 下的自绘标题栏按钮：

- 通过 `WindowListener` 监听 `onWindowMaximize` / `onWindowUnmaximize`，切换最大化与还原图标
- 最小化、关闭图标来自 `assets/mini.png`、`assets/close.png`；最大化图标为代码绘制，线宽和颜色与之保持一致
- 由于隐藏了系统标题栏，需要可拖动区域的页面应自行使用 `DragToMoveArea` 等组件

## 状态管理

项目未引入状态管理框架，全部使用 `StatefulWidget` + `setState`：

- 设备列表在 `HomeScreen` 中维护并向下传递给 `Page1`
- 各功能页自行检查设备连接（`adb devices`），并以 `_busy` / `_isBusy` 标记防止重复执行命令
- 语言设置由 `MyApp` 维护，通过回调从 `Page3` 向上传递
