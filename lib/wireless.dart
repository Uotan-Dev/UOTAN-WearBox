import 'miuix_dialog.dart';
import 'miuix_titled_page.dart';
import 'platform_support.dart';
import 'app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miuix/miuix.dart';
import 'platform_tools.dart';
import 'package:watch_assistant/l10n/l10n.dart';
import 'dart:io';

class WirelessPage extends StatefulWidget {
  const WirelessPage({super.key});

  @override
  State<WirelessPage> createState() => _WirelessPageState();
}

class _WirelessPageState extends State<WirelessPage> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _portController = TextEditingController();

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isNarrowLayout(context)) {
      final l10n = context.l10n;
      final form = Builder(
        builder: (context) => ListView(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MiuixText(
                l10n.wirelessHeaderIntro,
                style: MiuixTheme.of(context).textStyles.footnote1,
                color: MiuixTheme.of(context).colors.onBackgroundVariant,
              ),
            ),
            MiuixTextField(
              label: l10n.wirelessIpLabel,
              colors: _narrowInputColors(context),
              controller: _ipController,
              singleLine: true,
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            MiuixTextField(
              label: l10n.wirelessPortLabel,
              colors: _narrowInputColors(context),
              controller: _portController,
              singleLine: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _connectDevice(),
            ),
            const SizedBox(height: 20),
            MiuixButton(
              onPressed: _connectDevice,
              child: Text(l10n.wirelessConnectButton),
            ),
          ],
        ),
      );
      return MiuixTitledPage(
        title: l10n.wirelessPageTitle,
        showBackButton: true,
        body: form,
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: GestureDetector(
            onPanStart: (details) => startWindowDrag(),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: context.palette.text, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        context.l10n.wirelessPageTitle,
                        style: TextStyle(
                          color: context.palette.text,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.wirelessHeaderIntro,
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            // IP 地址输入框
            _buildTextField(context.l10n.wirelessIpLabel, _ipController),
            const SizedBox(height: 10),

            // 端口输入框
            _buildTextField(context.l10n.wirelessPortLabel, _portController,
                isNumeric: true),
            const SizedBox(height: 20),

            // 连接按钮
            _buildButton(context.l10n.wirelessConnectButton, _connectDevice),
          ],
        ),
      ),
    );
  }

  MiuixTextFieldColors _narrowInputColors(BuildContext context) {
    final defaults = MiuixTextFieldDefaults.textFieldColors(context);
    return MiuixTextFieldColors(
      backgroundColor: Colors.white,
      labelColor: defaults.labelColor,
      borderColor: defaults.borderColor,
    );
  }

  /// **构建输入框**
  Widget _buildTextField(String label, TextEditingController controller,
      {bool isNumeric = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  /// **构建按钮**
  Widget _buildButton(String text, VoidCallback onPressed) {
    return Card(
      color: context.palette.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onPressed,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: context.palette.text, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// **执行 ADB 连接**
  Future<void> _connectDevice() async {
    String ip = _ipController.text.trim();
    String port = _portController.text.trim();

    if (ip.isEmpty || port.isEmpty) {
      _showMessage(context, context.l10n.wirelessErrorTitle,
          context.l10n.wirelessInputIncomplete);
      return;
    }

    String target = "$ip:$port";
    try {
      ProcessResult result = await Process.run(adbPath, ['connect', target],
          environment: toolEnvironment);
      if (!mounted) return;
      if (result.stdout.contains("connected to")) {
        _showMessage(context, context.l10n.wirelessSuccessTitle,
            context.l10n.wirelessConnectSuccess(target));
      } else {
        _showMessage(
            context,
            context.l10n.wirelessErrorTitle,
            context.l10n
                .wirelessConnectFailure("${result.stdout}\n${result.stderr}"));
      }
    } catch (e) {
      if (!mounted) return;
      _showMessage(context, context.l10n.wirelessErrorTitle,
          context.l10n.wirelessExecutionFailed(e.toString()));
    }
  }

  /// **弹窗显示执行结果**
  void _showMessage(BuildContext context, String title, String message) {
    if (isNarrowLayout(context)) {
      showMiuixDialog(
        context: context,
        builder: (context) => MiuixAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            MiuixDialogButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.dialogOk),
            ),
          ],
        ),
      );
      return;
    }
    showMiuixDialog(
      context: context,
      builder: (BuildContext context) {
        return MiuixAlertDialog(
          backgroundColor: context.palette.surface,
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            MiuixDialogButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed) ||
                        states.contains(WidgetState.hovered)) {
                      return context.palette.button;
                    }
                    return null;
                  },
                ),
                foregroundColor:
                    WidgetStateProperty.all<Color>(context.palette.text),
              ),
              child: Text(context.l10n.dialogOk),
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
