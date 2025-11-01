import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

class AppManagementPage extends StatefulWidget {
  const AppManagementPage({super.key});

  @override
  _AppManagementPageState createState() => _AppManagementPageState();
}

class _AppManagementPageState extends State<AppManagementPage> {
  List<Map<String, dynamic>> installedApps = []; // 用于存储已安装应用包名和冻结状态
  bool showSystemApps = false; // 用于控制是否显示系统应用
  bool isLoading = true; // 用于控制加载状态
  double progress = 0.0; // 用于控制加载进度
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      _fetchInstalledApps(); // 初始化时获取已安装的应用列表
    }
  }

  // 检查设备是否连接
  Future<bool> _isDeviceConnected() async {
    ProcessResult result = await Process.run('adb', ['devices']);
    String output = result.stdout as String;
    // 过滤出在线的设备
    List<String> devices = output.split('\n').where((line) => line.contains('\tdevice')).toList();
    return devices.isNotEmpty;
  }

  // 获取已安装的应用列表
  void _fetchInstalledApps() async {
    final l10n = context.l10n;
    if (!await _isDeviceConnected()) {
      _shownoconnectDialog(l10n.appManageNoAppsOrDevice);
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (!mounted) return;
    setState(() {
      isLoading = true; // 开始加载时设置为true
      progress = 0.0; // 初始化进度为0
    });

    try {
      // 获取所有已安装的应用包名
      ProcessResult result = await Process.run('adb', ['shell', 'pm', 'list', 'packages']);
      String output = result.stdout.toString();

      // 获取所有已冻结的应用包名
      ProcessResult disabledResult = await Process.run('adb', ['shell', 'pm', 'list', 'packages', '-d']);
      String disabledOutput = disabledResult.stdout.toString();
      List<String> disabledPackages = disabledOutput.split('\n').map((line) => line.replaceFirst('package:', '').trim()).toList();

      // 获取所有系统应用包名
      ProcessResult systemResult = await Process.run('adb', ['shell', 'pm', 'list', 'packages', '-s']);
      String systemOutput = systemResult.stdout.toString();
      List<String> systemPackages = systemOutput.split('\n').map((line) => line.replaceFirst('package:', '').trim()).toList();

      if (output.isNotEmpty) {
        List<String> apps = output
            .split('\n')
            .map((line) => line.replaceFirst('package:', '').trim())
            .where((name) => name.isNotEmpty) // 过滤掉空白包名
            .where((name) => name != 'android') // 过滤掉包名为 "android"
            .where((name) => !showSystemApps ? !systemPackages.contains(name) : true) // 根据选择是否显示系统应用
            .toList();

        // 获取每个应用的冻结状态和系统应用状态
        List<Map<String, dynamic>> appDetails = apps.map((app) {
          bool isFrozen = disabledPackages.contains(app);
          bool isSystemApp = systemPackages.contains(app);
          return {'name': app, 'isFrozen': isFrozen, 'isSystemApp': isSystemApp};
        }).toList();

        // 对应用列表进行字母排序
        appDetails.sort((a, b) => a['name']!.toLowerCase().compareTo(b['name']!.toLowerCase()));
        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return;
        setState(() {
          installedApps = appDetails;
          
          isLoading = false; // 加载完成后设置为false
        });
      } else {
        _shownoconnectDialog(l10n.appManageNoAppsOrDevice);
        if (!mounted) return;
        setState(() {
          isLoading = false; // 加载完成后设置为false
        });
      }
    } catch (e) {
      _showErrorDialog(l10n.appManageCannotFetch(e.toString()));
      if (!mounted) return;
      setState(() {
        isLoading = false; // 加载完成后设置为false
      });
    }
  }

  

  // 显示错误弹窗
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: Text(l10n.commonErrorTitle),
          content: Text(message, style: const TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.dialogOk, style: const TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  // 显示未连接弹窗
  void _shownoconnectDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: Text(l10n.installNoDeviceTitle),
          content: Text(message, style: const TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context); // 返回到上一个页面
              },
              child: Text(l10n.dialogOk, style: const TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return WillPopScope(
      onWillPop: () async {
        return !isLoading; // 如果正在加载，则禁用返回键
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0), // 设置AppBar的高度
          child: Padding(
            padding: const EdgeInsets.only(top: 40), // 设置顶部边距
            child: GestureDetector(
              onPanStart: (details) => windowManager.startDragging(), // 允许拖动窗口
              child: Container(
                color: Colors.transparent, // 设置为透明背景
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右对齐
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20), // 返回图标
                          onPressed: isLoading
                              ? null // 加载时禁用返回按钮
                              : () {
                                  Navigator.pop(context); // 返回到上一个页面
                                },
                        ),
                        const SizedBox(width: 5),
                        Text(
                          l10n.appManageTitle, // 页面标题
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontFamily: 'MiSansLight', // 使用自定义字体
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          l10n.appManageShowSystemApps,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'MiSansLight', // 使用自定义字体
                          ),
                        ), // 添加文本
                        Switch(
                          value: showSystemApps,
                          activeColor: const Color.fromARGB(255, 255, 255, 255), // 选中时的按钮颜色
                          inactiveThumbColor: Colors.grey, // 未选中时按钮的颜色
                          inactiveTrackColor: Colors.grey[300], // 未选中时的轨道颜色
                          activeTrackColor: const Color.fromARGB(255, 30, 93, 229), // 选中时的轨道颜色
                          onChanged: (value) {
                            setState(() {
                              showSystemApps = value;
                            });
                            _fetchInstalledApps(); // 切换显示模式时重新获取应用列表
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.black, // 进度条颜色设置为黑色
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(20.0), // 列表的外边距
                itemCount: installedApps.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFFF9F9F9), // 卡片背景颜色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // 设置圆角
                    ),
                    elevation: 0, // 去除卡片阴影
                    child: ListTile(
                      title: Text(
                        installedApps[index]['name'],
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Tooltip(
                            message: installedApps[index]['isFrozen']
                                ? l10n.appManageTooltipUnfreeze
                                : l10n.appManageTooltipFreeze,
                            child: IconButton(
                              icon: Image.asset(
                                installedApps[index]['isFrozen']
                                    ? 'assets/icons/enable_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png'
                                    : 'assets/icons/ac_unit_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
                                width: 18,
                                height: 18,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                if (!await _isDeviceConnected()) {
                                  _shownoconnectDialog(l10n.appManageDeviceDisconnected);
                                  return;
                                }
                                if (installedApps[index]['isFrozen']) {
                                  _unfreezeApp(installedApps[index]['name']);
                                } else {
                                  _freezeApp(installedApps[index]['name']);
                                }
                              },
                            ),
                          ),
                          Tooltip(
                            message: l10n.appManageTooltipExportApk,
                            child: IconButton(
                              icon: Image.asset(
                                'assets/icons/upload_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
                                width: 21,
                                height: 21,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                if (!await _isDeviceConnected()) {
                                  _shownoconnectDialog(l10n.appManageDeviceDisconnected);
                                  return;
                                }
                                _extractApk(installedApps[index]['name']);
                              },
                            ),
                          ),
                          if (!installedApps[index]['isSystemApp']) // 仅在非系统应用时显示卸载按钮
                            Tooltip(
                              message: l10n.appManageTooltipUninstall,
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/icons/delete_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
                                  width: 20,
                                  height: 20,
                                  color: Colors.black,
                                ),
                                onPressed: () async {
                                  if (!await _isDeviceConnected()) {
                                    _shownoconnectDialog(l10n.appManageDeviceDisconnected);
                                    return;
                                  }
                                  _showConfirmUninstallDialog(installedApps[index]['name']);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  // 确认卸载弹窗
  void _showConfirmUninstallDialog(String packageName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: Text(l10n.appManageConfirmUninstallTitle),
          content: Text(l10n.appManageConfirmUninstallMessage(packageName), style: const TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              onPressed: () {
                Navigator.of(context).pop(); // 取消卸载
              },
              child: Text(l10n.dialogCancel),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                if (await _isDeviceConnected()) {
                  _uninstallApp(packageName); // 执行卸载操作
                } else {
                  _showErrorDialog(l10n.installNoDeviceMessage);
                }
              },
              child: Text(l10n.dialogConfirm),
            ),
          ],
        );
      },
    );
  }

  // 提取应用的 APK 文件并显示进度条
  void _extractApk(String packageName) async {
    String? outputPath = await FilePicker.platform.getDirectoryPath(); // 选择保存路径

    if (outputPath != null) {
      _showProgressDialog(context.l10n.appManagePullProgress); // 显示进度弹窗

      try {
        ProcessResult result = await Process.run('adb', ['shell', 'pm', 'path', packageName]);
        String apkPath = result.stdout.toString().split(':').last.trim();
        String savePath = '$outputPath${Platform.pathSeparator}$packageName.apk'; // 将文件名设置为包名.apk

        await Process.run('adb', ['pull', apkPath, savePath]);

        Navigator.of(context).pop(); // 关闭进度弹窗
        _showInfoDialog(context.l10n.appManagePullSuccess(savePath));
      } catch (e) {
        Navigator.of(context).pop(); // 关闭进度弹窗
        _showErrorDialog(context.l10n.appManagePullFailure(e.toString()));
      }
    }
  }

  // 显示提取 APK 的进度弹窗
  void _showProgressDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // 禁止点击外部关闭
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const CircularProgressIndicator(
                color: Colors.black, // 进度条颜色设置为黑色
              ),
              const SizedBox(height: 20),
              Text(message, style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      },
    );
  }

  // 卸载应用
  void _uninstallApp(String packageName) async {
    try {
      await Process.run('adb', ['shell', 'pm', 'uninstall', packageName]);
      if (!mounted) return;
      setState(() {
        installedApps.removeWhere((app) => app['name'] == packageName); // 从列表中移除已卸载的应用
      });

      _showInfoDialog(context.l10n.appManageUninstallSuccess(packageName));
    } catch (e) {
      _showErrorDialog(context.l10n.appManageUninstallFailure(e.toString()));
    }
  }

  // 冻结应用
  void _freezeApp(String packageName) async {
    try {
      await Process.run('adb', ['shell', 'pm', 'disable-user', packageName]);

      if (!mounted) return;
      setState(() {
        installedApps.firstWhere((app) => app['name'] == packageName)['isFrozen'] = true;
      });

      _showInfoDialog(context.l10n.appManageFreezeSuccess(packageName));
    } catch (e) {
      _showErrorDialog(context.l10n.appManageFreezeFailure(e.toString()));
    }
  }

  // 解冻应用
  void _unfreezeApp(String packageName) async {
    try {
      await Process.run('adb', ['shell', 'pm', 'enable', packageName]);

      if (!mounted) return;
      setState(() {
        installedApps.firstWhere((app) => app['name'] == packageName)['isFrozen'] = false;
      });

      _showInfoDialog(context.l10n.appManageUnfreezeSuccess(packageName));
    } catch (e) {
      _showErrorDialog(context.l10n.appManageUnfreezeFailure(e.toString()));
    }
  }

  // 显示信息弹窗
  void _showInfoDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: Text(l10n.commonNoticeTitle),
          content: Text(message, style: const TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237); // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 文本颜色
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.dialogOk, style: const TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
