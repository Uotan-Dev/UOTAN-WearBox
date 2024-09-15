import 'dart:io'; // 导入用于运行进程的包
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:file_picker/file_picker.dart'; // 导入文件选择器包

class TypeTextPage extends StatefulWidget {
  const TypeTextPage({super.key});

  @override
  _TypeTextPageState createState() => _TypeTextPageState();
}

class _TypeTextPageState extends State<TypeTextPage> {
  final TextEditingController _controller = TextEditingController(); // 创建文本编辑控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        onPressed: () {
                          Navigator.pop(context); // 返回到上一个页面
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '发送文本到手表', // 页面标题
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
      body: Padding(
        padding: const EdgeInsets.all(20.0), // 设置页面内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10), // 添加编辑框的外边距
                child: TextField(
                  controller: _controller,
                  maxLines: null, // 设置为null以支持多行输入
                  expands: true, // 允许TextField填充剩余的可用空间
                  textAlignVertical: TextAlignVertical.top, // 文本居上对齐
                  cursorColor: Colors.black, // 设置光标颜色为黑色
                  decoration: InputDecoration(
                    filled: true, // 启用填充背景颜色
                    fillColor: const Color(0xFFF9F9F9), // 设置背景颜色
                    hintText: '在这里输入你的文本...', // 提示文本
                    contentPadding: const EdgeInsets.all(20), // 设置文本框的内边距
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // 设置圆角
                      borderSide: BorderSide.none, // 去除边框
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // 设置圆角
                      borderSide: BorderSide.none, // 禁用状态无边框
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // 设置圆角
                      borderSide: BorderSide.none, // 焦点状态无边框
                    ),
                    hoverColor: Colors.transparent, // 悬浮时背景颜色
                    focusColor: Colors.transparent, // 焦点时背景颜色
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 5),
                Card(
                  color: const Color(0xFFF9F9F9), // Card背景颜色
                  elevation: 0, // 去掉阴影
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 设置圆角
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0), // 设置悬浮时的圆角效果
                    onTap: () {
                      _importTextFromFile(); // 导入文本文件
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // 设置内边距
                      child: Text(
                        '导入文本',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Card(
                  color: const Color(0xFFF9F9F9), // Card背景颜色
                  elevation: 0, // 去掉阴影
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 设置圆角
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0), // 设置悬浮时的圆角效果
                    onTap: () {
                      _controller.clear(); // 清空编辑框内容
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // 设置内边距
                      child: Text(
                        '清空文本',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const Spacer(), // 添加一个空白区域，将两个按钮分开到两端
                Card(
                  color: const Color(0xFFF9F9F9), // Card背景颜色
                  elevation: 0, // 去掉阴影
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 设置圆角
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6.0), // 设置悬浮时的圆角效果
                    onTap: () {
                      _sendTextToDevice(); // 发送文本到设备
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // 设置内边距
                      child: Text(
                        '发送文本到手表',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // 导入文本文件的方法
  void _importTextFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'], // 只允许选择txt文件
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      String fileContent = await file.readAsString(); // 读取文件内容
      setState(() {
        _controller.text = fileContent; // 将文件内容导入到编辑框
      });
    }
  }

  // 发送文本到设备的方法
  void _sendTextToDevice() async {
    // 检测设备是否连接
    bool isConnected = await _isDeviceConnected();
    if (!isConnected) {
      _showMessageDialog('未检测到设备，请检查设备连接');
      return;
    }

    String text = _controller.text; // 获取编辑框内容
    if (text.isEmpty) {
      _showMessageDialog('请输入文本'); // 如果文本为空，显示提示
      return;
    }

    // 显示发送进度弹窗
    _showProgressDialog('正在发送文本...');

    try {
      List<String> lines = text.split('\n'); // 按行分割文本

      for (String line in lines) {
        // 使用 adb shell input text 命令发送每一行文本
        ProcessResult result = await Process.run('adb', ['shell', 'input', 'text', Uri.encodeComponent(line)]);
        // 检查是否返回了权限错误
        if (result.stderr.toString().contains('INJECT_EVENTS permission')) {
          Navigator.of(context).pop(); // 关闭进度弹窗
          _showMessageDialog('权限不足。请开启前往 “开发者选项” 开启 “USB调试（安装设置）” 后重试。');
          return;
        }
        // 模拟回车键以实现换行
        await Process.run('adb', ['shell', 'input', 'keyevent', '66']); // KEYCODE_ENTER = 66
      }

      Navigator.of(context).pop(); // 关闭进度弹窗
      _showMessageDialog('文本已成功发送到设备');
      _controller.clear(); // 清空编辑框内容
    } catch (e) {
      Navigator.of(context).pop(); // 关闭进度弹窗
      _showMessageDialog('发生错误: $e');
    }
  }

  // 显示发送进度弹窗
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

  // 检测设备是否连接
  Future<bool> _isDeviceConnected() async {
    try {
      ProcessResult result = await Process.run('adb', ['devices']);
      String output = result.stdout as String;
      // 检查输出中是否有 "device" 状态，排除 "List of devices" 和空行
      return output.split('\n').any((line) => line.contains('\tdevice'));
    } catch (e) {
      _showMessageDialog('无法检测设备连接状态: $e');
      return false;
    }
  }

  // 显示消息弹窗
  void _showMessageDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: const Text('提示'),
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
              child: const Text('确认', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
