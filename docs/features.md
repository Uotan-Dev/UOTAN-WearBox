# 功能模块

本文列出每个功能对应的源码文件和实际执行的命令，便于排查问题和新增功能。命令中的 `adb` / `fastboot` 在代码里均为 `adbPath` / `fastbootPath`。

> 由于不同厂商对 Android 的定制，部分命令（尤其是 `wm`、`settings`、`dumpsys battery set`）在个别设备上可能无效。

## 主页（page1.dart）

| 操作 | 命令 |
| :--- | :--- |
| 重启到 Recovery | `adb -s <id> reboot recovery` |
| 重启到 Bootloader | `adb -s <id> reboot bootloader` |
| 重启到 Fastbootd | `adb -s <id> reboot fastboot` |
| 关机 | `adb -s <id> shell reboot -p` |
| 重启到 EDL（9008） | `adb -s <id> reboot edl` |

## 功能页（page2.dart → function/）

### 应用管理 — `function/app.dart`

| 操作 | 命令 |
| :--- | :--- |
| 列出全部 / 已停用 / 系统应用 | `adb shell pm list packages` / `-d` / `-s` |
| 提取 APK | `adb shell pm path <pkg>`，再 `adb pull <apkPath> <savePath>` |
| 卸载 | `adb shell pm uninstall <pkg>` |
| 冻结 / 解冻 | `adb shell pm disable-user <pkg>` / `adb shell pm enable <pkg>` |

### 安装应用 — `function/installApp.dart`

支持选择或拖入 APK，使用 `Process.start` 执行 `adb install -r <file>` 并实时显示输出。

### 文件管理 — `function/file.dart`

| 操作 | 命令 |
| :--- | :--- |
| 浏览目录 | `adb shell ls -p <path>`（`-p` 用于区分目录） |
| 删除 | `adb shell rm -rf <path>` |
| 重命名 | `adb shell mv <old> <new>` |
| 下载 / 上传 | `adb pull <remote> <local>` / `adb push <local> <remoteDir>` |

### 截图与录屏 — `function/capture.dart`

- 截图：`adb shell screencap -p <remote>` → `adb pull` → `adb shell rm -f <remote>`（若保存到设备则不拉取）
- 开始录屏：`adb shell sh -c 'screenrecord --bit-rate 8000000 "<remote>" >/dev/null 2>&1 & echo $!'`，记录返回的 PID
- 停止录屏：`adb shell kill -2 <pid>`（SIGINT 让 screenrecord 正常写完文件），等待 1 秒后按需 `pull` 并删除远端文件

### 显示设置 — `function/display.dart`

| 操作 | 命令 |
| :--- | :--- |
| 读取 / 设置 DPI | `adb shell wm density` / `wm density <dpi>` |
| 读取 / 设置分辨率 | `adb shell wm size` / `wm size <WxH>` |
| 恢复默认 | `wm density reset` / `wm size reset` |

### 屏幕旋转 — `function/rotate.dart`

`adb shell settings put system user_rotation <0|1|2|3>`

### 文字输入 — `function/type.dart`

逐行执行 `adb shell input text <URL 编码后的文本>`，行间发送 `adb shell input keyevent 66`（回车）。

### 模拟按键 — `function/button.dart`

`adb shell input keyevent <keycode>`

### 电池模拟 — `function/battery.dart`

| 操作 | 命令 |
| :--- | :--- |
| 读取状态 | `adb shell dumpsys battery` |
| 设置电量 | `adb shell dumpsys battery set level <n>` |
| 模拟充电 / 放电 | 组合设置 `ac`、`status` 等字段 |
| 恢复真实状态 | `adb shell dumpsys battery reset` |

所有命令带超时保护。

### 内存清理 — `function/memory.dart`

| 操作 | 命令 |
| :--- | :--- |
| 读取内存 / 存储 | `cat /proc/meminfo`、`df -k /data` 等 |
| 结束后台进程 | `adb shell am kill-all` |
| 清理缓存 | `adb shell pm trim-caches 128G` |
| 强制停止应用 | `adb shell am force-stop <pkg>` |

### 重新配对 — `function/pair.dart`

适用于 Wear OS 设备更换手机配对：

1. `adb shell pm clear com.google.android.gms` 清除 Google Play 服务数据，随后 `adb shell reboot`
2. `adb shell am start -a android.bluetooth.adapter.action.REQUEST_DISCOVERABLE` 开启蓝牙可见

### 刷机工具 — `function/flash.dart`

设备需处于 bootloader / fastbootd 模式，所有命令通过 `Process.start` 执行并把输出写入页面日志。

| 操作 | 命令 |
| :--- | :--- |
| 刷写预设分区 | `fastboot flash <partition> <img>`，预设：system、product、vendor、boot、system_ext、odm、vendor_boot、init_boot |
| 刷写自定义分区 | 同上，分区名由用户输入 |
| 禁用 AVB 校验 | `fastboot --disable-verity --disable-verification flash vbmeta <img>` |
| 切换槽位 | `fastboot getvar current-slot` 解析当前槽位后执行 `fastboot --set-active=<a|b>` |

> 刷机操作有变砖风险。当前仅在执行前检查 fastboot 设备，没有二次确认弹窗；修改此模块时请保留日志输出，并建议为刷写类操作增加确认步骤。

## 其他页面

| 页面 | 源码 | 说明 |
| :--- | :--- | :--- |
| 无线连接 | `wireless.dart` | `adb connect <ip:port>` |
| 驱动安装 | `driver.dart` | Windows USB 驱动安装图文引导，链接到 Google USB 驱动下载页 |
| USB 调试教程 | `tutorial.dart` | 开启开发者选项与 USB 调试的说明 |
| 捐赠 | `donate.dart` | 从 `wear.gnayoah.com/donate/` 加载收款二维码 |
| 用户协议 / 隐私 / FAQ | `about/` | 静态文本页面 |

## 新增功能的步骤

1. 在 `lib/function/` 新建页面文件，参照现有模块实现设备检查、`_busy` 防重入和错误弹窗
2. 在 `assets/icons/` 放入图标并在 `pubspec.yaml` 的 `assets` 中登记
3. 在 `page2.dart` 的功能列表中添加 `_FeatureItemData`，并在点击回调中 `Navigator.push` 到新页面
4. 在三份 ARB 文件中补充标题与文案（见 [localization.md](localization.md)）
5. 在本文档补充对应的命令说明
