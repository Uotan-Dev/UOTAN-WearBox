import 'dart:io'; // 导入用于运行进程的包
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class DisplaySettingsPage extends StatefulWidget {
  const DisplaySettingsPage({super.key});

  @override
  _DisplaySettingsPageState createState() => _DisplaySettingsPageState();
}

class _DisplaySettingsPageState extends State<DisplaySettingsPage> {
  String currentDPI = '未获取'; // 用于存储当前DPI
  String currentResolution = '未获取'; // 用于存储当前分辨率
  double dpiValue = 160; // 初始化滑块的DPI值
  double widthValue = 1080; // 初始化滑块的宽度值
  double heightValue = 1920; // 初始化滑块的高度值
  bool isLoading = true; // 用于控制加载动画的显示

  @override
  void initState() {
    super.initState();
    _checkDeviceConnection(); // 检测设备是否连接
  }

  // 检测设备是否连接
  void _checkDeviceConnection() async {
    bool isConnected = await _isDeviceConnected();
    if (!isConnected) {
      _shownoconnectDialog('未检测到设备，请检查设备连接');
    } else {
      await _fetchCurrentDPI(); // 获取当前DPI
      await _fetchCurrentResolution(); // 获取当前分辨率
      await Future.delayed(const Duration(milliseconds: 500)); // 修改延迟为0.5秒
      setState(() {
        isLoading = false; // 加载完成后隐藏动画
      });
    }
  }

  // 检测设备是否连接
  Future<bool> _isDeviceConnected() async {
    try {
      ProcessResult result = await Process.run('adb', ['devices']);
      String output = result.stdout as String;
      return output.split('\n').any((line) => line.contains('\tdevice'));
    } catch (e) {
      _showErrorDialog('无法检测设备连接状态: $e');
      return false;
    }
  }

  // 获取当前DPI
  Future<void> _fetchCurrentDPI() async {
    try {
      ProcessResult result = await Process.run('adb', ['shell', 'wm', 'density']);
      String output = result.stdout as String;
      setState(() {
        currentDPI = output.contains('Physical density') ? output.split(':').last.trim() : '无法获取';
        dpiValue = double.tryParse(currentDPI) ?? 160;
      });
    } catch (e) {
      setState(() {
        currentDPI = '无法获取';
      });
    }
  }

  // 获取当前分辨率
  Future<void> _fetchCurrentResolution() async {
    try {
      ProcessResult result = await Process.run('adb', ['shell', 'wm', 'size']);
      String output = result.stdout as String;
      setState(() {
        currentResolution = output.contains('Physical size') ? output.split(':').last.trim() : '无法获取';
        List<String> resolutionParts = currentResolution.split('x');
        if (resolutionParts.length == 2) {
          widthValue = double.tryParse(resolutionParts[0]) ?? 1080;
          heightValue = double.tryParse(resolutionParts[1]) ?? 1920;
        }
      });
    } catch (e) {
      setState(() {
        currentResolution = '无法获取';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !isLoading, // 如果正在加载则禁止返回
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
                        const Text(
                          '显示设置', // 页面标题
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontFamily: 'MiSansLight', // 使用自定义字体
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
        body: isLoading // 如果正在加载，显示加载动画
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0), // 设置页面内边距
                child: Column(
                  children: [
                    // DPI设置卡片
                    _buildDpiCard(),
                    const SizedBox(height: 10),
                    // 分辨率设置卡片
                    _buildResolutionCard(),
                  ],
                ),
              ),
      ),
    );
  }

  // 构建DPI设置卡片
  Widget _buildDpiCard() {
    return Card(
      color: const Color(0xFFF9F9F9), // 卡片背景颜色
      elevation: 0, // 去除阴影
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 设置圆角
      ),
      child: Padding(
        padding: const EdgeInsets.all(26.0), // 内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '当前DPI: $currentDPI', // 显示当前DPI
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  '已选: ${dpiValue.toInt()}', // 显示即将修改的DPI
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('DPI: ', style: TextStyle(fontSize: 16)),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color.fromARGB(255, 30, 93, 229), // 激活轨道颜色
                      inactiveTrackColor: Colors.grey, // 非激活轨道颜色
                      activeTickMarkColor: Colors.transparent, // 隐藏激活状态的刻度点
                      inactiveTickMarkColor: Colors.transparent, // 隐藏非激活状态的刻度点
                      thumbColor: const Color.fromARGB(255, 30, 93, 229), // 滑块的控制点颜色（蓝色）
                      overlayColor: const Color.fromARGB(50, 30, 93, 229), // 滑块拖动时的外圈颜色（淡蓝色）
                    ),
                    child: Slider(
                      value: dpiValue,
                      min: 120,
                      max: 640,
                      divisions: 52,
                      label: dpiValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          dpiValue = value;
                        });
                      },
                    ),
                  ),
                ),
                _buildCardButton('恢复默认', _resetDPI),
                const SizedBox(width: 10),
                _buildCardButton('修改DPI', () => _setDPI(dpiValue.toInt().toString())),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 构建分辨率设置卡片
  Widget _buildResolutionCard() {
    return Card(
      color: const Color(0xFFF9F9F9), // 卡片背景颜色
      elevation: 0, // 去除阴影
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 设置圆角
      ),
      child: Padding(
        padding: const EdgeInsets.all(26.0), // 内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '当前分辨率: $currentResolution', // 显示当前分辨率
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  '已选: ${widthValue.toInt()}x${heightValue.toInt()}', // 显示即将修改的分辨率
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('宽度: ', style: TextStyle(fontSize: 16)),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color.fromARGB(255, 30, 93, 229), // 激活轨道颜色
                      inactiveTrackColor: Colors.grey, // 非激活轨道颜色
                      activeTickMarkColor: Colors.transparent, // 隐藏激活状态的刻度点
                      inactiveTickMarkColor: Colors.transparent, // 隐藏非激活状态的刻度点
                      thumbColor: const Color.fromARGB(255, 30, 93, 229), // 滑块的控制点颜色（蓝色）
                      overlayColor: const Color.fromARGB(50, 30, 93, 229), // 滑块拖动时的外圈颜色（淡蓝色）
                    ),
                    child: Slider(
                      value: widthValue,
                      min: 180,
                      max: 2560,
                      divisions: 208,
                      label: widthValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          widthValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('高度: ', style: TextStyle(fontSize: 16)),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color.fromARGB(255, 30, 93, 229), // 激活轨道颜色
                      inactiveTrackColor: Colors.grey, // 非激活轨道颜色
                      activeTickMarkColor: Colors.transparent, // 隐藏激活状态的刻度点
                      inactiveTickMarkColor: Colors.transparent, // 隐藏非激活状态的刻度点
                      thumbColor: const Color.fromARGB(255, 30, 93, 229), // 滑块的控制点颜色（蓝色）
                      overlayColor: const Color.fromARGB(50, 30, 93, 229), // 滑块拖动时的外圈颜色（淡蓝色）
                    ),
                    child: Slider(
                      value: heightValue,
                      min: 100,
                      max: 3840,
                      divisions: 304,
                      label: heightValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          heightValue = value;
                        });
                      },
                    ),
                  ),
                ),
                _buildCardButton('恢复默认', _resetResolution),
                const SizedBox(width: 10),
                _buildCardButton(
                  '修改分辨率',
                  () => _setResolution('${widthValue.toInt()}x${heightValue.toInt()}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 构建卡片按钮
  Widget _buildCardButton(String text, VoidCallback onPressed) {
    return Card(
      color: const Color.fromARGB(255, 237, 237, 237), // Card背景颜色
      elevation: 0, // 去掉阴影
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // 设置圆角
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.0), // 设置悬浮时的圆角效果
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // 保持按钮大小不变
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }

  // 显示错误弹窗
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: const Text('错误'),
          content: Text(message, style: const TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('确认', style: TextStyle(color: Colors.black)),
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
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: const Text('没有连接设备'),
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
              child: const Text('确认', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  // 设置DPI的方法
  void _setDPI(String dpi) async {
    if (dpi.isNotEmpty && await _isDeviceConnected()) { // 检测设备是否连接
      try {
        await Process.run('adb', ['shell', 'wm', 'density', dpi]);
        _showInfoDialog('DPI 已修改为: $dpi');
        _fetchCurrentDPI(); // 更新当前DPI
      } catch (e) {
        _showErrorDialog('无法修改DPI: $e');
      }
    } else {
      _shownoconnectDialog('未检测到设备，请检查设备连接');
    }
  }

  // 设置分辨率的方法
  void _setResolution(String resolution) async {
    if (resolution.isNotEmpty && await _isDeviceConnected()) { // 检测设备是否连接
      try {
        await Process.run('adb', ['shell', 'wm', 'size', resolution]);
        _showInfoDialog('分辨率已修改为: $resolution');
        _fetchCurrentResolution(); // 更新当前分辨率
      } catch (e) {
        _showErrorDialog('无法修改分辨率: $e');
      }
    } else {
      _shownoconnectDialog('未检测到设备，请检查设备连接');
    }
  }

  // 恢复默认DPI的方法
  void _resetDPI() async {
    if (await _isDeviceConnected()) { // 检测设备是否连接
      try {
        await Process.run('adb', ['shell', 'wm', 'density', 'reset']);
        _showInfoDialog('DPI 已恢复为默认值');
        _fetchCurrentDPI(); // 更新当前DPI
      } catch (e) {
        _showErrorDialog('无法恢复默认DPI: $e');
      }
    } else {
      _shownoconnectDialog('未检测到设备，请检查设备连接');
    }
  }

  // 恢复默认分辨率的方法
  void _resetResolution() async {
    if (await _isDeviceConnected()) { // 检测设备是否连接
      try {
        await Process.run('adb', ['shell', 'wm', 'size', 'reset']);
        _showInfoDialog('分辨率已恢复为默认值');
        _fetchCurrentResolution(); // 更新当前分辨率
      } catch (e) {
        _showErrorDialog('无法恢复默认分辨率: $e');
      }
    } else {
      _shownoconnectDialog('未检测到设备，请检查设备连接');
    }
  }

  // 显示信息弹窗
  void _showInfoDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: const Text('提示'),
          content: Text(message, style: const TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('确认', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
