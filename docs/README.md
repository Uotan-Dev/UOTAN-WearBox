# 柚坛手表助手 技术文档

本目录收录柚坛手表助手（Uotan WearBox）的开发者技术文档。面向用户的说明请参阅根目录的 [README.md](../README.md) 与 [readme_cn.md](../readme_cn.md)。

| 文档 | 内容 |
| :--- | :--- |
| [architecture.md](architecture.md) | 项目结构、启动流程、页面与导航、响应式布局、窗口管理 |
| [adb-integration.md](adb-integration.md) | adb / fastboot 路径解析、设备轮询、命令调用约定 |
| [features.md](features.md) | 各功能模块对应的源码文件与实际执行的 adb / fastboot 命令 |
| [localization.md](localization.md) | 多语言（中 / 英 / 日）实现与新增文案流程 |
| [development.md](development.md) | 开发环境、构建打包、版本发布与更新检查 |

## 技术栈速览

- **框架**：Flutter（Dart SDK `^3.5.0`），仅面向桌面端：Windows / macOS / Linux
- **设备通信**：通过 `dart:io` 的 `Process.run` / `Process.start` 调用本机 `adb`、`fastboot` 可执行文件
- **主要依赖**：

| 包 | 用途 |
| :--- | :--- |
| `window_manager` | 无边框窗口、最小化 / 最大化 / 关闭、最小尺寸 |
| `shared_preferences` | 持久化用户选择的界面语言 |
| `http` | 网络连通检测、版本更新检查、捐赠二维码 |
| `url_launcher` | 打开官网、GitHub、驱动下载页等外部链接 |
| `file_picker` / `desktop_drop` | 选择或拖入 APK、镜像、待上传文件 |
| `auto_size_text` | 功能页卡片文字自适应 |
| `intl` / `flutter_localizations` | 国际化 |
