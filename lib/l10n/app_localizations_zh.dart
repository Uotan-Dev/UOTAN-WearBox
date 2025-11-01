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
  String get homeGreetingEarlyMorning => '凌晨好';

  @override
  String get homeGreetingMorning => '早上好';

  @override
  String get homeGreetingAfternoon => '下午好';

  @override
  String get homeGreetingEvening => '晚上好';

  @override
  String get homeWelcomeMessage => '欢迎使用柚坛手表助手';

  @override
  String get homeNoDeviceDetected => '未检测到手表，请根据下方指引连接手表';

  @override
  String get homeConnectionMethodsTitle => '支持的连接方式：';

  @override
  String get homeConnectionWired => '1. 使用数据线/充电底座连接电脑与手表（推荐）';

  @override
  String get homeConnectionWirelessPrefix => '2. 使用无线连接，请点击';

  @override
  String get homeConnectionWirelessLink => '无线连接';

  @override
  String get homeConnectionWirelessSuffix => '进行无线局域网或蓝牙连接';

  @override
  String get homeTroubleshootTitle => '若无法连接请尝试：';

  @override
  String get homeTroubleshootUsbDebug => '1. 检查手表是否开启 USB 调试';

  @override
  String get homeTroubleshootUsbDebugLink => '查看教程';

  @override
  String get homeTroubleshootDriver => '2. 检查 USB 驱动是否安装';

  @override
  String get homeTroubleshootDriverLink => '安装驱动';

  @override
  String get homeTroubleshootReinstall => '3. 重新下载安装此应用，并检查应用版本更新';

  @override
  String get homeTroubleshootRestart => '4. 重新启动计算机、更换电脑或数据线并再次尝试连接';

  @override
  String get deviceBasicInfoTitle => '基本信息';

  @override
  String get deviceBatteryStatusTitle => '电池状况';

  @override
  String get deviceSystemVersionTitle => '系统版本';

  @override
  String deviceBrand(Object brand) {
    return '品牌: $brand';
  }

  @override
  String deviceResolution(Object resolution) {
    return '分辨率: $resolution';
  }

  @override
  String deviceModel(Object model) {
    return '型号: $model';
  }

  @override
  String deviceDpi(Object dpi) {
    return 'DPI: $dpi';
  }

  @override
  String deviceSerial(Object serial) {
    return '序列号: $serial';
  }

  @override
  String deviceMemory(Object memory) {
    return '内存: $memory';
  }

  @override
  String deviceUptime(Object uptime) {
    return '开机时间: $uptime';
  }

  @override
  String deviceStorage(Object storage) {
    return '储存: $storage';
  }

  @override
  String deviceBootloader(Object bootloader) {
    return 'BL锁: $bootloader';
  }

  @override
  String deviceArchitecture(Object architecture) {
    return '架构: $architecture';
  }

  @override
  String deviceBatteryLevel(Object level) {
    return '电量: $level%';
  }

  @override
  String deviceBatteryHealth(Object health) {
    return '健康: $health';
  }

  @override
  String deviceBatteryVoltage(Object voltage) {
    return '电压: ${voltage}mV';
  }

  @override
  String deviceBatteryTemperature(Object temperature) {
    return '温度: $temperature°C';
  }

  @override
  String deviceAndroidVersion(Object androidVersion) {
    return '安卓版本: $androidVersion';
  }

  @override
  String devicePatchDate(Object patchDate) {
    return '补丁日期: $patchDate';
  }

  @override
  String deviceSoftwareVersion(Object softwareVersion) {
    return '系统版本: $softwareVersion';
  }

  @override
  String deviceKernelVersion(Object kernelVersion) {
    return '内核版本: $kernelVersion';
  }

  @override
  String get featuresTitle => '功能列表';

  @override
  String get featureInstallApp => '安装应用';

  @override
  String get featureAppManagement => '应用管理';

  @override
  String get featureFileManagement => '文件管理';

  @override
  String get featureSendText => '发送文本';

  @override
  String get featureDisplaySettings => '显示设置';

  @override
  String get featureMemoryClean => '内存清理';

  @override
  String get featureKeySimulation => '按键模拟';

  @override
  String get featureBatteryManager => '电池管理';

  @override
  String get featureRotateScreen => '强制旋转屏幕';

  @override
  String get featureCapture => '截屏录屏';

  @override
  String get featureRePair => '重新配对';

  @override
  String get featureFlashTool => '刷机工具';

  @override
  String get featureComingSoonTitle => '敬请期待';

  @override
  String featureComingSoonMessage(Object feature) {
    return '由于软件重制，当前版本暂不支持 $feature，我们将尽快更新支持。';
  }

  @override
  String get dialogOk => '确定';

  @override
  String get setting_config => '设置';

  @override
  String get connect_successfully => '已成功连接！请保持设备连接并开启USB调试';
}
