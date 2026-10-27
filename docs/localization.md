# 多语言

应用支持 **简体中文（zh）**、**English（en）**、**日本語（ja）**，基于 Flutter 官方的 `gen-l10n` 方案。

## 文件

| 文件 | 说明 |
| :--- | :--- |
| `lib/l10n/app_zh.arb` | 中文文案 |
| `lib/l10n/app_en.arb` | 英文文案（模板文件） |
| `lib/l10n/app_jp.arb` | 日文文案（文件名为 `jp`，但内部 `@@locale` 为 `ja`） |
| `lib/l10n/app_localizations*.dart` | 生成代码，**不要手动修改** |
| `lib/l10n/l10n.dart` | `BuildContext.l10n` 扩展 |

`pubspec.yaml` 中开启了 `flutter: generate: true`。项目没有 `l10n.yaml`，因此使用 gen-l10n 默认配置：ARB 目录 `lib/l10n`，模板文件 `app_en.arb`。

## 在代码中使用

```dart
import 'package:watch_assistant/l10n/l10n.dart';

Text(context.l10n.navigationHome);
Text(context.l10n.pairingClearFailure(stderr)); // 带参数的文案
```

## 新增文案

1. 在三份 ARB 文件中添加相同的 key，例如：

   ```json
   "flashSlotSwitched": "已切换到槽位 {slot}",
   "@flashSlotSwitched": {
     "placeholders": { "slot": { "type": "String" } }
   }
   ```

   占位符的 `@` 描述必须写在模板文件 `app_en.arb` 中，其余语言建议保持一致。

2. 重新生成本地化代码：

   ```bash
   flutter gen-l10n
   ```

   （`flutter run` / `flutter build` 也会自动触发生成。）

3. 提交 ARB 与生成的 `app_localizations*.dart`。

## 语言切换与持久化

- `MyApp` 的 `supportedLocales` 为 `zh`、`en`、`ja`
- 「关于」页切换语言时调用 `onLocaleChanged`，`MyApp` 更新 `locale` 并写入 `SharedPreferences`：
  - 键：`selected_locale`
  - 值：`zh` / `en` / `ja`，或 `system`（跟随系统）
- 启动时读取该值；为空或 `system` 时 `locale` 为 `null`，由 Flutter 按系统语言匹配

## 动态设备信息

`utils.dart` 保留与语言无关的设备数据；电池健康代码、Bootloader 状态、内存使用率和开机时间通过 `lib/l10n/device_values.dart` 在显示时翻译，切换语言无需等待设备重新读取。

功能页、首页提示、刷机工具自身的日志，以及隐私政策和用户协议全文均使用 ARB。设备返回的原始命令输出、分区名和文件路径保持原样；语言菜单使用各语言的本地名称。
