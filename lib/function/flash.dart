import 'package:watch_assistant/l10n/l10n.dart';
import 'dart:convert';
import '../platform_tools.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class FlashToolPage extends StatefulWidget {
  const FlashToolPage({super.key});

  @override
  State<FlashToolPage> createState() => _FlashToolPageState();
}

class _FlashToolPageState extends State<FlashToolPage> {
  static const List<String> _leftPresetPartitions = <String>[
    'system',
    'product',
    'vendor',
    'boot',
  ];

  static const List<String> _rightPresetPartitions = <String>[
    'system_ext',
    'odm',
    'vendor_boot',
    'init_boot',
  ];

  final Map<String, TextEditingController> _presetPathControllers =
      <String, TextEditingController>{};
  final TextEditingController _customPathController = TextEditingController();
  final TextEditingController _customPartitionController =
      TextEditingController();
  final ScrollController _logScrollController = ScrollController();

  bool _isBusy = false;
  final List<String> _logs = <String>[];

  @override
  void initState() {
    super.initState();
    for (final String partition in <String>[
      ..._leftPresetPartitions,
      ..._rightPresetPartitions
    ]) {
      _presetPathControllers[partition] = TextEditingController();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_logs.isEmpty) {
      _addLog(context.l10n.flashReady);
    }
  }

  @override
  void dispose() {
    for (final TextEditingController controller
        in _presetPathControllers.values) {
      controller.dispose();
    }
    _customPathController.dispose();
    _customPartitionController.dispose();
    _logScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !_isBusy,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
              onPanStart: (_) => windowManager.startDragging(),
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 20),
                      onPressed: _isBusy ? null : () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      context.l10n.flashPageTitle,
                      style: const TextStyle(
                        color: Colors.black,
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
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _buildPresetSection(),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 230,
                        child: _buildLogSection(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPresetSection() {
    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth < 760) {
                  return Column(
                    children: <Widget>[
                      ..._leftPresetPartitions
                          .map((String p) => _buildPartitionRow(p)),
                      ..._rightPresetPartitions
                          .map((String p) => _buildPartitionRow(p)),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: _leftPresetPartitions
                            .map((String p) => _buildPartitionRow(p))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: Column(
                        children: _rightPresetPartitions
                            .map((String p) => _buildPartitionRow(p))
                            .toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 94,
                  child: Text(
                    context.l10n.flashCustomPartition,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  child: _buildPathField(
                    _customPathController,
                    hint: '',
                  ),
                ),
                const SizedBox(width: 8),
                _buildActionButton(
                  text: context.l10n.flashChooseFile,
                  onTap: () => _pickImageForController(_customPathController),
                ),
                const SizedBox(width: 10),
                Text(context.l10n.flashTargetPartition,
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                SizedBox(
                  width: 180,
                  child: _buildPathField(
                    _customPartitionController,
                    hint: '',
                  ),
                ),
                const SizedBox(width: 4),
                _buildActionButton(
                  text: context.l10n.flashAction,
                  onTap: _flashCustomPartition,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartitionRow(String partition) {
    final TextEditingController controller = _presetPathControllers[partition]!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 94,
            child: Text(
              _formatPartitionLabel(partition),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: _buildPathField(controller, hint: ''),
          ),
          const SizedBox(width: 8),
          _buildActionButton(
            text: context.l10n.flashChooseFile,
            onTap: () => _pickImageForController(controller),
          ),
          const SizedBox(width: 4),
          _buildActionButton(
            text: context.l10n.flashAction,
            onTap: () => _flashPartition(partition, controller.text),
          ),
        ],
      ),
    );
  }

  Widget _buildLogSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Card(
          color: const Color(0xFFF9F9F9),
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
                  context.l10n.flashLogTitle,
                  style:
                      const TextStyle(fontSize: 20, fontFamily: 'MiSansLight'),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFDCDCDC)),
                    ),
                    child: SingleChildScrollView(
                      controller: _logScrollController,
                      child: SelectableText(
                        _logs.isEmpty
                            ? context.l10n.flashNoLogs
                            : _logs.join('\n'),
                        style: const TextStyle(
                          fontFamily: 'Consolas',
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        const SizedBox(width: 12),
        SizedBox(
          width: 220,
          child: Card(
            color: const Color(0xFFF9F9F9),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.l10n.flashQuickActions,
                      style: const TextStyle(
                          fontSize: 20, fontFamily: 'MiSansLight'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: _buildActionButton(
                        text: context.l10n.flashDisableVbmeta,
                        onTap: _disableVbmeta,
                      ),
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: double.infinity,
                      child: _buildActionButton(
                        text: context.l10n.flashSwitchSlot,
                        onTap: _switchActiveSlot,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPathField(
    TextEditingController controller, {
    required String hint,
  }) {
    return TextField(
      controller: controller,
      enabled: !_isBusy,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return Opacity(
      opacity: _isBusy ? 0.6 : 1,
      child: Card(
        color: const Color.fromARGB(255, 237, 237, 237),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          onTap: _isBusy ? null : onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageForController(TextEditingController controller) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['img', 'bin'],
    );
    final String? path = result?.files.single.path;
    if (path == null || path.isEmpty) {
      return;
    }
    setState(() {
      controller.text = path;
    });
    _addLog(context.l10n.flashSelectedFile(path));
  }

  Future<void> _flashPartition(String partition, String imagePath) async {
    final String trimmedPath = imagePath.trim();
    if (trimmedPath.isEmpty) {
      _showErrorDialog(context.l10n.flashSelectImageFirst);
      return;
    }
    await _runFastbootCommand(
      <String>['flash', partition, trimmedPath],
      actionLabel: context.l10n.flashActionPartition(partition),
    );
  }

  Future<void> _flashCustomPartition() async {
    final String path = _customPathController.text.trim();
    final String partition = _customPartitionController.text.trim();
    if (path.isEmpty) {
      _showErrorDialog(context.l10n.flashSelectImageFirst);
      return;
    }
    if (partition.isEmpty) {
      _showErrorDialog(context.l10n.flashEnterPartition);
      return;
    }
    await _flashPartition(partition, path);
  }

  Future<void> _disableVbmeta() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['img', 'bin'],
      dialogTitle: context.l10n.flashSelectVbmetaImage,
    );
    final String? path = result?.files.single.path;
    if (path == null || path.isEmpty) {
      return;
    }
    _addLog(context.l10n.flashSelectedVbmeta(path));
    await _runFastbootCommand(
      <String>[
        '--disable-verity',
        '--disable-verification',
        'flash',
        'vbmeta',
        path,
      ],
      actionLabel: context.l10n.flashDisableVbmeta,
    );
  }

  Future<void> _switchActiveSlot() async {
    if (!await _ensureFastbootDeviceReady()) {
      return;
    }

    try {
      final ProcessResult result =
          await Process.run(fastbootPath, <String>['getvar', 'current-slot']);
      final String mergedOutput =
          '${result.stdout}\n${result.stderr}'.toLowerCase();
      final RegExpMatch? match =
          RegExp(r'current-slot:\s*([ab])').firstMatch(mergedOutput);

      if (match == null) {
        _addLog(context.l10n.flashSlotParseLog(mergedOutput));
        _showErrorDialog(context.l10n.flashUnknownSlot);
        return;
      }

      final String currentSlot = match.group(1)!;
      final String targetSlot = currentSlot == 'a' ? 'b' : 'a';
      await _runFastbootCommand(
        <String>['--set-active=$targetSlot'],
        actionLabel: context.l10n.flashActionSlot(currentSlot, targetSlot),
      );
    } catch (e) {
      _addLog(context.l10n.flashSwitchSlotFailed(e.toString()));
      _showErrorDialog(context.l10n.flashSwitchSlotFailed((e).toString()));
    }
  }

  Future<void> _runFastbootCommand(
    List<String> args, {
    required String actionLabel,
  }) async {
    if (_isBusy) {
      return;
    }
    if (!await _ensureFastbootDeviceReady()) {
      return;
    }

    setState(() {
      _isBusy = true;
    });

    _addLog('----------------------------------------');
    _addLog(context.l10n.flashLogStart(actionLabel));
    _addLog('> fastboot ${args.join(' ')}');

    try {
      final Process process = await Process.start(fastbootPath, args);
      process.stdout.transform(utf8.decoder).listen(_appendProcessLog);
      process.stderr.transform(utf8.decoder).listen(_appendProcessLog);

      final int code = await process.exitCode;
      if (code == 0) {
        _addLog(context.l10n.flashLogDone(actionLabel));
      } else {
        _addLog(context.l10n.flashLogFailed(actionLabel, code.toString()));
        _showErrorDialog(context.l10n.flashOperationFailed((code).toString()));
      }
    } catch (e) {
      _addLog(context.l10n.flashExecutionError(e.toString()));
      _showErrorDialog(context.l10n.flashExecutionError((e).toString()));
    } finally {
      if (mounted) {
        setState(() {
          _isBusy = false;
        });
      }
    }
  }

  Future<bool> _ensureFastbootDeviceReady() async {
    try {
      final ProcessResult result =
          await Process.run(fastbootPath, <String>['devices']);
      final String output = result.stdout.toString();
      final List<String> lines = output
          .split('\n')
          .map((String line) => line.trim())
          .where((String line) => line.isNotEmpty)
          .toList();
      final bool hasFastbootDevice = lines.any(
        (String line) => line.contains(RegExp(r'\sfastboot$')),
      );
      if (!hasFastbootDevice) {
        _showErrorDialog(context.l10n.flashNoDevice);
      }
      return hasFastbootDevice;
    } catch (e) {
      _showErrorDialog(context.l10n.flashDetectionError((e).toString()));
      return false;
    }
  }

  String _formatPartitionLabel(String partition) {
    if (partition.isEmpty) {
      return partition;
    }
    final List<String> segments = partition.split('_');
    return segments
        .map((String s) =>
            s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}')
        .join('_');
  }

  void _appendProcessLog(String chunk) {
    final List<String> lines = chunk
        .replaceAll('\r\n', '\n')
        .split('\n')
        .where((String line) => line.trim().isNotEmpty)
        .toList();
    for (final String line in lines) {
      _addLog(line);
    }
  }

  void _addLog(String line) {
    final String timestamp = DateTime.now()
        .toIso8601String()
        .replaceFirst('T', ' ')
        .split('.')
        .first;
    if (!mounted) {
      _logs.add('[$timestamp] $line');
      return;
    }
    setState(() {
      _logs.add('[$timestamp] $line');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_logScrollController.hasClients) {
        return;
      }
      _logScrollController
          .jumpTo(_logScrollController.position.maxScrollExtent);
    });
  }

  void _showErrorDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF9F9F9),
          title: Text(context.l10n.commonErrorTitle),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 237, 237, 237);
                    }
                    return null;
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.dialogOk),
            ),
          ],
        );
      },
    );
  }
}
