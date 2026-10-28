import '../miuix_dialog.dart';
import '../platform_support.dart';
import '../app_theme.dart';
import 'dart:io';
import '../platform_tools.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:watch_assistant/l10n/l10n.dart';

enum _SaveTarget { computer, device }

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  bool _isBusy = false;
  bool _isRecording = false;

  _SaveTarget _saveTarget = _SaveTarget.computer;
  String? _localDirectory;
  final TextEditingController _deviceDirectoryController =
      TextEditingController(text: '/sdcard/');

  String? _recordPid;
  String? _recordRemotePath;
  _SaveTarget? _recordSaveTarget;
  String? _recordLocalDirectory;

  @override
  void dispose() {
    _deviceDirectoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: !_isBusy && !_isRecording,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
              onPanStart: (_) => startWindowDrag(),
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: context.palette.text, size: 20),
                      onPressed: (_isBusy || _isRecording)
                          ? null
                          : () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      l10n.featureCapture,
                      style: TextStyle(
                        color: context.palette.text,
                        fontSize: 26,
                        fontFamily: 'MiSansLight',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Card(
            color: context.palette.surface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    context.l10n.captureSaveLocation,
                    style: TextStyle(
                        fontSize: 20, fontFamily: 'MiSansLight'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      _buildModeButton(
                        text: context.l10n.captureComputerFolder,
                        isActive: _saveTarget == _SaveTarget.computer,
                        onTap: (_isBusy || _isRecording)
                            ? null
                            : () => setState(() {
                                  _saveTarget = _SaveTarget.computer;
                                }),
                      ),
                      const SizedBox(width: 8),
                      _buildModeButton(
                        text: context.l10n.captureDeviceFolder,
                        isActive: _saveTarget == _SaveTarget.device,
                        onTap: (_isBusy || _isRecording)
                            ? null
                            : () => setState(() {
                                  _saveTarget = _SaveTarget.device;
                                }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: context.palette.field,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: context.palette.border),
                    ),
                    child: Text(
                      _saveTarget == _SaveTarget.computer
                          ? (_localDirectory ?? _defaultLocalDirectory())
                          : _normalizedDeviceDirectory(),
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (_saveTarget == _SaveTarget.computer)
                    _buildActionButton(
                      text: context.l10n.captureChooseFolder,
                      onTap: (_isBusy || _isRecording)
                          ? null
                          : _selectLocalDirectory,
                    )
                  else
                    _buildActionButton(
                      text: context.l10n.captureSetDevicePath,
                      onTap: (_isBusy || _isRecording)
                          ? null
                          : _editDeviceDirectory,
                    ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.captureSectionTitle,
                    style: TextStyle(
                        fontSize: 20, fontFamily: 'MiSansLight'),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      _buildActionButton(
                        text: context.l10n.captureTakeScreenshot,
                        onTap: _isBusy ? null : _captureScreenshot,
                      ),
                      _buildActionButton(
                        text: context.l10n.captureStartRecording,
                        onTap: (_isBusy || _isRecording)
                            ? null
                            : _startScreenRecord,
                      ),
                      _buildActionButton(
                        text: context.l10n.captureStopRecording,
                        onTap: (_isBusy || !_isRecording)
                            ? null
                            : _stopScreenRecord,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.l10n.captureLocationLockedHint,
                    style: TextStyle(fontSize: 14, color: context.palette.textSecondary),
                  ),
                  if (_isBusy) ...<Widget>[
                    const SizedBox(height: 16),
                    Center(
                      child: CircularProgressIndicator(color: context.palette.text),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModeButton({
    required String text,
    required bool isActive,
    required VoidCallback? onTap,
  }) {
    final Color bgColor = isActive
        ? const Color.fromARGB(255, 30, 93, 229)
        : context.palette.button;
    final Color fgColor = isActive ? Colors.white : context.palette.text;

    return Card(
      margin: EdgeInsets.zero,
      color: onTap == null ? context.palette.border : bgColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: TextStyle(
              color: onTap == null ? context.palette.disabled : fgColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback? onTap,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.palette.button,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: onTap == null ? context.palette.disabled : context.palette.text,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectLocalDirectory() async {
    final String? path = await FilePicker.platform.getDirectoryPath(
      dialogTitle: context.l10n.captureChooseSaveFolder,
    );
    if (path == null || path.trim().isEmpty) {
      return;
    }
    setState(() => _localDirectory = path.trim());
  }

  Future<void> _editDeviceDirectory() async {
    final TextEditingController controller =
        TextEditingController(text: _normalizedDeviceDirectory());
    await showMiuixDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return MiuixAlertDialog(
          backgroundColor: context.palette.surface,
          title: Text(context.l10n.captureDeviceSavePath),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: '/sdcard/DCIM',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            MiuixDialogButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.dialogCancel),
            ),
            MiuixDialogButton(
              onPressed: () {
                final String text = controller.text.trim();
                _deviceDirectoryController.text =
                    text.isEmpty ? '/sdcard/' : text;
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text(context.l10n.dialogConfirm),
            ),
          ],
        );
      },
    );
  }

  Future<void> _captureScreenshot() async {
    final bool connected = await _ensureDeviceConnected(showDialog: true);
    if (!connected) {
      return;
    }

    final String fileName = 'screenshot_${_timestamp()}.png';
    setState(() => _isBusy = true);
    try {
      if (_saveTarget == _SaveTarget.device) {
        final String remotePath = '${_normalizedDeviceDirectory()}$fileName';
        final ProcessResult result = await Process.run(
          adbPath,
          <String>['shell', 'screencap', '-p', remotePath],
          environment: toolEnvironment,
        );
        if (result.exitCode != 0) {
          _showErrorDialog(
              _stderrOrDefault(result, context.l10n.captureScreenshotFailed));
          return;
        }
        _showInfoDialog(context.l10n.captureScreenshotSavedDevice(remotePath));
        return;
      }

      final String remotePath = '/sdcard/$fileName';
      final String localDir = _localDirectory ?? _defaultLocalDirectory();
      final String localPath = _joinLocalPath(localDir, fileName);
      Directory(localDir).createSync(recursive: true);

      final ProcessResult capResult = await Process.run(
        adbPath,
        <String>['shell', 'screencap', '-p', remotePath],
        environment: toolEnvironment,
      );
      if (capResult.exitCode != 0) {
        _showErrorDialog(
            _stderrOrDefault(capResult, context.l10n.captureScreenshotFailed));
        return;
      }

      final ProcessResult pullResult = await Process.run(
        adbPath,
        <String>['pull', remotePath, localPath],
        environment: toolEnvironment,
      );
      if (pullResult.exitCode != 0) {
        _showErrorDialog(_stderrOrDefault(
            pullResult, context.l10n.captureScreenshotExportFailed));
        return;
      }

      await Process.run(adbPath, <String>['shell', 'rm', '-f', remotePath], environment: toolEnvironment);
      _showInfoDialog(context.l10n.captureScreenshotSavedComputer(localPath));
    } catch (e) {
      _showErrorDialog(context.l10n.commandExecutionError(e.toString()));
    } finally {
      if (mounted) {
        setState(() => _isBusy = false);
      }
    }
  }

  Future<void> _startScreenRecord() async {
    final bool connected = await _ensureDeviceConnected(showDialog: true);
    if (!connected) {
      return;
    }

    final String fileName = 'screenrecord_${_timestamp()}.mp4';
    final _SaveTarget target = _saveTarget;
    final String remotePath = target == _SaveTarget.device
        ? '${_normalizedDeviceDirectory()}$fileName'
        : '/sdcard/$fileName';
    final String localDir = _localDirectory ?? _defaultLocalDirectory();

    setState(() => _isBusy = true);
    try {
      final ProcessResult result = await Process.run(
        adbPath,
        <String>[
          'shell',
          'sh',
          '-c',
          'screenrecord --bit-rate 8000000 "$remotePath" >/dev/null 2>&1 & echo \$!'
        ],
        environment: toolEnvironment,
      );

      if (result.exitCode != 0) {
        _showErrorDialog(
            _stderrOrDefault(result, context.l10n.captureRecordingStartFailed));
        return;
      }

      final String pid = _extractPid(result.stdout.toString());
      if (pid.isEmpty) {
        _showErrorDialog(context.l10n.captureRecordingProcessMissing);
        return;
      }

      setState(() {
        _isRecording = true;
        _recordPid = pid;
        _recordRemotePath = remotePath;
        _recordSaveTarget = target;
        _recordLocalDirectory = localDir;
      });
      _showInfoDialog(context.l10n.captureRecordingStarted);
    } catch (e) {
      _showErrorDialog(context.l10n.commandExecutionError(e.toString()));
    } finally {
      if (mounted) {
        setState(() => _isBusy = false);
      }
    }
  }

  Future<void> _stopScreenRecord() async {
    final String? pid = _recordPid;
    final String? remotePath = _recordRemotePath;
    final _SaveTarget? target = _recordSaveTarget;
    if (pid == null || remotePath == null || target == null) {
      _showErrorDialog(context.l10n.captureRecordingInvalidState);
      return;
    }

    setState(() => _isBusy = true);
    try {
      await Process.run(adbPath, <String>['shell', 'kill', '-2', pid], environment: toolEnvironment);
      await Future<void>.delayed(const Duration(seconds: 1));

      if (target == _SaveTarget.device) {
        _clearRecordState();
        _showInfoDialog(context.l10n.captureRecordingSavedDevice(remotePath));
        return;
      }

      final String fileName = remotePath.split('/').last;
      final String localDir =
          _recordLocalDirectory ?? _localDirectory ?? _defaultLocalDirectory();
      final String localPath = _joinLocalPath(localDir, fileName);
      Directory(localDir).createSync(recursive: true);

      final ProcessResult pullResult = await Process.run(
        adbPath,
        <String>['pull', remotePath, localPath],
        environment: toolEnvironment,
      );
      if (pullResult.exitCode != 0) {
        _showErrorDialog(_stderrOrDefault(
            pullResult, context.l10n.captureRecordingExportFailed));
        return;
      }

      await Process.run(adbPath, <String>['shell', 'rm', '-f', remotePath], environment: toolEnvironment);
      _clearRecordState();
      _showInfoDialog(context.l10n.captureRecordingSavedComputer(localPath));
    } catch (e) {
      _showErrorDialog(context.l10n.commandExecutionError(e.toString()));
    } finally {
      if (mounted) {
        setState(() => _isBusy = false);
      }
    }
  }

  void _clearRecordState() {
    setState(() {
      _isRecording = false;
      _recordPid = null;
      _recordRemotePath = null;
      _recordSaveTarget = null;
      _recordLocalDirectory = null;
    });
  }

  Future<bool> _ensureDeviceConnected({bool showDialog = true}) async {
    try {
      final ProcessResult result =
          await Process.run(adbPath, <String>['devices'], environment: toolEnvironment);
      final List<String> lines = result.stdout
          .toString()
          .split('\n')
          .map((String line) => line.trim())
          .where((String line) => line.isNotEmpty)
          .toList();
      final bool connected =
          lines.skip(1).any((String line) => line.contains('\tdevice'));

      if (!mounted) {
        return false;
      }
      if (!connected && showDialog) {
        _showErrorDialog(context.l10n.buttonDeviceNotConnectedMessage);
      }
      return connected;
    } catch (e) {
      if (!mounted) {
        return false;
      }
      if (showDialog) {
        _showErrorDialog(context.l10n.adbConnectionError(e.toString()));
      }
      return false;
    }
  }

  String _extractPid(String stdout) {
    final RegExpMatch? match = RegExp(r'(\d+)').firstMatch(stdout);
    return match?.group(1) ?? '';
  }

  String _normalizedDeviceDirectory() {
    String path = _deviceDirectoryController.text.trim();
    if (path.isEmpty) {
      path = '/sdcard/';
    }
    if (!path.startsWith('/')) {
      path = '/$path';
    }
    if (!path.endsWith('/')) {
      path = '$path/';
    }
    return path;
  }

  String _defaultLocalDirectory() {
    final String? userProfile = Platform.environment['USERPROFILE'];
    final String? home = Platform.environment['HOME'];
    final String base = (userProfile ?? home ?? Directory.current.path).trim();
    return _joinLocalPath(base, 'Desktop');
  }

  String _joinLocalPath(String dir, String fileName) {
    if (dir.endsWith('\\') || dir.endsWith('/')) {
      return '$dir$fileName';
    }
    return '$dir${Platform.pathSeparator}$fileName';
  }

  String _timestamp() {
    final DateTime now = DateTime.now();
    String two(int v) => v.toString().padLeft(2, '0');
    return '${now.year}${two(now.month)}${two(now.day)}_${two(now.hour)}${two(now.minute)}${two(now.second)}';
  }

  String _stderrOrDefault(ProcessResult result, String fallback) {
    final String stderr = result.stderr.trim();
    return stderr.isEmpty ? fallback : stderr;
  }

  void _showErrorDialog(String message) {
    showMiuixDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return MiuixAlertDialog(
          backgroundColor: context.palette.surface,
          title: Text(context.l10n.commonErrorTitle),
          content: Text(message),
          actions: <Widget>[
            MiuixDialogButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }

  void _showInfoDialog(String message) {
    showMiuixDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return MiuixAlertDialog(
          backgroundColor: context.palette.surface,
          title: Text(context.l10n.commonNoticeTitle),
          content: Text(message),
          actions: <Widget>[
            MiuixDialogButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }
}
