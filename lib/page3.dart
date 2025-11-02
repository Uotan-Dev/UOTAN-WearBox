import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

import 'about/privacy.dart';
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
  });

  final ValueChanged<Locale?> onLocaleChanged;
  final Locale? currentLocale;
  final String currentVersion;

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
        title: l10n.settingsWebsiteTitle,
        subtitle: l10n.settingsWebsiteSubtitle,
        onTap: () {
          _launchURL('https://wearbox.uotan.cn/');
        },
      ),
      _SettingOption(
        iconPath: 'assets/icons/uotan.png',
        title: l10n.settingsCommunityTitle,
        subtitle: l10n.settingsCommunitySubtitle,
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // 设置AppBar的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 20), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(), // 允许拖动窗口
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
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontFamily: 'MiSansLight', // 使用自定义字体
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/mini.png'),
                        onPressed: () {
                          windowManager.minimize();
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/close.png'),
                        onPressed: () {
                          windowManager.close();
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
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.settingsVersionLabel(currentVersion),
                style: const TextStyle(fontSize: 16, fontFamily: 'MiSansLight'),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              children: [
                _buildSectionTitle(l10n.setting_config),
                const SizedBox(height: 2),
                _buildLanguageCard(context, l10n),
                const SizedBox(height: 10),
                _buildSectionTitle(l10n.settingsSectionFaq),
                const SizedBox(height: 2),

                // 问题反馈
                ..._buildOptions(context, faqOptions),
                // 问题反馈

                const SizedBox(height: 10),
                _buildSectionTitle(l10n.settingsSectionAgreements),
                const SizedBox(height: 2),
                ..._buildOptions(context, agreementOptions),
                const SizedBox(height: 10),
                _buildSectionTitle(l10n.settingsSectionVisit),
                const SizedBox(height: 2),
                ..._buildOptions(context, visitOptions),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.settingsFooter,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 154, 154, 154),
                        fontFamily: 'MiSansLight',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(BuildContext context, AppLocalizations l10n) {
    final currentSelection = currentLocale?.languageCode ?? 'system';
    return Material(
      color: const Color(0xFFF9F9F9),
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
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          title: Text(l10n.settingsLanguageTitle),
          subtitle: Text(l10n.settingsLanguageSubtitle),
          trailing: DropdownButton<String>(
            value: currentSelection,
            underline: const SizedBox.shrink(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              if (value == 'system') {
                onLocaleChanged(null);
              } else {
                onLocaleChanged(Locale(value));
              }
            },
            items: [
              DropdownMenuItem(
                value: 'system',
                child: Text(l10n.languageSystem),
              ),
              const DropdownMenuItem(
                value: 'zh',
                child: Text('简体中文'),
              ),
              const DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              const DropdownMenuItem(
                value: 'ja',
                child: Text('日本語'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 154, 154, 154),
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
      color: const Color(0xFFF9F9F9),
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
              color: const Color.fromARGB(255, 0, 0, 0),
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
