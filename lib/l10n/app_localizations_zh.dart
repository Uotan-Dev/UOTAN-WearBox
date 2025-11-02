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
  String get wirelessPageTitle => '无线连接设备';

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
  String get faqQ1Body => '请确保已启用 USB 调试功能，并在设备连接时授权 USB 调试权限。这是柚坛手表助手与您的设备进行通信的必要条件。';

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
  String get faqQ3Body => 'ADB 调试 与 USB 调试 实质上是相同的功能。ADB 调试是通过 USB 接口与设备进行通信和调试的方式，因此两者没有区别。';

  @override
  String get faqQ4Title => '4. 如何通过无线连接';

  @override
  String get faqQ4Intro => '要实现设备的无线调试连接，请确保以下设置正确：';

  @override
  String get faqQ4Bullet1 => '• 确保您的计算机和手表设备处于同一局域网内（无论是 2.4GHz 还是 5GHz 网络，关键在于设备需位于相同的 IP 网段内）。';

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
  String get faqQ6Body1 => '部分功能可能会因为不同品牌系统的限制而不可用，特别是定制安卓系统。柚坛手表助手支持90%的定制安卓系统功能，典型设备如 OPPO Watch、Meizu Watch 等。';

  @override
  String get faqQ6Body2 => 'WearOS by Google 系统设备支持 99% 的功能，典型设备如 Pixel Watch、Mi Watch、TicWatch 等。您可以多次重试操作。';

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
  String get featureRePair => 'WearOS 重新配对';

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
  String get githubDescription => '在 APGL-3.0 License 下开源';

  @override
  String get driverTitle => 'USB 驱动安装指南';

  @override
  String get driverIntro => '本教程仅适用于 Windows 系统，使用 MacOS 或 Linux 系统的用户无需安装 USB 驱动';

  @override
  String get driverStep1Title => '1. 下载 USB 驱动程序';

  @override
  String get driverStep1LinkPrefix => '进入';

  @override
  String get driverStep1LinkText => 'Android USB 驱动';

  @override
  String get driverStep1LinkSuffix => '下载页面（此网址可在中国大陆直接访问）';

  @override
  String get driverStep1DownloadInstructions => '点击“Download the Google USB Driver ZIP file (ZIP)”同意许可后下载“usb_driver_r13-windows.zip”并解压至任意位置。';

  @override
  String get driverStep2Title => '2. 打开“设备管理器”';

  @override
  String get driverStep2Description => '打开设置并进入系统信息，打开“设备管理器”。';

  @override
  String get driverStep3Title => '3. 连接设备';

  @override
  String get driverStep3Description => '将您的设备通过数据线/充电底座连接电脑，在设备管理器中找到其它设备或便携式设备选项并展开。';

  @override
  String get driverStep4Title => '4. 更新驱动程序';

  @override
  String get driverStep4Description => '右键单击您连接的设备的名称，然后选择“更新驱动程序”。';

  @override
  String get driverStep5Title => '5. 在弹出的窗口中选择“浏览我的电脑以查找驱动程序”';

  @override
  String get driverStep6Title => '6. 选择驱动程序';

  @override
  String get driverStep6Description => '点击“浏览”然后找到您刚下载的 USB 驱动程序文件夹“usb_driver_r13-windows”。';

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
}
