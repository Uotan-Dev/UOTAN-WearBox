// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '柚坛手表助手';

  @override
  String get navigationHome => '主页';

  @override
  String get navigationFeatures => '功能';

  @override
  String get navigationAbout => '设置';

  @override
  String get settingsPageTitle => '柚坛手表助手';

  @override
  String settingsVersionLabel(Object version) {
    return '版本: $version   开发&设计: Gnayoah';
  }

  @override
  String get settingsSectionFaq => '常见问题';

  @override
  String get settingsSectionAgreements => '用户协议';

  @override
  String get settingsSectionVisit => '访问官网';

  @override
  String get settingsFaqTitle => '常见问题';

  @override
  String get settingsFaqSubtitle => '不会使用、无法连接或无法操作，请先阅读常见问题说明';

  @override
  String get settingsDonateTitle => '捐赠';

  @override
  String get settingsDonateSubtitle => '本项目为免费项目，感谢捐赠支持 (❁´◡`❁)';

  @override
  String get settingsFeedbackTitle => '问题反馈';

  @override
  String get settingsFeedbackSubtitle => '反馈 Bug 或其他问题，请先阅读常见问题，如无法解决请向我们反馈';

  @override
  String get settingsPrivacyTitle => '隐私政策';

  @override
  String get settingsPrivacySubtitle => '请确保阅读并理解我们的隐私政策';

  @override
  String get settingsUserAgreementTitle => '用户协议';

  @override
  String get settingsUserAgreementSubtitle => '请确保阅读并理解我们的用户协议';

  @override
  String get settingsWebsiteTitle => '官网';

  @override
  String get settingsWebsiteSubtitle => '柚坛手表助手';

  @override
  String get settingsCommunityTitle => '柚坛社区';

  @override
  String get settingsCommunitySubtitle => '玩机交流社群';

  @override
  String get settingsFooter => '柚坛手表助手\n© 2020-2025 Gnayoah.com All rights reserved.';

  @override
  String get settingsLanguageTitle => '语言设置';

  @override
  String get settingsLanguageSubtitle => '切换应用显示语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get languageChinese => '简体中文';

  @override
  String get languageEnglish => 'English';

  @override
  String get feedbackEmailSubject => '柚坛手表助手-问题反馈';

  @override
  String get feedbackEmailBody => '系统版本：\n\n反馈内容：\n\n\n\n\n\n\n\n';

  @override
  String get updateDialogTitle => '版本更新';

  @override
  String updateDialogMessage(Object remoteVersion, Object releaseDate) {
    return '发现新版本: $remoteVersion\n发布日期: $releaseDate';
  }

  @override
  String get updateDialogUpdate => '立即更新';

  @override
  String get networkErrorTitle => '无法连接服务器';

  @override
  String get networkErrorMessage => '请检查网络或稍后再试。';

  @override
  String get networkErrorExit => '退出';

  @override
  String get networkErrorRetry => '重试';

  @override
  String get setting_config => '设置';

  @override
  String get connect_successfully => '已成功连接！请保持设备连接并开启USB调试';
}
