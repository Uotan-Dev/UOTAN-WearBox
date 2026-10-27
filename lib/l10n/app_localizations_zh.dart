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
  String get donationTitle => '支持我们';

  @override
  String get donationChooseAmountLabel => '选择金额：';

  @override
  String donationAmountLabel(Object amount) {
    return '$amount元';
  }

  @override
  String get donationAmountCustom => '自定义';

  @override
  String donationSelectedAmount(Object amount) {
    return '￥$amount';
  }

  @override
  String get donationSelectedAmountCustom => '自定义金额';

  @override
  String get donationPaymentAlipay => '支付宝';

  @override
  String get donationPaymentWeChat => '微信';

  @override
  String get donationThanksMessage => '开发团队衷心感谢您的捐赠';

  @override
  String get donationNetworkErrorTitle => '网络连接错误';

  @override
  String get donationNetworkErrorBody => '无法连接服务器，请检查您的网络连接。';

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
  String get settingsFooter =>
      '柚坛手表助手\n© 2020-2026 Gnayoah.com All rights reserved.';

  @override
  String get settingsLanguageTitle => '语言设置';

  @override
  String get settingsLanguageSubtitle => '切换应用显示语言';

  @override
  String get settingsDarkModeTitle => '深色模式';

  @override
  String get settingsDarkModeSubtitle => '切换应用的浅色或深色外观';

  @override
  String get themeModeSystem => '跟随系统';

  @override
  String get themeModeAlwaysOn => '始终开启';

  @override
  String get themeModeAlwaysOff => '始终关闭';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get languageChinese => '简体中文';

  @override
  String get languageEnglish => 'English';

  @override
  String get wirelessPageTitle => '无线连接';

  @override
  String get wirelessHeaderIntro => '输入设备 IP 地址和端口';

  @override
  String get wirelessIpLabel => '设备 IP 地址';

  @override
  String get wirelessPortLabel => '端口号';

  @override
  String get wirelessConnectButton => '连接设备';

  @override
  String get wirelessErrorTitle => '错误';

  @override
  String get wirelessSuccessTitle => '成功';

  @override
  String get wirelessInputIncomplete => '请填写完整的 IP 地址和端口号';

  @override
  String wirelessConnectSuccess(Object target) {
    return '设备已成功连接到 $target';
  }

  @override
  String wirelessConnectFailure(Object details) {
    return '连接失败: $details';
  }

  @override
  String wirelessExecutionFailed(Object details) {
    return '执行失败: $details';
  }

  @override
  String get faqPageTitle => '常见问题';

  @override
  String get faqMenuTitle => '目录';

  @override
  String get faqMenuDeviceCannotConnect => '设备无法连接';

  @override
  String get faqMenuHowEnableUsbDebug => '如何启用 USB 调试';

  @override
  String get faqMenuWhyAdbDebug => '为什么我的设备显示的是 ADB 调试';

  @override
  String get faqMenuHowWirelessConnect => '如何通过无线连接';

  @override
  String get faqMenuHowGetWirelessIpPort => '如何获取无线调试IP地址和端口号';

  @override
  String get faqMenuFeatureNoResponse => '部分功能没反应';

  @override
  String get faqQ1Title => '1. 设备无法连接或无法检测到设备';

  @override
  String get faqQ1Body =>
      '请确保已启用 USB 调试功能，并在设备连接时授权 USB 调试权限。这是柚坛手表助手与您的设备进行通信的必要条件。';

  @override
  String get faqQ2Title => '2. 如何启用 USB 调试模式';

  @override
  String get faqQ2Intro => '请按照以下步骤操作：';

  @override
  String get faqQ2Step1 => '• 进入 <b>系统设置</b>，找到并点击 <b>关于本机</b>。';

  @override
  String get faqQ2Step2 => '• 连续点击 <b>版本号</b> 数次，直至提示已进入开发者模式。';

  @override
  String get faqQ2Step3 => '• 返回 <b>设置</b> 主界面，进入 <b>开发者选项</b>。';

  @override
  String get faqQ2Step4 => '• 在开发者选项中，启用 <b>USB 调试</b> 功能。';

  @override
  String get faqQ3Title => '3. 为什么我的设备显示的是 ADB 调试';

  @override
  String get faqQ3Body =>
      'ADB 调试 与 USB 调试 实质上是相同的功能。ADB 调试是通过 USB 接口与设备进行通信和调试的方式，因此两者没有区别。';

  @override
  String get faqQ4Title => '4. 如何通过无线连接';

  @override
  String get faqQ4Intro => '要实现设备的无线调试连接，请确保以下设置正确：';

  @override
  String get faqQ4Bullet1 =>
      '• 确保您的计算机和手表设备处于同一局域网内（无论是 2.4GHz 还是 5GHz 网络，关键在于设备需位于相同的 IP 网段内）。';

  @override
  String get faqQ4Bullet2 => '• 在手表的开发者选项中，启用 <b>无线调试</b> 或 <b>WLAN 调试</b> 功能。';

  @override
  String get faqQ4Conclusion => '启用无线调试选项后，即可通过柚坛手表助手与手表进行无线操作。';

  @override
  String get faqQ5Title => '5. 如何获取无线调试IP地址和端口号';

  @override
  String get faqQ5Intro => '您可以通过以下步骤获取：';

  @override
  String get faqQ5Body => '进入手表的开发者选项，找到并点击“无线调试信息”，即可查看当前设备的 IP 地址和端口号。';

  @override
  String get faqQ6Title => '6. 部分功能没反应';

  @override
  String get faqQ6Body1 =>
      '部分功能可能会因为不同品牌系统的限制而不可用，特别是定制安卓系统。柚坛手表助手支持90%的定制安卓系统功能，典型设备如 OPPO Watch、Meizu Watch 等。';

  @override
  String get faqQ6Body2 =>
      'WearOS by Google 系统设备支持 99% 的功能，典型设备如 Pixel Watch、Mi Watch、TicWatch 等。您可以多次重试操作。';

  @override
  String get faqQ6Body3 => '如遇某功能无效，您可以重试操作或重新连接设备。';

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
  String get updateDialogLater => '稍后再说';

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
  String get homeGreetingMorning => '贵安';

  @override
  String get homeGreetingAfternoon => '下午好';

  @override
  String get homeGreetingEvening => '晚上好';

  @override
  String get homeWelcomeMessage => '欢迎使用柚坛手表助手';

  @override
  String get homeNoDeviceDetected => '未检测到设备，请根据下方指引连接手表';

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
    return 'Bootloader 锁: $bootloader';
  }

  @override
  String deviceArchitecture(Object architecture) {
    return 'CPU 架构: $architecture';
  }

  @override
  String deviceBatteryLevel(Object level) {
    return '电量: $level%';
  }

  @override
  String deviceBatteryHealth(Object health) {
    return '电池健康: $health';
  }

  @override
  String deviceBatteryVoltage(Object voltage) {
    return '电池电压: ${voltage}mV';
  }

  @override
  String deviceBatteryTemperature(Object temperature) {
    return '电池温度: $temperature°C';
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
  String get featureMemoryClean => '储存/内存清理';

  @override
  String get featureKeySimulation => '按键模拟';

  @override
  String get featureBatteryManager => '电池管理';

  @override
  String get featureRotateScreen => '强制旋转屏幕';

  @override
  String get featureCapture => '截屏录屏';

  @override
  String get featureRePair => 'WearOS 重新配对';

  @override
  String get featureFlashTool => '自定义刷入';

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

  @override
  String get installApptoWatch => '安装应用到手表';

  @override
  String get selectApptoInstall => '选择APK文件并安装';

  @override
  String get installingWaiting => '安装进行中，请稍候...';

  @override
  String get installNoDeviceTitle => '没有连接设备';

  @override
  String get installNoDeviceMessage => '没有检测到设备，请确保设备已连接。';

  @override
  String get installSuccessTitle => '安装成功';

  @override
  String get installSuccessMessage => '应用已成功安装！';

  @override
  String get installFailureTitle => '安装失败';

  @override
  String get installFailureMessage => '安装过程中出现问题。';

  @override
  String installFailureWithReason(Object error) {
    return '出现错误：$error';
  }

  @override
  String installErrorOutput(Object details) {
    return '错误: $details';
  }

  @override
  String get installTipTitle => '提示';

  @override
  String get installNoFileSelected => '未选择任何文件';

  @override
  String get commonErrorTitle => '错误';

  @override
  String get commonNoticeTitle => '提示';

  @override
  String get buttonPageTitle => '按键模拟';

  @override
  String get buttonDeviceNotConnectedTitle => '设备未连接';

  @override
  String get buttonDeviceNotConnectedMessage => '请检查设备是否连接到电脑，并开启USB调试模式';

  @override
  String get buttonConnectFirstMessage => '请先连接设备';

  @override
  String buttonSendKeySuccess(Object keycode) {
    return '成功发送按键事件：$keycode';
  }

  @override
  String buttonExecutionFailed(Object details) {
    return '执行失败: $details';
  }

  @override
  String get buttonNameHome => '主键';

  @override
  String get buttonNameBack => '返回';

  @override
  String get buttonNamePower => '电源';

  @override
  String get buttonNameVolumeUp => '音量+';

  @override
  String get buttonNameVolumeDown => '音量-';

  @override
  String get buttonNameSpeakerMute => '扬声器静音';

  @override
  String get buttonNameMicMute => '话筒静音';

  @override
  String get buttonNameCallDial => '电话拨号';

  @override
  String get buttonNameCallEnd => '电话挂断';

  @override
  String get buttonNamePlayPause => '暂停/播放';

  @override
  String get buttonNameNextTrack => '下一曲';

  @override
  String get buttonNamePreviousTrack => '上一曲';

  @override
  String get buttonNameScreenOn => '亮屏';

  @override
  String get buttonNameScreenOff => '息屏';

  @override
  String get displayPageTitle => '显示设置';

  @override
  String get displayValueUnknown => '未获取';

  @override
  String get displayValueUnavailable => '无法获取';

  @override
  String get displayDeviceNotConnectedMessage => '未检测到设备，请检查设备连接';

  @override
  String displayErrorCheckingConnection(Object error) {
    return '无法检测设备连接状态: $error';
  }

  @override
  String displayCurrentDpi(Object value) {
    return '当前DPI: $value';
  }

  @override
  String displaySelectedDpi(Object value) {
    return '已选: $value';
  }

  @override
  String get displayDpiLabel => 'DPI：';

  @override
  String get displayResetDefaultButton => '恢复默认';

  @override
  String get displayApplyDpiButton => '修改DPI';

  @override
  String displayCurrentResolution(Object value) {
    return '当前分辨率: $value';
  }

  @override
  String displaySelectedResolution(Object value) {
    return '已选: $value';
  }

  @override
  String get displayWidthLabel => '宽度：';

  @override
  String get displayHeightLabel => '高度：';

  @override
  String get displayApplyResolutionButton => '修改分辨率';

  @override
  String displayDpiSetSuccess(Object value) {
    return 'DPI 已修改为: $value';
  }

  @override
  String displayDpiSetFailure(Object error) {
    return '无法修改DPI: $error';
  }

  @override
  String displayResolutionSetSuccess(Object value) {
    return '分辨率已修改为: $value';
  }

  @override
  String displayResolutionSetFailure(Object error) {
    return '无法修改分辨率: $error';
  }

  @override
  String get displayDpiResetSuccess => 'DPI 已恢复为默认值';

  @override
  String displayDpiResetFailure(Object error) {
    return '无法恢复默认DPI: $error';
  }

  @override
  String get displayResolutionResetSuccess => '分辨率已恢复为默认值';

  @override
  String displayResolutionResetFailure(Object error) {
    return '无法恢复默认分辨率: $error';
  }

  @override
  String get displayDeviceDisconnectedMessage => '检测到设备已断开连接。';

  @override
  String get dialogCancel => '取消';

  @override
  String get dialogConfirm => '确认';

  @override
  String get appManageTitle => '应用管理';

  @override
  String get appManageShowSystemApps => '显示系统应用';

  @override
  String get appManageNoAppsOrDevice => '未检测到已安装应用或设备未连接。';

  @override
  String appManageCannotFetch(Object error) {
    return '无法获取已安装的应用列表: $error';
  }

  @override
  String get appManageDeviceDisconnected => '检测到设备已断开连接。';

  @override
  String get appManageTooltipUnfreeze => '解冻';

  @override
  String get appManageTooltipFreeze => '冻结';

  @override
  String get appManageTooltipExportApk => '导出APK';

  @override
  String get appManageTooltipUninstall => '卸载';

  @override
  String get appManageConfirmUninstallTitle => '确认卸载';

  @override
  String appManageConfirmUninstallMessage(Object packageName) {
    return '确定要卸载 $packageName 吗？';
  }

  @override
  String get appManagePullProgress => '正在提取APK...';

  @override
  String appManagePullSuccess(Object path) {
    return 'APK 已成功提取到：$path';
  }

  @override
  String appManagePullFailure(Object error) {
    return '无法提取 APK 文件: $error';
  }

  @override
  String appManageUninstallSuccess(Object packageName) {
    return '应用已成功卸载：$packageName';
  }

  @override
  String appManageUninstallFailure(Object error) {
    return '无法卸载应用：$error';
  }

  @override
  String appManageFreezeSuccess(Object packageName) {
    return '应用已冻结：$packageName';
  }

  @override
  String appManageFreezeFailure(Object error) {
    return '无法冻结应用：$error';
  }

  @override
  String appManageUnfreezeSuccess(Object packageName) {
    return '应用已解冻：$packageName';
  }

  @override
  String appManageUnfreezeFailure(Object error) {
    return '无法解冻应用：$error';
  }

  @override
  String fileManagerListFailure(Object path) {
    return '无法列出 $path 下的文件，请检查设备连接状态';
  }

  @override
  String fileManagerErrorMessage(Object error) {
    return '错误: $error';
  }

  @override
  String get fileManagerSuccessTitle => '成功';

  @override
  String get fileManagerConfirmDeleteTitle => '确认删除';

  @override
  String fileManagerConfirmDeleteMessage(Object entry) {
    return '确定要删除 $entry 吗？';
  }

  @override
  String get fileManagerDeleteButton => '删除';

  @override
  String fileManagerDeleteProgress(Object entry) {
    return '正在删除 $entry...';
  }

  @override
  String fileManagerDeleteSuccess(Object entry) {
    return '删除 $entry 成功';
  }

  @override
  String fileManagerDeleteFailure(Object entry) {
    return '无法删除 $entry';
  }

  @override
  String get fileManagerRenameTitle => '重命名';

  @override
  String get fileManagerRenameLabel => '输入新的名称';

  @override
  String get fileManagerRenameAction => '重命名';

  @override
  String get fileManagerSaveDialogTitle => '选择保存位置';

  @override
  String fileManagerSaveProgress(Object file) {
    return '正在保存 $file 到本地...';
  }

  @override
  String fileManagerSaveSuccess(Object path) {
    return '文件已成功保存到 $path';
  }

  @override
  String get fileManagerSaveFailure => '无法复制文件到本地';

  @override
  String get fileManagerUploadProgress => '正在上传文件...';

  @override
  String fileManagerUploadSuccess(Object path) {
    return '文件已成功上传到 $path';
  }

  @override
  String get fileManagerUploadFailure => '无法上传文件到设备';

  @override
  String get fileManagerContextRename => '重命名';

  @override
  String get fileManagerContextCopy => '复制到电脑';

  @override
  String get fileManagerContextDelete => '删除';

  @override
  String fileManagerTitle(Object path) {
    return '文件管理 ($path)';
  }

  @override
  String get fileManagerRootLabel => '内部存储';

  @override
  String get pairingPageTitle => '免重置重新配对 (WearOS)';

  @override
  String pairingStepTitle(Object step) {
    return '第 $step 步';
  }

  @override
  String get pairingStepDescription1 => '在旧手机设置中，断开并删除手机与手表的蓝牙配对连接。';

  @override
  String get pairingClearServicesButton => '清除 Google 服务并重启';

  @override
  String get pairingStepDescription4 => '在新手机上，打开 WearOS by Google 应用，配对连接手表。';

  @override
  String get pairingEnableBluetoothButton => '开启蓝牙可见模式';

  @override
  String pairingClearFailure(Object error) {
    return '清除 Google 服务失败: $error';
  }

  @override
  String get pairingRebooting => '设备正在重启...';

  @override
  String pairingRebootFailure(Object error) {
    return '重启失败: $error';
  }

  @override
  String pairingExecuteFailure(Object error) {
    return '执行失败: $error';
  }

  @override
  String get pairingBluetoothEnabled => '蓝牙可见模式已开启';

  @override
  String get rotatePageTitle => '旋转屏幕';

  @override
  String get rotateButtonLeft => '向左旋转';

  @override
  String get rotateButtonRight => '向右旋转';

  @override
  String get rotateButtonFlip => '上下翻转';

  @override
  String get rotateButtonReset => '恢复默认';

  @override
  String rotateSuccessMessage(Object direction) {
    return '成功旋转屏幕：$direction';
  }

  @override
  String rotateExecuteFailure(Object error) {
    return '执行失败: $error';
  }

  @override
  String get typePageTitle => '发送文本到手表';

  @override
  String get typeHint => '在这里输入你的文本...';

  @override
  String get typeImportButton => '导入文本';

  @override
  String get typeClearButton => '清空文本';

  @override
  String get typeSendButton => '发送文本到手表';

  @override
  String typeImportFailure(Object error) {
    return '无法导入文本文件: $error';
  }

  @override
  String get typeNoDeviceMessage => '未检测到设备，请检查设备连接';

  @override
  String get typeEmptyTextMessage => '请输入文本';

  @override
  String get typeSendingProgress => '正在发送文本...';

  @override
  String get typePermissionDenied => '权限不足。请前往“开发者选项”开启“USB调试（安装设置）”后重试。';

  @override
  String get typeSendSuccess => '文本已成功发送到设备';

  @override
  String typeSendFailure(Object error) {
    return '发生错误: $error';
  }

  @override
  String typeConnectionCheckFailure(Object error) {
    return '无法检测设备连接状态: $error';
  }

  @override
  String get viewOnGithub => 'Github';

  @override
  String get githubDescription => '在 AGPL-3.0 License 下开源';

  @override
  String get driverTitle => 'USB 驱动安装指南';

  @override
  String get driverIntro =>
      '本教程仅适用于 Windows 系统，使用 MacOS 或 Linux 系统的用户无需安装 USB 驱动';

  @override
  String get driverStep1Title => '1. 下载 USB 驱动程序';

  @override
  String get driverStep1LinkPrefix => '进入';

  @override
  String get driverStep1LinkText => 'Android USB 驱动';

  @override
  String get driverStep1LinkSuffix => '下载页面（此网址可在中国大陆直接访问）';

  @override
  String get driverStep1DownloadInstructions =>
      '点击“Download the Google USB Driver ZIP file (ZIP)”同意许可后下载“usb_driver_r13-windows.zip”并解压至任意位置。';

  @override
  String get driverStep2Title => '2. 打开“设备管理器”';

  @override
  String get driverStep2Description => '打开设置并进入系统信息，打开“设备管理器”。';

  @override
  String get driverStep3Title => '3. 连接设备';

  @override
  String get driverStep3Description =>
      '将您的设备通过数据线/充电底座连接电脑，在设备管理器中找到其它设备或便携式设备选项并展开。';

  @override
  String get driverStep4Title => '4. 更新驱动程序';

  @override
  String get driverStep4Description => '右键单击您连接的设备的名称，然后选择“更新驱动程序”。';

  @override
  String get driverStep5Title => '5. 在弹出的窗口中选择“浏览我的电脑以查找驱动程序”';

  @override
  String get driverStep6Title => '6. 选择驱动程序';

  @override
  String get driverStep6Description =>
      '点击“浏览”然后找到您刚下载的 USB 驱动程序文件夹“usb_driver_r13-windows”。';

  @override
  String get driverStep7Title => '7. 安装驱动程序';

  @override
  String get driverStep7Description => '点击“下一步”安装驱动程序，随后安装完成。';

  @override
  String driverUrlLaunchError(Object url) {
    return '无法打开链接: $url';
  }

  @override
  String get tutorialTitle => '开启USB调试教程（适用于多数设备）';

  @override
  String get homeConnectionHelp => '连接帮助';

  @override
  String get homeWirelessUse => '2. 使用';

  @override
  String get homeCheckDebugPrefix => '3. 检查是否已开启';

  @override
  String get homeUsbDebugLink => 'USB 调试';

  @override
  String get homeInstallDriverPrefix => '并安装了';

  @override
  String get homeAdbDriverLink => 'ADB 驱动';

  @override
  String get homeDriverSuffix => '程序';

  @override
  String get homeRebootTo => '重启至';

  @override
  String get homeSystem => '系统';

  @override
  String get homeSelectDevice => '选择设备';

  @override
  String get homeNoConnectedDevices => '无已连接设备';

  @override
  String get homeRefreshing => '刷新中...';

  @override
  String get homeRefreshDevices => '刷新设备';

  @override
  String get homeDevicesRefreshed => '设备列表已刷新';

  @override
  String homeRefreshFailed(String error) {
    return '刷新设备失败: $error';
  }

  @override
  String get homeDeviceInfo => '设备信息';

  @override
  String get homeSelectDeviceFirst => '请先选择设备';

  @override
  String get homeCommandSent => '命令已发送';

  @override
  String commandExitFailure(String code) {
    return '执行失败: $code';
  }

  @override
  String homeAdbError(String error) {
    return 'ADB 执行异常: $error';
  }

  @override
  String get batteryCurrentLevel => '当前电量';

  @override
  String get batteryTemperatureLabel => '温度(°C)';

  @override
  String get batteryLevelLabel => '电量(%)';

  @override
  String get batterySimulateDischarging => '模拟非充电';

  @override
  String get batterySimulateWireless => '模拟无线充电';

  @override
  String get batterySimulateUsb => '模拟USB充电';

  @override
  String get batteryRestoreDefault => '恢复默认';

  @override
  String get batteryModify => '修改';

  @override
  String get batteryHealthGood => '良好 (2)';

  @override
  String get batteryHealthOverheat => '过热 (3)';

  @override
  String get batteryHealthDead => '损坏 (4)';

  @override
  String get batteryHealthOverVoltage => '过压 (5)';

  @override
  String get batteryHealthFailure => '异常 (6)';

  @override
  String get batteryHealthCold => '过冷 (7)';

  @override
  String batteryHealthUnknown(String code) {
    return '未知 ($code)';
  }

  @override
  String get batteryResetSuccess => '电池模拟参数已恢复。';

  @override
  String get batteryEnterTemperature => '请输入温度值。';

  @override
  String get batteryInvalidTemperature => '温度格式无效。';

  @override
  String batteryTemperatureChanged(String temperature) {
    return '温度已修改为 $temperature°C';
  }

  @override
  String get batteryEnterLevel => '请输入电量。';

  @override
  String get batteryInvalidLevel => '电量必须是 0-100 的整数。';

  @override
  String batteryLevelChanged(String level) {
    return '电量已修改为 $level%';
  }

  @override
  String get adbCommandFailed => 'ADB 命令执行失败。';

  @override
  String adbCommandError(String details) {
    return 'ADB 命令执行失败: $details';
  }

  @override
  String get adbCommandTimeout => 'ADB 命令超时，请检查设备连接后重试。';

  @override
  String adbExecutionError(String error) {
    return '无法执行 ADB 命令: $error';
  }

  @override
  String get adbConnectionTimeout => 'ADB 连接检查超时，请检查数据线或无线连接。';

  @override
  String adbConnectionError(String error) {
    return '无法检查设备连接状态: $error';
  }

  @override
  String get captureSaveLocation => '保存位置';

  @override
  String get captureComputerFolder => '电脑文件夹';

  @override
  String get captureDeviceFolder => '设备文件夹';

  @override
  String get captureChooseFolder => '选择文件夹';

  @override
  String get captureSetDevicePath => '设置设备路径';

  @override
  String get captureSectionTitle => '截屏与录屏';

  @override
  String get captureTakeScreenshot => '立即截屏';

  @override
  String get captureStartRecording => '开始录屏';

  @override
  String get captureStopRecording => '停止录屏';

  @override
  String get captureLocationLockedHint => '录屏开始后会锁定当前保存位置，防止中途切换导致导出异常。';

  @override
  String get captureChooseSaveFolder => '选择保存文件夹';

  @override
  String get captureDeviceSavePath => '设置设备保存路径';

  @override
  String get captureScreenshotFailed => '设备截屏失败';

  @override
  String captureScreenshotSavedDevice(String path) {
    return '截屏已保存到设备:\n$path';
  }

  @override
  String get captureScreenshotExportFailed => '导出截屏失败';

  @override
  String captureScreenshotSavedComputer(String path) {
    return '截屏已保存到电脑:\n$path';
  }

  @override
  String commandExecutionError(String error) {
    return '执行失败: $error';
  }

  @override
  String get captureRecordingStartFailed => '开始录屏失败';

  @override
  String get captureRecordingProcessMissing => '未能获取录屏进程，请确认设备支持 screenrecord。';

  @override
  String get captureRecordingStarted => '已开始录屏。';

  @override
  String get captureRecordingInvalidState => '录屏状态异常，请重新开始录屏。';

  @override
  String captureRecordingSavedDevice(String path) {
    return '录屏已保存到设备:\n$path';
  }

  @override
  String get captureRecordingExportFailed => '导出录屏失败';

  @override
  String captureRecordingSavedComputer(String path) {
    return '录屏已保存到电脑:\n$path';
  }

  @override
  String get flashPageTitle => '自定义刷入';

  @override
  String get flashCustomPartition => '自定义分区';

  @override
  String get flashChooseFile => '文件';

  @override
  String get flashTargetPartition => '刷入至';

  @override
  String get flashAction => '刷入';

  @override
  String get flashLogTitle => '日志输出';

  @override
  String get flashNoLogs => '暂无日志';

  @override
  String get flashQuickActions => '快捷操作';

  @override
  String get flashDisableVbmeta => '禁用vbmeta';

  @override
  String get flashSwitchSlot => '切换槽位';

  @override
  String get flashSelectImageFirst => '请先选择镜像文件。';

  @override
  String get flashEnterPartition => '请输入分区名。';

  @override
  String get flashSelectVbmetaImage => '选择 vbmeta 镜像文件';

  @override
  String get flashUnknownSlot => '无法识别当前槽位。请检查 fastboot 输出日志。';

  @override
  String flashSwitchSlotFailed(String error) {
    return '切换槽位失败: $error';
  }

  @override
  String flashOperationFailed(String code) {
    return '操作失败，退出码: $code';
  }

  @override
  String flashExecutionError(String error) {
    return '无法执行 fastboot 命令: $error';
  }

  @override
  String get flashNoDevice => '未检测到 fastboot 设备，请确认设备已进入 fastboot 模式。';

  @override
  String flashDetectionError(String error) {
    return '无法检测 fastboot 设备，请确认 fastboot 已安装并可用。\n$error';
  }

  @override
  String get memoryStatusTitle => '内存状态';

  @override
  String get memoryTotal => '总内存';

  @override
  String get memoryUsed => '已使用';

  @override
  String get memoryAvailable => '可用内存';

  @override
  String get memoryFree => '空闲内存';

  @override
  String get memoryCached => '缓存';

  @override
  String get memoryCleanupTitle => '清理操作';

  @override
  String get memoryClearBackground => '一键清理后台';

  @override
  String get memoryClearCache => '清理应用缓存';

  @override
  String get memoryCustomPackage => '自定义清理包名';

  @override
  String get memoryPackageHint => '例如: com.google.android.gms';

  @override
  String get memoryForceStop => '强制停止该应用';

  @override
  String get memoryBackgroundCleared => '后台进程清理完成。';

  @override
  String get memoryCacheCommandSent => '缓存清理命令已执行。';

  @override
  String get memoryEnterPackage => '请输入包名。';

  @override
  String memoryStopAttempted(String packageName) {
    return '已尝试停止: $packageName';
  }

  @override
  String commandStderrFailure(String details) {
    return '执行失败: $details';
  }

  @override
  String commandExitCodeFailure(String code) {
    return '执行失败，退出码: $code';
  }

  @override
  String get privacyParagraph1 => '隐私政策';

  @override
  String get privacyParagraph2 => '柚坛手表助手隐私政策';

  @override
  String get privacyParagraph3 => '更新日期：2024年9月19日';

  @override
  String get privacyParagraph4 =>
      '欢迎使用柚坛手表助手（以下简称“本应用”）。我们深刻理解个人信息对您的重要性，并承诺严格遵守相关法律法规的要求，采取适当的安全保护措施，保障您的个人信息安全。请您在使用本应用前，仔细阅读并充分理解本隐私政策的全部内容。';

  @override
  String get privacyParagraph5 => '一、我们收集的信息 ';

  @override
  String get privacyParagraph6 =>
      '1. 互联网协议地址：为确保本应用的正常运行和系统安全，我们仅在必要情况下收集您的互联网协议地址。除互联网协议地址外，我们不收集任何其他可识别您个人身份的信息。';

  @override
  String get privacyParagraph7 => '2. 必要的权限获取:';

  @override
  String get privacyParagraph8 =>
      '     - 网络访问权限：本应用需要获取网络访问权限，以实现数据传输、服务器通信和功能更新。\n     - 读取设备信息权限：为优化应用性能、提升兼容性，我们可能需要读取您的设备信息，例如设备型号、操作系统版本等。\n     - 读写存储权限：本应用可能需要读取和写入设备存储空间，以缓存数据、保存用户设置并提供离线功能。';

  @override
  String get privacyParagraph9 => '二、我们如何使用信息 ';

  @override
  String get privacyParagraph10 =>
      '1. 提供和维护服务：利用收集的互联网协议地址和设备信息，确保本应用的正常运行、功能完善，并持续优化用户体验。';

  @override
  String get privacyParagraph11 =>
      '2. 安全保障：使用互联网协议地址和设备信息进行安全监测和风险防范，包括但不限于预防欺诈、网络攻击和其他可能危害系统安全的活动。';

  @override
  String get privacyParagraph12 => '三、处理个人信息的法律依据';

  @override
  String get privacyParagraph13 =>
      '如果您是中华人民共和国大陆地区的用户，我们将依据《中华人民共和国网络安全法》、《信息安全技术 个人信息安全规范》（GB/T 35273-2017）以及其他相关法律法规，收集和使用您的个人信息，为您提供产品和/或服务。我们通常仅在征得您同意的情况下收集您的个人信息。在某些情况下，我们可能基于法律义务或履行合同必要性收集您的个人信息，或者需要您的个人信息来保护您或他人的重要利益。';

  @override
  String get privacyParagraph14 => '四、信息的共享、转让和公开披露';

  @override
  String get privacyParagraph15 =>
      '1. 法律法规要求：在符合法律法规的前提下，若司法机关或政府主管部门依法要求，我们可能会披露您的个人信息。';

  @override
  String get privacyParagraph16 =>
      '2. 业务转让：在涉及合并、收购、资产转让或其他类似交易时，您的个人信息可能作为资产之一被转移。我们将要求新的持有方继续受本隐私政策的约束，否则将要求其重新取得您的授权同意。';

  @override
  String get privacyParagraph17 => '3. 未经授权的披露：除非获得您的明确同意，我们不会公开披露您的个人信息。';

  @override
  String get privacyParagraph18 => '4. 共享、转让、公开披露个人信息授权同意的例外';

  @override
  String get privacyParagraph19 =>
      '根据相关法律法规的规定，在以下情形中，我们可能在不征得您的授权同意的情况下共享、转让、公开披露您的个人信息：';

  @override
  String get privacyParagraph20 =>
      '    - 与国家安全、国防安全有关的；\n    - 与公共安全、公共卫生、重大公共利益有关的；\n    - 与刑事侦查、起诉、审判和判决执行等有关的；\n    - 出于维护您或其他个人的生命、财产等重大合法权益但又难以获得本人同意的；\n    - 您自行向社会公众公开的个人信息；\n    - 从合法公开披露的信息中收集到的个人信息，如合法的新闻报道、政府信息公开等渠道；\n    - 法律法规规定的其他情形。';

  @override
  String get privacyParagraph21 => '五、信息的存储和保护';

  @override
  String get privacyParagraph22 =>
      '1. 信息存储：我们将在中华人民共和国境内或香港特别行政区存储我们获取的您的信息。如果发生数据的跨境传输，我们会以弹窗或邮件的方式单独告知您数据出境的目的、接收方等，并征得您的授权同意。我们将确保数据接收方具备充分的数据保护能力，以保护您的个人信息。';

  @override
  String get privacyParagraph23 =>
      '2. 安全措施：我们致力于采取符合业界标准的物理、电子和管理方面的安全措施来保护您的个人信息安全。我们积极建立数据分类分级制度、数据安全管理规范、数据安全开发规范，以管理和规范个人信息的存储和使用，确保不收集与我们提供的服务无关的个人信息。';

  @override
  String get privacyParagraph24 =>
      '3. 安全事件处理：尽管我们将尽力确保您发送给我们的任何信息的安全性，但请您理解，由于技术的限制以及互联网行业可能存在的各种恶意手段，信息不可能始终保证百分之百的安全。您需要了解，您接入我们服务所用的系统和通讯网络，有可能因我们可控范围外的因素而出现问题。';

  @override
  String get privacyParagraph25 =>
      '为防止安全事故的发生，我们制定了完善的预警机制和应急预案。如果不幸发生个人信息安全事件，我们将按照法律法规的要求，及时向您告知安全事件的基本情况和可能的影响、我们已采取或将要采取的处置措施、您可自主防范和降低风险的建议以及对您的补救措施，并立即启动应急预案，力求将损失降到最低。我们将通过电话、推送通知等方式及时告知您；如果难以逐一告知，我们会采取合理、有效的方式发布公告。同时，我们还将按照监管部门的要求，主动上报个人信息安全事件的处置情况，密切配合政府机关的工作。';

  @override
  String get privacyParagraph26 => '六、您的权利';

  @override
  String get privacyParagraph27 =>
      '1. 访问和更正权：您有权访问并更新您的个人信息。若需行使上述权利，请通过本政策提供的联系方式与我们联系。';

  @override
  String get privacyParagraph28 =>
      '2. 删除和撤回同意权：在符合法律法规的情况下，您有权请求删除您的个人信息或撤回对我们的授权同意。请注意，删除或撤回同意可能导致我们无法继续为您提供部分或全部服务。';

  @override
  String get privacyParagraph29 => '七、未成年人保护';

  @override
  String get privacyParagraph30 =>
      '我们非常重视未成年人的个人信息保护。若您未满18周岁，您应在您的父母或法定监护人同意并指导下使用本应用，并在征得其同意的前提下向我们提供您的个人信息。';

  @override
  String get privacyParagraph31 => '八、隐私政策的更新';

  @override
  String get privacyParagraph32 =>
      '鉴于业务的发展或法律法规的变化，我们可能会适时修订本隐私政策。修订后的隐私政策将在本页面上发布，并自发布之日起生效。我们建议您定期查阅本政策，以了解最新的隐私保护措施。';

  @override
  String get privacyParagraph33 => '九、适用法律与争议解决';

  @override
  String get privacyParagraph34 =>
      '本隐私政策的订立、生效、履行、解释及争议解决均适用中华人民共和国法律。因本隐私政策产生的任何争议，双方应友好协商解决；协商不成的，任何一方可向本应用所在地有管辖权的人民法院提起诉讼。';

  @override
  String get privacyParagraph35 => '十、联系我们';

  @override
  String get privacyParagraph36 =>
      '如您对本隐私政策有任何疑问、意见或建议，或需要行使您的相关权利，请通过以下方式与我们联系：\n电子邮箱：support@Gnayoah.com';

  @override
  String get privacyParagraph37 => '我们将尽快审核所涉问题，并在收到您的请求后及时予以回复。';

  @override
  String get privacyParagraph38 => '感谢您对柚坛手表助手的信任与支持。';

  @override
  String get agreementParagraph1 => '用户协议';

  @override
  String get agreementParagraph2 => '柚坛手表助手用户协议';

  @override
  String get agreementParagraph3 => '更新日期：2024年9月18日';

  @override
  String get agreementParagraph4 =>
      '在使用柚坛手表助手（以下简称“本应用”或“我们”）之前，请仔细阅读并充分理解本用户协议（以下简称“本协议”）。本协议是您（以下简称“用户”或“您”）与柚坛手表助手之间就使用本应用所订立的具有法律约束力的协议。您下载、安装或以其他方式使用本应用，即表示您已阅读、理解并同意接受本协议的全部条款和条件。';

  @override
  String get agreementParagraph5 => '一、 隐私政策的独立性';

  @override
  String get agreementParagraph6 =>
      '柚坛社区的隐私政策与柚坛手表助手的隐私政策完全独立，互不关联。如您需要查阅柚坛社区的隐私政策，敬请前往柚坛社区官方网站。本应用的隐私政策仅适用于柚坛手表助手，特此声明。';

  @override
  String get agreementParagraph7 => '二、协议的接受与变更';

  @override
  String get agreementParagraph8 => '1. 协议的接受';

  @override
  String get agreementParagraph9 =>
      '您在使用本应用前，应认真阅读本协议的全部内容。如果您不同意本协议的任何条款，您应立即停止使用本应用。您的下载、安装或使用行为即视为您已阅读并同意接受本协议的约束。';

  @override
  String get agreementParagraph10 => '2. 协议的修改';

  @override
  String get agreementParagraph11 =>
      '我们保留根据业务发展或法律法规的变化，随时对本协议进行修订的权利，且无需另行个别通知您。修订后的协议一经发布，立即生效。您有义务自行查阅本协议的最新版本；若您在协议内容变更后继续使用本应用，视为您已接受修订后的协议内容。';

  @override
  String get agreementParagraph12 => '三、服务内容与使用规范';

  @override
  String get agreementParagraph13 => '1. 服务内容';

  @override
  String get agreementParagraph14 =>
      '本应用为用户提供与手表相关的辅助功能和服务，包括但不限于时间显示、闹钟设定、健康监测等。具体服务内容以本应用实际提供的功能为准。';

  @override
  String get agreementParagraph15 => '2. 服务的变更、中断或终止';

  @override
  String get agreementParagraph16 =>
      '我们有权根据实际情况，随时调整、暂停或终止部分或全部服务，且无需事先通知您。对于因服务的调整、暂停或终止所导致的任何损失，我们不承担任何责任。';

  @override
  String get agreementParagraph17 => '四、用户行为准则';

  @override
  String get agreementParagraph18 => '1. 合法合规使用';

  @override
  String get agreementParagraph19 =>
      '您承诺依法使用本应用，不得利用本应用从事任何违反法律法规、社会公德或侵犯他人合法权益的行为，包括但不限于：';

  @override
  String get agreementParagraph20 =>
      '• 侵犯知识产权：不得未经授权复制、传播、修改或以其他方式使用受版权、商标权、专利权等法律保护的内容。';

  @override
  String get agreementParagraph21 =>
      '• 发布不当信息：不得发布、传播含有淫秽、色情、赌博、暴力、恐怖、迷信、诽谤、侮辱、煽动、教唆犯罪等法律法规禁止的内容。';

  @override
  String get agreementParagraph22 =>
      '• 危害系统安全：不得实施任何破坏或试图破坏网络安全的行为，包括但不限于传播恶意程序、病毒、木马、蠕虫等，攻击本应用的服务器、网络或其他用户的设备。';

  @override
  String get agreementParagraph23 => '2. 遵守法律法规';

  @override
  String get agreementParagraph24 =>
      '您在使用本应用时，应严格遵守《中华人民共和国网络安全法》、《中华人民共和国民法典》等相关法律法规，不得利用本应用从事任何违法犯罪活动。';

  @override
  String get agreementParagraph25 => '五、知识产权保护';

  @override
  String get agreementParagraph26 => '1. 权利归属';

  @override
  String get agreementParagraph27 =>
      '本应用及其所有内容，包括但不限于文字、图形、界面设计、视觉效果、标识、商标、计算机代码、程序、软件、服务、文档等，均受《中华人民共和国著作权法》、《中华人民共和国商标法》、《中华人民共和国专利法》等法律法规的保护，相关权利归属Gnayoah或其授权人所有。';

  @override
  String get agreementParagraph28 => '2. 许可使用';

  @override
  String get agreementParagraph29 =>
      '我们授予您一项个人的、不可转让的、非独占性的、可撤销的有限许可，允许您按照本协议的规定下载、安装和使用本应用。除非事先取得我们的书面同意，您不得以任何方式复制、修改、分发、出售、转让或以其他方式利用本应用的任何部分。';

  @override
  String get agreementParagraph30 => '3. 禁止行为';

  @override
  String get agreementParagraph31 =>
      '未经我们或相关权利人书面授权，您不得以任何形式实施、利用、转让或许可任何第三方实施、利用或转让上述知识产权，包括但不限于对本应用进行反向工程、反向编译、反向汇编、破解等。';

  @override
  String get agreementParagraph32 => '六、隐私政策与数据保护';

  @override
  String get agreementParagraph33 => '1. 个人信息保护';

  @override
  String get agreementParagraph34 =>
      '我们非常重视用户的个人信息保护，并将严格按照本应用的《隐私政策》及相关法律法规的规定，收集、使用、存储和分享您的个人信息。';

  @override
  String get agreementParagraph35 => '2. 政策的接受';

  @override
  String get agreementParagraph36 =>
      '您在使用本应用时，表示您已阅读并同意我们的《隐私政策》的全部内容。如您不同意《隐私政策》的任何内容，请立即停止使用本应用。';

  @override
  String get agreementParagraph37 => '七、免责声明与责任限制';

  @override
  String get agreementParagraph38 => '1. 服务的现状提供';

  @override
  String get agreementParagraph39 =>
      '本应用以“现状”和“可提供”为基础向您提供服务。我们不对本应用的持续性、及时性、安全性、准确性、完整性或可靠性作任何明示或默示的保证。';

  @override
  String get agreementParagraph40 => '2. 责任限制';

  @override
  String get agreementParagraph41 =>
      '在适用法律允许的最大范围内，对于因使用或无法使用本应用所导致的任何直接、间接、偶然、特殊、后果性或惩罚性损害赔偿，包括但不限于利润损失、数据丢失、业务中断等，我们不承担任何责任。';

  @override
  String get agreementParagraph42 => '3. 第三方责任';

  @override
  String get agreementParagraph43 =>
      '对于您通过本应用访问的任何第三方网站、服务或资源的内容、准确性、合法性或可靠性，我们不承担任何责任。您应自行承担因使用第三方服务所产生的风险。';

  @override
  String get agreementParagraph44 => '八、违约责任与救济措施';

  @override
  String get agreementParagraph45 => '1. 违约处理';

  @override
  String get agreementParagraph46 =>
      '若您违反本协议或相关法律法规的规定，我们有权在不事先通知的情况下，采取包括但不限于警告、限制、暂停或终止您对本应用的访问和使用，保存有关记录，并依法追究您的法律责任。';

  @override
  String get agreementParagraph47 => '2. 赔偿责任';

  @override
  String get agreementParagraph48 =>
      '因您违反本协议或相关法律法规的规定，导致我们或任何第三方遭受损失，您应依法承担全部赔偿责任，包括但不限于直接损失、间接损失、预期利益损失、诉讼费、律师费等。';

  @override
  String get agreementParagraph49 => '九、协议的终止与后果';

  @override
  String get agreementParagraph50 => '1. 我们的终止权';

  @override
  String get agreementParagraph51 =>
      '我们有权基于自身业务考虑，在任何时间、以任何理由，终止本协议、限制、暂停或终止您对本应用的访问和使用，且无需事先通知。';

  @override
  String get agreementParagraph52 => '2. 用户的终止权';

  @override
  String get agreementParagraph53 =>
      '您可随时停止使用本应用。停止使用本应用并不代表本协议的终止，本协议中关于知识产权、责任限制、适用法律等条款在您停止使用本应用后仍然具有法律效力。';

  @override
  String get agreementParagraph54 => '十、不可抗力条款';

  @override
  String get agreementParagraph55 =>
      '对于因我们合理控制范围以外的原因（包括但不限于自然灾害、战争、恐怖活动、政府行为、法律法规或政策的变化、网络故障、黑客攻击等）导致的服务中断或其他缺陷，我们不承担任何责任。';

  @override
  String get agreementParagraph56 => '十一、适用法律与争议解决';

  @override
  String get agreementParagraph57 => '1. 适用法律';

  @override
  String get agreementParagraph58 =>
      '本协议的订立、生效、履行、解释及争议解决均适用中华人民共和国法律（为本协议之目的，不包括香港特别行政区、澳门特别行政区和台湾地区的法律）。';

  @override
  String get agreementParagraph59 => '2. 争议解决';

  @override
  String get agreementParagraph60 =>
      '因本协议引起的或与本协议有关的任何争议，双方应首先通过友好协商解决；协商不成的，任何一方均可向我们所在地有管辖权的人民法院提起诉讼。';

  @override
  String get agreementParagraph61 => '十二、解释权';

  @override
  String get agreementParagraph62 =>
      '本协议的最终解释权归柚坛手表助手所有。我们保留对本协议的全部和最终的解释、修改和更新的权利。';

  @override
  String get agreementParagraph63 => '十三、其他条款';

  @override
  String get agreementParagraph64 => '1. 完整协议';

  @override
  String get agreementParagraph65 =>
      '本协议（包括《隐私政策》）构成双方就本协议事项达成的完整协议，取代双方先前的任何书面或口头协议、承诺或陈述。';

  @override
  String get agreementParagraph66 => '2. 条款的独立性';

  @override
  String get agreementParagraph67 =>
      '若本协议的任何条款被有管辖权的法院认定为无效或不可执行，该条款应在必要的最小范围内被限制或删除，而本协议的其余条款的有效性和可执行性不受影响。';

  @override
  String get agreementParagraph68 => '3. 权利的放弃';

  @override
  String get agreementParagraph69 =>
      '我们未能或延迟行使本协议项下的任何权利或救济，不应视为对该权利或救济的放弃，亦不影响我们在将来行使该权利或救济的能力。';

  @override
  String get agreementParagraph70 => '4. 通知与送达';

  @override
  String get agreementParagraph71 =>
      '您同意我们可通过电子邮件、短信、应用内通知或公告等方式向您发送与本协议或本应用有关的通知。上述通知一经发送，即视为已送达收件人。';

  @override
  String get agreementParagraph72 => '十四、联系我们';

  @override
  String get agreementParagraph73 => '如您对本协议有任何疑问、意见或建议，请通过以下方式与我们联系：';

  @override
  String get agreementParagraph74 => '电子邮箱：support@Gnayoah.com';

  @override
  String get agreementParagraph75 => '我们将在合理的时间内回复您的请求。';

  @override
  String get agreementParagraph76 => '感谢您选择柚坛手表助手！';

  @override
  String get deviceValueUnknown => '未知';

  @override
  String get deviceBootloaderLocked => '已锁定';

  @override
  String get deviceBootloaderUnlocked => '已解锁';

  @override
  String deviceMemoryUsage(String used, String total, String percent) {
    return '${used}G/${total}G（已使用 $percent%）';
  }

  @override
  String deviceUptimeDays(String days, String hours, String minutes) {
    return '$days 天 $hours 小时 $minutes 分钟';
  }

  @override
  String deviceUptimeHours(String hours, String minutes) {
    return '$hours 小时 $minutes 分钟';
  }

  @override
  String deviceUptimeMinutes(String minutes) {
    return '$minutes 分钟';
  }

  @override
  String get flashReady => '刷机工具已就绪。';

  @override
  String flashSelectedFile(String path) {
    return '已选择文件：$path';
  }

  @override
  String flashSelectedVbmeta(String path) {
    return '已选择 vbmeta 镜像：$path';
  }

  @override
  String flashSlotParseLog(String output) {
    return '无法从输出中识别当前槽位：$output';
  }

  @override
  String flashActionPartition(String partition) {
    return '刷入 $partition';
  }

  @override
  String flashActionSlot(String current, String target) {
    return '切换槽位 $current → $target';
  }

  @override
  String flashLogStart(String action) {
    return '开始：$action';
  }

  @override
  String flashLogDone(String action) {
    return '完成：$action';
  }

  @override
  String flashLogFailed(String action, String code) {
    return '失败：$action（退出码 $code）';
  }
}
