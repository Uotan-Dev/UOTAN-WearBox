import 'app_snackbar.dart';
import 'miuix_titled_page.dart';
import 'platform_support.dart';
import 'app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miuix/miuix.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about/privacy.dart';
import 'blur_menu.dart';
import 'about/question.dart';
import 'about/user.dart';
import 'donate.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
    required this.onLocaleChanged,
    required this.currentLocale,
    required this.currentVersion,
    required this.onThemeModeChanged,
    required this.themeMode,
    required this.onCheckUpdate,
  });

  final ValueChanged<Locale?> onLocaleChanged;
  final Locale? currentLocale;
  final String currentVersion;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final ThemeMode themeMode;

  /// 手动检查更新；有新版本时由调用方弹出更新提示
  final Future<UpdateCheckResult> Function() onCheckUpdate;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final faqOptions = [
      _SettingOption(
        iconPath:
            'assets/icons/help_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        title: l10n.settingsFaqTitle,
        subtitle: l10n.settingsFaqSubtitle,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FAQPage()),
          );
        },
      ),
      _SettingOption(
        iconPath:
            'assets/icons/volunteer_activism_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        title: l10n.settingsDonateTitle,
        subtitle: l10n.settingsDonateSubtitle,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DonatePage()),
          );
        },
      ),
      //_SettingOption(
      //  iconPath:
      //      'assets/icons/feedback_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
      //  title: l10n.settingsFeedbackTitle,
      //  subtitle: l10n.settingsFeedbackSubtitle,
      //  onTap: () {
      //    _launchEmail(l10n.feedbackEmailSubject, l10n.feedbackEmailBody);
      //  },
      //),
    ];

    final agreementOptions = [
      _SettingOption(
        iconPath:
            'assets/icons/verified_user_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        title: l10n.settingsPrivacyTitle,
        subtitle: l10n.settingsPrivacySubtitle,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PrivacyPage()),
          );
        },
      ),
      _SettingOption(
        iconPath:
            'assets/icons/developer_guide_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        title: l10n.settingsUserAgreementTitle,
        subtitle: l10n.settingsUserAgreementSubtitle,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserPage()),
          );
        },
      ),
    ];

    final visitOptions = [
      _SettingOption(
        iconPath:
            'assets/icons/watch_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
        title: l10n.settingsWebsiteSubtitle,
        subtitle: 'wearbox.uotan.cn',
        onTap: () {
          _launchURL('https://wearbox.uotan.cn/');
        },
      ),
      _SettingOption(
        iconPath: 'assets/icons/uotan.png',
        title: l10n.settingsCommunityTitle,
        subtitle: 'uotan.cn',
        onTap: () {
          _launchURL('https://www.uotan.cn');
        },
      ),
      _SettingOption(
        iconPath: 'assets/icons/github-mark.png',
        title: l10n.viewOnGithub,
        subtitle: l10n.githubDescription,
        onTap: () {
          _launchURL('https://github.com/Uotan-Dev/UOTAN-WearBox');
        },
      ),
    ];

    if (isNarrowLayout(context)) {
      return MiuixTitledPage(
        title: l10n.settingsPageTitle,
        body: Builder(
          builder: (context) => ListView(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
            children: [
              _buildMiuixSectionTitle(context, l10n.setting_config),
              _buildMiuixGroup([
                _buildLanguageCard(context, l10n),
                _buildThemeModeCard(context, l10n),
                _CheckUpdateCard(
                  onCheckUpdate: onCheckUpdate,
                  currentVersion: currentVersion,
                ),
              ]),
              for (final section in [
                (l10n.settingsSectionFaq, faqOptions),
                (l10n.settingsSectionAgreements, agreementOptions),
                (l10n.settingsSectionVisit, visitOptions),
              ]) ...[
                const SizedBox(height: 10),
                _buildMiuixSectionTitle(context, section.$1),
                _buildMiuixGroup([
                  for (final option in section.$2)
                    MiuixArrowPreference(
                      title: option.title,
                      onClick: option.onTap,
                    ),
                ]),
              ],
              const SizedBox(height: 10),
              _buildMiuixSectionTitle(context, l10n.settingsFooter),
            ],
          ),
        ),
      );
    }

    final Widget list = ListView(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      children: [
        _buildSectionTitle(context, l10n.setting_config),
        const SizedBox(height: 2),
        _buildLanguageCard(context, l10n),
        const SizedBox(height: 10),
        _buildThemeModeCard(context, l10n),
        const SizedBox(height: 10),
        _CheckUpdateCard(
          onCheckUpdate: onCheckUpdate,
          currentVersion: currentVersion,
        ),
        const SizedBox(height: 10),
        _buildSectionTitle(context, l10n.settingsSectionFaq),
        const SizedBox(height: 2),

        // 问题反馈
        ..._buildOptions(context, faqOptions),
        // 问题反馈

        const SizedBox(height: 10),
        _buildSectionTitle(context, l10n.settingsSectionAgreements),
        const SizedBox(height: 2),
        ..._buildOptions(context, agreementOptions),
        const SizedBox(height: 10),
        _buildSectionTitle(context, l10n.settingsSectionVisit),
        const SizedBox(height: 2),
        ..._buildOptions(context, visitOptions),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              l10n.settingsFooter,
              style: TextStyle(
                fontSize: 15,
                color: context.palette.textSecondary,
                fontFamily: 'MiSansLight',
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // 设置AppBar的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 20), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => startWindowDrag(), // 允许拖动窗口
            child: Container(
              color: Colors.transparent, // 设置为透明背景
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右对齐
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20), // 调整这个值控制标题往下移动的距离
                    child: Text(
                      l10n.settingsPageTitle,
                      style: TextStyle(
                        color: context.palette.text,
                        fontSize: 26,
                        fontFamily: 'MiSansLight', // 使用自定义字体
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.settingsVersionLabel(currentVersion),
                style: TextStyle(fontSize: 16, fontFamily: 'MiSansLight'),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: list,
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(BuildContext context, AppLocalizations l10n) {
    final currentSelection = currentLocale?.languageCode ?? 'system';
    if (isNarrowLayout(context)) {
      const values = ['system', 'zh', 'en', 'ja'];
      final selectedIndex = values.indexOf(currentSelection);
      return MiuixOverlayDropdownPreference(
        title: l10n.settingsLanguageTitle,
        items: [l10n.languageSystem, '简体中文', 'English', '日本語'],
        selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
        onSelectedIndexChange: (index) =>
            onLocaleChanged(index == 0 ? null : Locale(values[index])),
      );
    }
    return Material(
      color: context.palette.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Image.asset(
            'assets/icons/globe_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
            width: 20,
            height: 20,
            color: context.palette.text,
          ),
          title: Text(l10n.settingsLanguageTitle),
          subtitle: Text(l10n.settingsLanguageSubtitle),
          trailing: BlurDropdown<String>(
            value: currentSelection,
            onChanged: (value) {
              if (value == 'system') {
                onLocaleChanged(null);
              } else {
                onLocaleChanged(Locale(value));
              }
            },
            items: [
              BlurMenuItem(value: 'system', label: l10n.languageSystem),
              const BlurMenuItem(value: 'zh', label: '简体中文'),
              const BlurMenuItem(value: 'en', label: 'English'),
              const BlurMenuItem(value: 'ja', label: '日本語'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeModeCard(BuildContext context, AppLocalizations l10n) {
    if (isNarrowLayout(context)) {
      const values = [ThemeMode.system, ThemeMode.dark, ThemeMode.light];
      return MiuixOverlayDropdownPreference(
        title: l10n.settingsDarkModeTitle,
        items: [
          l10n.themeModeSystem,
          l10n.themeModeAlwaysOn,
          l10n.themeModeAlwaysOff,
        ],
        selectedIndex: values.indexOf(themeMode),
        onSelectedIndexChange: (index) => onThemeModeChanged(values[index]),
      );
    }
    return Material(
      color: context.palette.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: const Icon(Icons.dark_mode_outlined, size: 20),
          title: Text(l10n.settingsDarkModeTitle),
          subtitle: Text(l10n.settingsDarkModeSubtitle),
          trailing: BlurDropdown<ThemeMode>(
            value: themeMode,
            onChanged: onThemeModeChanged,
            items: [
              BlurMenuItem(
                  value: ThemeMode.system, label: l10n.themeModeSystem),
              BlurMenuItem(
                  value: ThemeMode.dark, label: l10n.themeModeAlwaysOn),
              BlurMenuItem(
                  value: ThemeMode.light, label: l10n.themeModeAlwaysOff),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiuixGroup(List<Widget> children) {
    return MiuixCard(
      child: ClipPath(
        clipper: const ShapeBorderClipper(
          shape: MiuixSquircleBorder(
            cornerRadius: MiuixCardDefaults.cornerRadius,
          ),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }

  Widget _buildMiuixSectionTitle(BuildContext context, String title) {
    final theme = MiuixTheme.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MiuixBasicComponentDefaults.insideMargin.left,
        8,
        MiuixBasicComponentDefaults.insideMargin.right,
        8,
      ),
      child: MiuixText(
        title,
        style: theme.textStyles.footnote1,
        color: theme.colors.onBackgroundVariant,
      ),
    );
  }

  Padding _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: context.palette.textSecondary,
            fontFamily: 'MiSansLight',
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOptions(
      BuildContext context, List<_SettingOption> options) {
    final widgets = <Widget>[];
    for (final option in options) {
      widgets.add(_buildOptionCard(context, option));
      widgets.add(const SizedBox(height: 10));
    }
    if (widgets.isNotEmpty) {
      widgets.removeLast();
    }
    return widgets;
  }

  Widget _buildOptionCard(BuildContext context, _SettingOption option) {
    return Material(
      color: context.palette.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: option.onTap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(option.title),
            subtitle: Text(option.subtitle),
            leading: Image.asset(
              option.iconPath,
              width: 20,
              height: 20,
              color: context.palette.text,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('无法打开URL: $url');
    }
  }

  static Future<void> _launchEmail(String subject, String body) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'feedback@Gnayoah.com',
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('无法发送邮件至: ${emailUri.toString()}');
    }
  }
}

/// 检查更新的结果
enum UpdateCheckResult { available, upToDate, failed }

class _CheckUpdateCard extends StatefulWidget {
  const _CheckUpdateCard({
    required this.onCheckUpdate,
    required this.currentVersion,
  });

  final Future<UpdateCheckResult> Function() onCheckUpdate;
  final String currentVersion;

  @override
  State<_CheckUpdateCard> createState() => _CheckUpdateCardState();
}

class _CheckUpdateCardState extends State<_CheckUpdateCard> {
  bool _checking = false;

  Future<void> _check() async {
    setState(() => _checking = true);
    final UpdateCheckResult result = await widget.onCheckUpdate();
    if (!mounted) {
      return;
    }
    setState(() => _checking = false);
    // 有新版本时已弹出更新提示，这里只提示无更新或失败
    final String? message = switch (result) {
      UpdateCheckResult.available => null,
      UpdateCheckResult.upToDate => context.l10n.updateUpToDate,
      UpdateCheckResult.failed => context.l10n.updateCheckFailed,
    };
    if (message != null) {
      showAppSnackbar(message, replace: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (isNarrowLayout(context)) {
      return MiuixArrowPreference(
        title: l10n.settingsCheckUpdateTitle,
        summary: l10n.settingsCurrentVersion(widget.currentVersion),
        enabled: !_checking,
        onClick: _checking ? null : _check,
        endActions: _checking
            ? const [
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                ),
              ]
            : null,
      );
    }
    return Material(
      color: context.palette.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: _checking ? null : _check,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: const Icon(Icons.update, size: 20),
            title: Text(l10n.settingsCheckUpdateTitle),
            subtitle: Text(l10n.settingsCheckUpdateSubtitle),
            trailing: _checking
                ? SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: context.palette.text,
                    ),
                  )
                : const Icon(Icons.arrow_forward_ios, size: 14),
          ),
        ),
      ),
    );
  }
}

class _SettingOption {
  const _SettingOption({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
}
