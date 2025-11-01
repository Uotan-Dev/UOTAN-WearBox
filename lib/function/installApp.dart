import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

class InstallAppPage extends StatefulWidget {
  const InstallAppPage({super.key});

  @override
  _InstallAppPageState createState() => _InstallAppPageState();
}

class _InstallAppPageState extends State<InstallAppPage> {
  String? _installingMessage;
  bool _isInstalling = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0), // 设置AppBar的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 40), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(), // 允许拖动窗口
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 20),
                        onPressed: _isInstalling
                            ? null
                            : () {
                                // 安装过程中禁用返回按钮
                                Navigator.pop(context);
                              },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.installApptoWatch,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'MiSansLight',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isInstalling) // 当不在安装中时显示按钮
              Card(
                color: const Color(0xFFF9F9F9), // 设置按钮背景颜色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // 设置圆角
                ),
                elevation: 0, // 去掉阴影
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0), // 设置悬浮时的圆角效果
                  onTap: _isInstalling
                      ? null
                      : () async {
                          await _selectAndInstallApk(context);
                        },
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0), // 保持圆角效果
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        l10n.selectApptoInstall,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            if (_isInstalling) // 当安装进行中时显示进度条
              Column(
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.black), // 设置进度条颜色为黑色
                  ),
                  const SizedBox(height: 20),
                  Text(_installingMessage ?? l10n.installingWaiting),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // 选择APK文件并使用ADB进行安装
  Future<void> _selectAndInstallApk(BuildContext context) async {
    final l10n = context.l10n;
    // 先检查是否有设备连接
    bool hasConnectedDevice = await _checkDeviceConnection();
    if (!hasConnectedDevice) {
      _showMessage(context, l10n.installNoDeviceTitle, l10n.installNoDeviceMessage);
      return; // 如果没有连接设备，直接返回
    }

    // 使用文件选择器选择APK文件
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['apk'],
    );

    if (result != null && result.files.isNotEmpty) {
      // 获取所选文件的路径
      String filePath = result.files.single.path!;

      setState(() {
        _isInstalling = true; // 开始安装
        _installingMessage = l10n.installingWaiting;
      });

      // 运行ADB命令进行安装
      try {
        // 使用 Process.start 来启动异步进程
        Process process = await Process.start('adb', ['install', '-r', filePath]);

        process.stdout.transform(const SystemEncoding().decoder).listen((data) {
          setState(() {
            _installingMessage = data.trim(); // 更新安装过程的消息
          });
        });

        process.stderr.transform(const SystemEncoding().decoder).listen((data) {
          setState(() {
            _installingMessage = l10n.installErrorOutput(data.trim()); // 显示错误信息
          });
        });

        int exitCode = await process.exitCode; // 等待进程完成
        setState(() {
          _isInstalling = false; // 结束安装
        });

        // 弹窗提示安装结果
        final bool isSuccess = exitCode == 0;
        final String message =
            isSuccess ? l10n.installSuccessMessage : (_installingMessage?.isNotEmpty == true ? _installingMessage! : l10n.installFailureMessage);
        _showMessage(
          context,
          isSuccess ? l10n.installSuccessTitle : l10n.installFailureTitle,
          message,
        );
      } catch (e) {
        setState(() {
          _isInstalling = false;
          _installingMessage = l10n.installFailureWithReason(e.toString());
        });
        _showMessage(context, l10n.installFailureTitle, l10n.installFailureWithReason(e.toString()));
      }
    } else {
      _showMessage(context, l10n.installTipTitle, l10n.installNoFileSelected);
    }
  }

  // 检查是否有设备连接
  Future<bool> _checkDeviceConnection() async {
    try {
      ProcessResult result = await Process.run('adb', ['devices']);
      String output = result.stdout.toString();

      // 过滤掉第一行标题，并检查是否有任何设备行存在
      List<String> lines = output.split('\n');
      for (var line in lines.skip(1)) {
        // 跳过第一行
        if (line.contains('\tdevice')) {
          return true; // 发现连接的设备
        }
      }
    } catch (e) {
      debugPrint('Failed to check device connection: $e');
    }
    return false; // 没有设备连接
  }

  // 显示提示消息
  void _showMessage(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 设置弹窗背景颜色为 #F9F9F9
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed) ||
                        states.contains(WidgetState.hovered)) {
                      return const Color.fromARGB(
                          255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor:
                    WidgetStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              child: Text(l10n.dialogOk),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
