import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:watch_assistant/l10n/l10n.dart';

class AdbFileManagerPage extends StatefulWidget {
  const AdbFileManagerPage({super.key});

  @override
  _AdbFileManagerPageState createState() => _AdbFileManagerPageState();
}

class _AdbFileManagerPageState extends State<AdbFileManagerPage> {
  String currentPath = '/storage/emulated/0/'; // 默认设置为内部存储目录
  List<String> files = []; // 当前目录中的文件列表
  List<String> directories = []; // 当前目录中的文件夹列表
  bool isLoading = false; // 用于控制加载进度条的显示
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
      _listFiles(); // 列出初始路径下的文件和文件夹
    }
  }

  // 列出当前路径的文件和文件夹
  Future<void> _listFiles() async {
    final l10n = context.l10n;
    setState(() {
      isLoading = true; // 开始加载时显示进度条
    });

    try {
      final result = await Process.run('adb', ['shell', 'ls', '-p', currentPath]);
      if (result.exitCode == 0) {
        await Future.delayed(const Duration(milliseconds: 500)); // 延迟显示加载
        if (!mounted) return;
        setState(() {
          files.clear();
          directories.clear();
          final entries = result.stdout.split('\n');
          for (var entry in entries) {
            entry = entry.trim();
            if (entry.isNotEmpty) {
              if (entry.endsWith('/')) {
                directories.add(entry.substring(0, entry.length - 1)); // 去掉末尾的 '/'
              } else {
                files.add(entry);
              }
            }
          }
          isLoading = false; // 完成加载后隐藏进度条
        });
      } else {
        if (!mounted) return;
        _showError(l10n.fileManagerListFailure(currentPath));
        setState(() {
          isLoading = false; // 如果出错，也隐藏进度条
        });
      }
    } catch (e) {
      if (!mounted) return;
      _showError(l10n.fileManagerErrorMessage(e.toString()));
      setState(() {
        isLoading = false; // 如果发生异常，隐藏进度条
      });
    }
  }

  // 显示错误消息
   void _showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9), // 弹窗背景颜色
          title: Text(l10n.commonErrorTitle),
          content: Text(message, style: const TextStyle(color: Colors.black)),
          actions: <Widget>[
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
              child: Text(l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }

  // 显示成功消息
  void _showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          title: Text(l10n.fileManagerSuccessTitle),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }

  // 确认删除弹窗
  void _confirmDelete(String entry, bool isDirectory) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          title: Text(l10n.fileManagerConfirmDeleteTitle),
          content: Text(l10n.fileManagerConfirmDeleteMessage(entry)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.dialogCancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteFileOrDirectory(entry, isDirectory);
              },
              child: Text(l10n.fileManagerDeleteButton),
            ),
          ],
        );
      },
    );
  }

  // 删除文件或文件夹
  Future<void> _deleteFileOrDirectory(String entry, bool isDirectory) async {
    final l10n = context.l10n;
    await _showProgressDialog(l10n.fileManagerDeleteProgress(entry));
    try {
      final result = await Process.run('adb', ['shell', 'rm', '-rf', '$currentPath$entry']);
      _closeProgressDialog();
      if (result.exitCode == 0) {
        _listFiles(); // 重新列出文件和文件夹
        _showSuccess(l10n.fileManagerDeleteSuccess(entry));
      } else {
        _showError(l10n.fileManagerDeleteFailure(entry));
      }
    } catch (e) {
      _closeProgressDialog();
      _showError(l10n.fileManagerErrorMessage(e.toString()));
    }
  }

  // 重命名文件或文件夹
  void _renameFileOrDirectory(String oldName, bool isDirectory) {
    TextEditingController controller = TextEditingController(text: oldName);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          title: Text(l10n.fileManagerRenameTitle),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: l10n.fileManagerRenameLabel),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.dialogCancel),
            ),
            TextButton(
              onPressed: () async {
                String newName = controller.text.trim();
                if (newName.isNotEmpty && newName != oldName) {
                  await _showProgressDialog(l10n.fileManagerRenameAction);
                  await Process.run('adb', [
                    'shell',
                    'mv',
                    '$currentPath$oldName',
                    '$currentPath$newName'
                  ]);
                  _closeProgressDialog();
                  _listFiles(); // 更新列表
                }
                Navigator.of(context).pop();
              },
              child: Text(l10n.fileManagerRenameAction),
            ),
          ],
        );
      },
    );
  }

  // 复制文件到电脑
  Future<void> _copyFileToComputer(String fileName) async {
    final l10n = context.l10n;
    String? savePath = await FilePicker.platform.saveFile(
      dialogTitle: l10n.fileManagerSaveDialogTitle,
      fileName: fileName,
    );

    if (savePath == null) return; // 如果用户取消保存操作，直接返回

    await _showProgressDialog(l10n.fileManagerSaveProgress(fileName));
    try {
      final result = await Process.run('adb', ['pull', '$currentPath$fileName', savePath]);
      _closeProgressDialog();
      if (result.exitCode == 0) {
        _showSuccess(l10n.fileManagerSaveSuccess(savePath));
      } else {
        _showError(l10n.fileManagerSaveFailure);
      }
    } catch (e) {
      _closeProgressDialog();
      _showError(l10n.fileManagerErrorMessage(e.toString()));
    }
  }

  // 上传文件到当前目录
  Future<void> _uploadFileToDevice() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      String filePath = result.files.single.path!;
      await _showProgressDialog(context.l10n.fileManagerUploadProgress);
      try {
        final uploadResult = await Process.run('adb', ['push', filePath, currentPath]);
        _closeProgressDialog();
        if (uploadResult.exitCode == 0) {
          _showSuccess(context.l10n.fileManagerUploadSuccess(currentPath));
          _listFiles(); // 重新列出文件和文件夹
        } else {
          _showError(context.l10n.fileManagerUploadFailure);
        }
      } catch (e) {
        _closeProgressDialog();
        _showError(context.l10n.fileManagerErrorMessage(e.toString()));
      }
    }
  }

  // 显示进度条弹窗
  Future<void> _showProgressDialog(String message) async {
    showDialog(
      context: context,
      barrierDismissible: false, // 禁止点击外部关闭弹窗
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: Colors.black, // 设置进度条颜色为黑色
              ),
              const SizedBox(width: 20),
              Expanded(child: Text(message)),
            ],
          ),
        );
      },
    );
  }

  // 关闭进度条弹窗
  void _closeProgressDialog() {
    Navigator.of(context, rootNavigator: true).pop(); // 关闭最上层的弹窗
  }

  // 右键菜单操作
  void _showContextMenu(BuildContext context, String entry, bool isDirectory, Offset tapPosition) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(tapPosition.dx, tapPosition.dy, tapPosition.dx, tapPosition.dy),
      items: [
        PopupMenuItem<String>(
          value: 'rename',
          child: Text(context.l10n.fileManagerContextRename),
        ),
        if (!isDirectory)
          PopupMenuItem<String>(
            value: 'copy',
            child: Text(context.l10n.fileManagerContextCopy),
          ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Text(context.l10n.fileManagerContextDelete),
        ),
      ],
    ).then((selected) {
      if (selected == 'rename') {
        _renameFileOrDirectory(entry, isDirectory);
      } else if (selected == 'delete') {
        _confirmDelete(entry, isDirectory);
      } else if (selected == 'copy' && !isDirectory) {
        _copyFileToComputer(entry);
      }
    });
  }

  // 切换到选中的目录
  void _navigateToDirectory(String directory) {
    setState(() {
      currentPath = '$currentPath$directory/';
      _listFiles(); // 列出新目录下的文件和文件夹
    });
  }

  // 返回上一级目录
  void _navigateBack() {
    if (currentPath != '/storage/emulated/0/') {
      setState(() {
        currentPath = currentPath.substring(0, currentPath.lastIndexOf('/', currentPath.length - 2) + 1);
        _listFiles();
      });
    } else {
      Navigator.pop(context); // 在根目录时返回到上一个页面
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // 获取相对路径（隐藏 "/storage/emulated/0/"）
    String relativePath = currentPath.replaceFirst('/storage/emulated/0/', '');
    final String displayPath = relativePath.isEmpty ? l10n.fileManagerRootLabel : relativePath;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0), // 设置 AppBar 的高度
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
                        icon: Icon(
                          currentPath == '/storage/emulated/0/'
                              ? Icons.arrow_back // 根目录时显示返回图标
                              : Icons.arrow_upward, // 非根目录时显示向上图标
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: _navigateBack,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.fileManagerTitle(displayPath), // 页面标题显示当前路径
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
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: _listFiles,
                      ),
                      IconButton(
                        icon: const Icon(Icons.upload_file), // 上传文件图标
                        onPressed: _uploadFileToDevice,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          if (!isLoading) // 如果没有加载中，显示目录列表
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20.0), // 列表的外边距
                    itemCount: directories.length + files.length,
                    itemBuilder: (context, index) {
                      if (index < directories.length) {
                        // 文件夹条目
                        final directory = directories[index];
                        return Card(
                          color: const Color(0xFFF9F9F9), // 卡片背景颜色
                          elevation: 0, // 设置卡片阴影
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // 设置卡片圆角
                          ),
                          child: GestureDetector(
                            onSecondaryTapDown: (details) =>
                                _showContextMenu(context, directory, true, details.globalPosition),
                            child: ListTile(
                              leading: const Icon(Icons.folder),
                              title: Text(directory),
                              onTap: () => _navigateToDirectory(directory),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _renameFileOrDirectory(directory, true),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => _confirmDelete(directory, true),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        // 文件条目
                        final file = files[index - directories.length];
                        return Card(
                          elevation: 0, // 设置卡片阴影
                          color: const Color.fromARGB(255, 255, 255, 255), // 卡片背景颜色
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // 设置卡片圆角
                          ),
                          child: GestureDetector(
                            onSecondaryTapDown: (details) =>
                                _showContextMenu(context, file, false, details.globalPosition),
                            child: ListTile(
                              leading: const Icon(Icons.insert_drive_file),
                              title: Text(file),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _renameFileOrDirectory(file, false),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.copy),
                                    onPressed: () => _copyFileToComputer(file),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => _confirmDelete(file, false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          if (isLoading)
            Container(
              color: Colors.white.withOpacity(0.7), // 半透明背景以覆盖目录内容
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.black, // 黑色的进度条
                ),
              ),
            ),
        ],
      ),
    );
  }
}
