// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Uotan WearBox';

  @override
  String get navigationHome => 'Home';

  @override
  String get navigationFeatures => 'Tools';

  @override
  String get navigationStore => 'Apps';

  @override
  String get storeComingSoon => 'Coming soon';

  @override
  String get storeTitle => 'App Center';

  @override
  String get navigationAbout => 'Settings';

  @override
  String get settingsPageTitle => 'Uotan WearBox';

  @override
  String settingsVersionLabel(Object version) {
    return 'Version: $version   Design & Development: Gnayoah';
  }

  @override
  String get settingsSectionFaq => 'FAQ';

  @override
  String get settingsSectionAgreements => 'Agreements';

  @override
  String get settingsSectionVisit => 'Visit Website';

  @override
  String get settingsFaqTitle => 'Frequently Asked Questions';

  @override
  String get settingsFaqSubtitle => 'Having trouble using or connecting? Start by reading the FAQ.';

  @override
  String get settingsDonateTitle => 'Donate';

  @override
  String get settingsDonateSubtitle => 'This project is free—thank you for supporting us! (❁´◡`❁)';

  @override
  String get donationTitle => 'Support us';

  @override
  String get donationChooseAmountLabel => 'Choose an amount:';

  @override
  String donationAmountLabel(Object amount) {
    return '¥$amount';
  }

  @override
  String get donationAmountCustom => 'Custom';

  @override
  String donationSelectedAmount(Object amount) {
    return '¥$amount';
  }

  @override
  String get donationSelectedAmountCustom => 'Custom amount';

  @override
  String get donationPaymentAlipay => 'Alipay';

  @override
  String get donationPaymentWeChat => 'WeChat';

  @override
  String get donationThanksMessage => 'Our team sincerely thanks you for your support.';

  @override
  String get donationNetworkErrorTitle => 'Network connection error';

  @override
  String get donationNetworkErrorBody => 'Unable to reach the server—please check your connection.';

  @override
  String get settingsFeedbackTitle => 'Feedback';

  @override
  String get settingsFeedbackSubtitle => 'Please read the FAQ first. If it doesn\'t help, send us your feedback.';

  @override
  String get settingsPrivacyTitle => 'Privacy Policy';

  @override
  String get settingsPrivacySubtitle => 'Make sure you have read and understood our privacy policy.';

  @override
  String get settingsUserAgreementTitle => 'User Agreement';

  @override
  String get settingsUserAgreementSubtitle => 'Make sure you have read and understood our user agreement.';

  @override
  String get settingsWebsiteTitle => 'Official Site';

  @override
  String get settingsWebsiteSubtitle => 'Uotan WearBox';

  @override
  String get settingsCommunityTitle => 'Uotan Community';

  @override
  String get settingsCommunitySubtitle => 'Tech Device Users Community';

  @override
  String get settingsFooter => 'Uotan WearBox\n© 2020-2026 Gnayoah.com All rights reserved.';

  @override
  String get settingsLanguageTitle => 'Language';

  @override
  String get settingsLanguageSubtitle => 'Switch the display language';

  @override
  String get settingsDarkModeTitle => 'Dark mode';

  @override
  String get settingsDarkModeSubtitle => 'Switch between light and dark appearance';

  @override
  String get settingsCheckUpdateTitle => 'Check for updates';

  @override
  String get settingsCheckUpdateSubtitle => 'Get the latest version';

  @override
  String get updateUpToDate => 'You\'re on the latest version';

  @override
  String get updateCheckFailed => 'Couldn\'t check for updates. Please check your connection.';

  @override
  String get themeModeSystem => 'Follow system';

  @override
  String get themeModeAlwaysOn => 'Always on';

  @override
  String get themeModeAlwaysOff => 'Always off';

  @override
  String get languageSystem => 'Follow system';

  @override
  String get languageChinese => 'Simplified Chinese';

  @override
  String get languageEnglish => 'English';

  @override
  String get wirelessPageTitle => 'Wireless';

  @override
  String get wirelessHeaderIntro => 'Enter the device IP address and port';

  @override
  String get wirelessIpLabel => 'Device IP address';

  @override
  String get wirelessPortLabel => 'Port';

  @override
  String get wirelessConnectButton => 'Connect';

  @override
  String get wirelessErrorTitle => 'Error';

  @override
  String get wirelessSuccessTitle => 'Success';

  @override
  String get wirelessInputIncomplete => 'Please enter both IP address and port';

  @override
  String wirelessConnectSuccess(Object target) {
    return 'Connected to $target';
  }

  @override
  String wirelessConnectFailure(Object details) {
    return 'Connection failed: $details';
  }

  @override
  String wirelessExecutionFailed(Object details) {
    return 'Execution failed: $details';
  }

  @override
  String get faqPageTitle => 'Frequently Asked Questions';

  @override
  String get faqMenuTitle => 'Contents';

  @override
  String get faqMenuDeviceCannotConnect => 'Device cannot connect';

  @override
  String get faqMenuHowEnableUsbDebug => 'How to enable USB debugging';

  @override
  String get faqMenuWhyAdbDebug => 'Why does my device show ADB debugging';

  @override
  String get faqMenuHowWirelessConnect => 'How to connect wirelessly';

  @override
  String get faqMenuHowGetWirelessIpPort => 'How to get wireless debugging IP and port';

  @override
  String get faqMenuFeatureNoResponse => 'Some features don\'t respond';

  @override
  String get faqQ1Title => '1. Device cannot connect or be detected';

  @override
  String get faqQ1Body => 'Make sure USB debugging is enabled and authorize USB debugging when connecting. This is required for Uotan WearBox to communicate with your device.';

  @override
  String get faqQ2Title => '2. How to enable USB debugging';

  @override
  String get faqQ2Intro => 'Follow these steps:';

  @override
  String get faqQ2Step1 => '• Open <b>Settings</b> and tap <b>About</b>.';

  @override
  String get faqQ2Step2 => '• Tap <b>Build number</b> several times until developer mode is enabled.';

  @override
  String get faqQ2Step3 => '• Go back to <b>Settings</b> and open <b>Developer options</b>.';

  @override
  String get faqQ2Step4 => '• Enable <b>USB debugging</b>.';

  @override
  String get faqQ3Title => '3. Why does my device show ADB debugging';

  @override
  String get faqQ3Body => 'ADB debugging and USB debugging are essentially the same. ADB communicates with the device over USB, so there is no difference.';

  @override
  String get faqQ4Title => '4. How to connect wirelessly';

  @override
  String get faqQ4Intro => 'To enable wireless debugging, ensure the following:';

  @override
  String get faqQ4Bullet1 => '• Your computer and watch are on the same local network (2.4G or 5G is fine; they must be on the same IP subnet).';

  @override
  String get faqQ4Bullet2 => '• In Developer options on the watch, enable <b>Wireless debugging</b> or <b>WLAN debugging</b>.';

  @override
  String get faqQ4Conclusion => 'After enabling wireless debugging, you can operate the watch wirelessly with Uotan WearBox.';

  @override
  String get faqQ5Title => '5. How to get the wireless debugging IP and port';

  @override
  String get faqQ5Intro => 'You can obtain them as follows:';

  @override
  String get faqQ5Body => 'Open Developer options on the watch and tap Wireless debugging information to view the current IP address and port.';

  @override
  String get faqQ6Title => '6. Some features don\'t respond';

  @override
  String get faqQ6Body1 => 'Some features may be unavailable due to OEM system limitations, especially on customized Android systems. Uotan WearBox supports about 90% of features on customized Android, e.g., OPPO Watch, Meizu Watch.';

  @override
  String get faqQ6Body2 => 'WearOS by Google devices support about 99% of features, e.g., Pixel Watch, Mi Watch, TicWatch. You can try the operation multiple times.';

  @override
  String get faqQ6Body3 => 'If a feature doesn\'t work, try again or reconnect the device.';

  @override
  String get feedbackEmailSubject => 'Uotan WearBox - Feedback';

  @override
  String get feedbackEmailBody => 'System version:\n\nFeedback:\n\n\n\n\n\n\n\n';

  @override
  String get updateDialogTitle => 'Update available';

  @override
  String updateDialogMessage(Object remoteVersion, Object releaseDate) {
    return 'New version found: $remoteVersion\nRelease date: $releaseDate';
  }

  @override
  String get updateDialogUpdate => 'Update now';

  @override
  String get updateDialogLater => 'Later';

  @override
  String get networkErrorTitle => 'Unable to reach the server';

  @override
  String get networkErrorMessage => 'Please check your network connection or try again later.';

  @override
  String get networkErrorExit => 'Exit';

  @override
  String get networkErrorRetry => 'Retry';

  @override
  String get homeGreetingEarlyMorning => 'Good early morning';

  @override
  String get homeGreetingMorning => 'Good morning';

  @override
  String get homeGreetingAfternoon => 'Good afternoon';

  @override
  String get homeGreetingEvening => 'Good evening';

  @override
  String get homeWelcomeMessage => 'Welcome to Uotan WearBox';

  @override
  String get homeNoDeviceDetected => 'No device detected. Follow the steps below to connect.';

  @override
  String get homeConnectionMethodsTitle => 'Supported connection methods:';

  @override
  String get homeConnectionWired => '1. Connect the watch to your computer with a cable or charging dock (recommended)';

  @override
  String get homeConnectionWirelessPrefix => '2. Tap';

  @override
  String get homeConnectionWirelessLink => 'Wireless connection';

  @override
  String get homeConnectionWirelessSuffix => 'to start Wi-Fi or Bluetooth pairing.';

  @override
  String get homeTroubleshootTitle => 'If the connection fails, try:';

  @override
  String get homeTroubleshootUsbDebug => '1. Check that USB debugging is enabled on your watch';

  @override
  String get homeTroubleshootUsbDebugLink => 'View tutorial';

  @override
  String get homeTroubleshootDriver => '2. Confirm the USB driver is installed';

  @override
  String get homeTroubleshootDriverLink => 'Install driver';

  @override
  String get homeTroubleshootReinstall => '3. Reinstall this app and check for updates';

  @override
  String get homeTroubleshootRestart => '4. Restart the computer, switch USB ports or cables, and try again';

  @override
  String get deviceBasicInfoTitle => 'Basic information';

  @override
  String get deviceBatteryStatusTitle => 'Battery status';

  @override
  String get deviceSystemVersionTitle => 'System version';

  @override
  String deviceBrand(Object brand) {
    return 'Brand: $brand';
  }

  @override
  String deviceResolution(Object resolution) {
    return 'Resolution: $resolution';
  }

  @override
  String deviceModel(Object model) {
    return 'Model: $model';
  }

  @override
  String deviceDpi(Object dpi) {
    return 'DPI: $dpi';
  }

  @override
  String deviceSerial(Object serial) {
    return 'Serial number: $serial';
  }

  @override
  String deviceMemory(Object memory) {
    return 'Memory: $memory';
  }

  @override
  String deviceUptime(Object uptime) {
    return 'Uptime: $uptime';
  }

  @override
  String deviceStorage(Object storage) {
    return 'Storage: $storage';
  }

  @override
  String deviceBootloader(Object bootloader) {
    return 'Bootloader Lock: $bootloader';
  }

  @override
  String deviceArchitecture(Object architecture) {
    return 'CPU Architecture: $architecture';
  }

  @override
  String deviceBatteryLevel(Object level) {
    return 'Battery: $level%';
  }

  @override
  String deviceBatteryHealth(Object health) {
    return 'Battery Health: $health';
  }

  @override
  String deviceBatteryVoltage(Object voltage) {
    return 'Battery Voltage: $voltage mV';
  }

  @override
  String deviceBatteryTemperature(Object temperature) {
    return 'Battery Temperature: $temperature °C';
  }

  @override
  String deviceAndroidVersion(Object androidVersion) {
    return 'Android version: $androidVersion';
  }

  @override
  String devicePatchDate(Object patchDate) {
    return 'Patch date: $patchDate';
  }

  @override
  String deviceSoftwareVersion(Object softwareVersion) {
    return 'Software version: $softwareVersion';
  }

  @override
  String deviceKernelVersion(Object kernelVersion) {
    return 'Kernel version: $kernelVersion';
  }

  @override
  String get featuresTitle => 'Tools';

  @override
  String get featureSectionApps => 'Apps';

  @override
  String get featureSectionFiles => 'Files';

  @override
  String get featureSectionSystem => 'System';

  @override
  String get featureSectionHardware => 'Hardware';

  @override
  String get featureSectionAdvanced => 'Advanced';

  @override
  String get featureInstallApp => 'Install apps';

  @override
  String get featureAppManagement => 'App management';

  @override
  String get featureFileManagement => 'File manager';

  @override
  String get featureSendText => 'Send text';

  @override
  String get featureDisplaySettings => 'Display settings';

  @override
  String get featureMemoryClean => 'Storage / Memory cleanup';

  @override
  String get featureKeySimulation => 'Button simulation';

  @override
  String get featureBatteryManager => 'Battery manager';

  @override
  String get featureRotateScreen => 'Force screen rotation';

  @override
  String get featureCapture => 'Screenshot / Recording';

  @override
  String get featureRePair => 'WearOS Re-pair';

  @override
  String get featureFlashTool => 'Custom flash';

  @override
  String get featureComingSoonTitle => 'Coming soon';

  @override
  String featureComingSoonMessage(Object feature) {
    return 'This feature ($feature) is not available in this rebuild yet. We will add it soon.';
  }

  @override
  String get dialogOk => 'OK';

  @override
  String get setting_config => 'Settings';

  @override
  String get connect_successfully => 'Connected! Please keep the device connected and enable USB debugging.';

  @override
  String get installApptoWatch => 'Install app(apk) on watch';

  @override
  String get selectApptoInstall => 'Select an APK file to install';

  @override
  String get installingWaiting => 'Installation in progress, please wait...';

  @override
  String get installNoDeviceTitle => 'No device connected';

  @override
  String get installNoDeviceMessage => 'No device was detected. Please make sure the device is connected.';

  @override
  String get installSuccessTitle => 'Install successful';

  @override
  String get installSuccessMessage => 'The app has been installed successfully!';

  @override
  String get installFailureTitle => 'Install failed';

  @override
  String get installFailureMessage => 'An issue occurred during installation.';

  @override
  String installFailureWithReason(Object error) {
    return 'Error: $error';
  }

  @override
  String installErrorOutput(Object details) {
    return 'Error: $details';
  }

  @override
  String get installTipTitle => 'Notice';

  @override
  String get installNoFileSelected => 'No file selected.';

  @override
  String get commonErrorTitle => 'Error';

  @override
  String get commonNoticeTitle => 'Notice';

  @override
  String get buttonPageTitle => 'Button simulation';

  @override
  String get buttonDeviceNotConnectedTitle => 'Device not connected';

  @override
  String get buttonDeviceNotConnectedMessage => 'Please check that the device is connected to the computer and USB debugging is enabled.';

  @override
  String get buttonConnectFirstMessage => 'Please connect the device first.';

  @override
  String buttonSendKeySuccess(Object keycode) {
    return 'Key event $keycode sent successfully.';
  }

  @override
  String buttonExecutionFailed(Object details) {
    return 'Execution failed: $details';
  }

  @override
  String get buttonNameHome => 'Home';

  @override
  String get buttonNameBack => 'Back';

  @override
  String get buttonNamePower => 'Power';

  @override
  String get buttonNameVolumeUp => 'Volume +';

  @override
  String get buttonNameVolumeDown => 'Volume -';

  @override
  String get buttonNameSpeakerMute => 'Speaker mute';

  @override
  String get buttonNameMicMute => 'Microphone mute';

  @override
  String get buttonNameCallDial => 'Dial';

  @override
  String get buttonNameCallEnd => 'Hang up';

  @override
  String get buttonNamePlayPause => 'Play / pause';

  @override
  String get buttonNameNextTrack => 'Next track';

  @override
  String get buttonNamePreviousTrack => 'Previous track';

  @override
  String get buttonNameScreenOn => 'Turn screen on';

  @override
  String get buttonNameScreenOff => 'Turn screen off';

  @override
  String get displayPageTitle => 'Display settings';

  @override
  String get displayValueUnknown => 'Not fetched';

  @override
  String get displayValueUnavailable => 'Unavailable';

  @override
  String get displayDeviceNotConnectedMessage => 'No device detected. Please check the connection.';

  @override
  String displayErrorCheckingConnection(Object error) {
    return 'Unable to check device connection status: $error';
  }

  @override
  String displayCurrentDpi(Object value) {
    return 'Current DPI: $value';
  }

  @override
  String displaySelectedDpi(Object value) {
    return 'Selected: $value';
  }

  @override
  String get displayDpiLabel => 'DPI:';

  @override
  String get displayResetDefaultButton => 'Reset';

  @override
  String get displayApplyDpiButton => 'Apply DPI';

  @override
  String displayCurrentResolution(Object value) {
    return 'Current resolution: $value';
  }

  @override
  String displaySelectedResolution(Object value) {
    return 'Selected: $value';
  }

  @override
  String get displayWidthLabel => 'Width:';

  @override
  String get displayHeightLabel => 'Height:';

  @override
  String get displayApplyResolutionButton => 'Apply resolution';

  @override
  String displayDpiSetSuccess(Object value) {
    return 'DPI changed to $value';
  }

  @override
  String displayDpiSetFailure(Object error) {
    return 'Failed to change DPI: $error';
  }

  @override
  String displayResolutionSetSuccess(Object value) {
    return 'Resolution changed to $value';
  }

  @override
  String displayResolutionSetFailure(Object error) {
    return 'Failed to change resolution: $error';
  }

  @override
  String get displayDpiResetSuccess => 'DPI restored to default';

  @override
  String displayDpiResetFailure(Object error) {
    return 'Failed to reset DPI: $error';
  }

  @override
  String get displayResolutionResetSuccess => 'Resolution restored to default';

  @override
  String displayResolutionResetFailure(Object error) {
    return 'Failed to reset resolution: $error';
  }

  @override
  String get displayDeviceDisconnectedMessage => 'The device appears to be disconnected.';

  @override
  String get dialogCancel => 'Cancel';

  @override
  String get dialogConfirm => 'Confirm';

  @override
  String get appManageTitle => 'App management';

  @override
  String get appManageShowSystemApps => 'Show system apps';

  @override
  String get appManageNoAppsOrDevice => 'No apps detected or the device is not connected.';

  @override
  String appManageCannotFetch(Object error) {
    return 'Failed to load installed apps: $error';
  }

  @override
  String get appManageDeviceDisconnected => 'The device appears to be disconnected.';

  @override
  String get appManageTooltipUnfreeze => 'Unfreeze';

  @override
  String get appManageTooltipFreeze => 'Freeze';

  @override
  String get appManageTooltipExportApk => 'Export APK';

  @override
  String get appManageTooltipUninstall => 'Uninstall';

  @override
  String get appManageConfirmUninstallTitle => 'Uninstall app';

  @override
  String appManageConfirmUninstallMessage(Object packageName) {
    return 'Are you sure you want to uninstall $packageName?';
  }

  @override
  String get appManagePullProgress => 'Pulling APK...';

  @override
  String appManagePullSuccess(Object path) {
    return 'APK exported to: $path';
  }

  @override
  String appManagePullFailure(Object error) {
    return 'Failed to export APK: $error';
  }

  @override
  String appManageUninstallSuccess(Object packageName) {
    return 'App uninstalled: $packageName';
  }

  @override
  String appManageUninstallFailure(Object error) {
    return 'Failed to uninstall app: $error';
  }

  @override
  String appManageFreezeSuccess(Object packageName) {
    return 'App frozen: $packageName';
  }

  @override
  String appManageFreezeFailure(Object error) {
    return 'Failed to freeze app: $error';
  }

  @override
  String appManageUnfreezeSuccess(Object packageName) {
    return 'App unfrozen: $packageName';
  }

  @override
  String appManageUnfreezeFailure(Object error) {
    return 'Failed to unfreeze app: $error';
  }

  @override
  String fileManagerListFailure(Object path) {
    return 'Unable to list files under $path. Please check the device connection.';
  }

  @override
  String fileManagerErrorMessage(Object error) {
    return 'Error: $error';
  }

  @override
  String get fileManagerSuccessTitle => 'Success';

  @override
  String get fileManagerConfirmDeleteTitle => 'Delete item';

  @override
  String fileManagerConfirmDeleteMessage(Object entry) {
    return 'Are you sure you want to delete $entry?';
  }

  @override
  String get fileManagerDeleteButton => 'Delete';

  @override
  String fileManagerDeleteProgress(Object entry) {
    return 'Deleting $entry...';
  }

  @override
  String fileManagerDeleteSuccess(Object entry) {
    return '$entry has been deleted.';
  }

  @override
  String fileManagerDeleteFailure(Object entry) {
    return 'Failed to delete $entry.';
  }

  @override
  String get fileManagerRenameTitle => 'Rename';

  @override
  String get fileManagerRenameLabel => 'Enter a new name';

  @override
  String get fileManagerRenameAction => 'Rename';

  @override
  String get fileManagerSaveDialogTitle => 'Choose save location';

  @override
  String fileManagerSaveProgress(Object file) {
    return 'Saving $file to your computer...';
  }

  @override
  String fileManagerSaveSuccess(Object path) {
    return 'File saved to $path';
  }

  @override
  String get fileManagerSaveFailure => 'Failed to copy the file to your computer.';

  @override
  String get fileManagerUploadProgress => 'Uploading file...';

  @override
  String fileManagerUploadSuccess(Object path) {
    return 'File uploaded to $path';
  }

  @override
  String get fileManagerUploadFailure => 'Failed to upload the file to the device.';

  @override
  String get fileManagerContextRename => 'Rename';

  @override
  String get fileManagerContextCopy => 'Copy to computer';

  @override
  String get fileManagerContextDelete => 'Delete';

  @override
  String fileManagerTitle(Object path) {
    return 'File manager ($path)';
  }

  @override
  String get fileManagerRootLabel => 'Internal storage';

  @override
  String get pairingPageTitle => 'Re-pair without reset (WearOS)';

  @override
  String pairingStepTitle(Object step) {
    return 'Step $step';
  }

  @override
  String get pairingStepDescription1 => 'On the old phone, remove the Bluetooth pairing between the phone and the watch.';

  @override
  String get pairingClearServicesButton => 'Clear Google services and reboot';

  @override
  String get pairingStepDescription4 => 'On the new phone, open the WearOS by Google app and pair with the watch.';

  @override
  String get pairingEnableBluetoothButton => 'Enable Bluetooth discoverable mode';

  @override
  String pairingClearFailure(Object error) {
    return 'Failed to clear Google services: $error';
  }

  @override
  String get pairingRebooting => 'Device is rebooting...';

  @override
  String pairingRebootFailure(Object error) {
    return 'Failed to reboot: $error';
  }

  @override
  String pairingExecuteFailure(Object error) {
    return 'Command failed: $error';
  }

  @override
  String get pairingBluetoothEnabled => 'Bluetooth discoverable mode enabled.';

  @override
  String get rotatePageTitle => 'Force screen rotation';

  @override
  String get rotateButtonLeft => 'Rotate left';

  @override
  String get rotateButtonRight => 'Rotate right';

  @override
  String get rotateButtonFlip => 'Flip vertically';

  @override
  String get rotateButtonReset => 'Reset rotation';

  @override
  String rotateSuccessMessage(Object direction) {
    return 'Screen rotated: $direction';
  }

  @override
  String rotateExecuteFailure(Object error) {
    return 'Failed to apply rotation: $error';
  }

  @override
  String get typePageTitle => 'Send text to watch';

  @override
  String get typeHint => 'Type your text here...';

  @override
  String get typeImportButton => 'Import text';

  @override
  String get typeClearButton => 'Clear text';

  @override
  String get typeSendButton => 'Send to watch';

  @override
  String typeImportFailure(Object error) {
    return 'Unable to import the text file: $error';
  }

  @override
  String get typeNoDeviceMessage => 'No device detected. Please check the connection.';

  @override
  String get typeEmptyTextMessage => 'Please enter some text.';

  @override
  String get typeSendingProgress => 'Sending text...';

  @override
  String get typePermissionDenied => 'Permission denied. Enable \"USB debugging (Security settings)\" in Developer Options and try again.';

  @override
  String get typeSendSuccess => 'Text sent to the device.';

  @override
  String typeSendFailure(Object error) {
    return 'An error occurred: $error';
  }

  @override
  String typeConnectionCheckFailure(Object error) {
    return 'Unable to check device connection: $error';
  }

  @override
  String get viewOnGithub => 'Github';

  @override
  String get githubDescription => 'Open-sourced under the AGPL-3.0 License';

  @override
  String get driverTitle => 'USB Driver Installation Guide';

  @override
  String get driverIntro => 'This tutorial applies only to Windows. Users on macOS or Linux do not need to install the USB driver.';

  @override
  String get driverStep1Title => '1. Download the USB driver';

  @override
  String get driverStep1LinkPrefix => 'Open the';

  @override
  String get driverStep1LinkText => 'Android USB Driver';

  @override
  String get driverStep1LinkSuffix => 'download page';

  @override
  String get driverStep1DownloadInstructions => 'Click \"Download the Google USB Driver ZIP file (ZIP)\", accept the license, then download \"usb_driver_r13-windows.zip\" and extract it anywhere.';

  @override
  String get driverStep2Title => '2. Open Device Manager';

  @override
  String get driverStep2Description => 'Open Settings and go to System Information, then open Device Manager.';

  @override
  String get driverStep3Title => '3. Connect your device';

  @override
  String get driverStep3Description => 'Connect your device to the computer via cable or charging dock, then find and expand Other devices or Portable devices in Device Manager.';

  @override
  String get driverStep4Title => '4. Update the driver';

  @override
  String get driverStep4Description => 'Right-click the device entry and choose Update driver.';

  @override
  String get driverStep5Title => '5. In the dialog that appears, choose \"Browse my computer for drivers\"';

  @override
  String get driverStep6Title => '6. Select the driver folder';

  @override
  String get driverStep6Description => 'Click Browse and locate the USB driver folder you extracted, \"usb_driver_r13-windows\".';

  @override
  String get driverStep7Title => '7. Install the driver';

  @override
  String get driverStep7Description => 'Click Next to install the driver and finish the setup.';

  @override
  String driverUrlLaunchError(Object url) {
    return 'Unable to open link: $url';
  }

  @override
  String get tutorialTitle => 'USB debugging setup guide (applicable to most devices)';

  @override
  String get homeConnectionHelp => 'Connection help';

  @override
  String get homeConnectDevice => 'No device connected';

  @override
  String settingsCurrentVersion(String version) {
    return 'Current version: $version';
  }

  @override
  String get homeNarrowWiredHelp => 'Connect via USB cable or charging dock';

  @override
  String get homeNarrowDebugHelp => 'Check USB debugging';

  @override
  String get homeNarrowDriverHelp => 'Check ADB driver';

  @override
  String get homeWirelessUse => '2. Use';

  @override
  String get homeCheckDebugPrefix => '3. Make sure you have enabled';

  @override
  String get homeUsbDebugLink => 'USB debugging';

  @override
  String get homeInstallDriverPrefix => 'and installed the';

  @override
  String get homeAdbDriverLink => 'ADB driver';

  @override
  String get homeDriverSuffix => '';

  @override
  String get homeRebootTo => 'Reboot to';

  @override
  String get homeSystem => 'System';

  @override
  String get homeSelectDevice => 'Select device';

  @override
  String get homeNoConnectedDevices => 'No connected devices';

  @override
  String get homeRefreshing => 'Refreshing...';

  @override
  String get homeRefreshDevices => 'Refresh devices';

  @override
  String get homeDevicesRefreshed => 'Device list refreshed';

  @override
  String homeRefreshFailed(String error) {
    return 'Failed to refresh devices: $error';
  }

  @override
  String get homeDeviceInfo => 'Device info';

  @override
  String get homeSelectDeviceFirst => 'Please select a device first';

  @override
  String get homeCommandSent => 'Command sent';

  @override
  String commandExitFailure(String code) {
    return 'Command failed with exit code: $code';
  }

  @override
  String homeAdbError(String error) {
    return 'ADB error: $error';
  }

  @override
  String get batteryCurrentLevel => 'Current charge';

  @override
  String get batteryTemperatureLabel => 'Temperature (°C)';

  @override
  String get batteryLevelLabel => 'Charge (%)';

  @override
  String get batterySimulateDischarging => 'Simulate discharging';

  @override
  String get batterySimulateWireless => 'Simulate wireless charging';

  @override
  String get batterySimulateUsb => 'Simulate USB charging';

  @override
  String get batteryRestoreDefault => 'Restore defaults';

  @override
  String get batteryModify => 'Apply';

  @override
  String get batteryHealthGood => 'Good (2)';

  @override
  String get batteryHealthOverheat => 'Overheating (3)';

  @override
  String get batteryHealthDead => 'Dead (4)';

  @override
  String get batteryHealthOverVoltage => 'Overvoltage (5)';

  @override
  String get batteryHealthFailure => 'Failure (6)';

  @override
  String get batteryHealthCold => 'Too cold (7)';

  @override
  String batteryHealthUnknown(String code) {
    return 'Unknown ($code)';
  }

  @override
  String get batteryResetSuccess => 'Battery simulation settings restored.';

  @override
  String get batteryEnterTemperature => 'Please enter a temperature.';

  @override
  String get batteryInvalidTemperature => 'Invalid temperature format.';

  @override
  String batteryTemperatureChanged(String temperature) {
    return 'Temperature changed to $temperature°C';
  }

  @override
  String get batteryEnterLevel => 'Please enter a charge level.';

  @override
  String get batteryInvalidLevel => 'Charge must be an integer from 0 to 100.';

  @override
  String batteryLevelChanged(String level) {
    return 'Charge changed to $level%';
  }

  @override
  String get adbCommandFailed => 'ADB command failed.';

  @override
  String adbCommandError(String details) {
    return 'ADB command failed: $details';
  }

  @override
  String get adbCommandTimeout => 'ADB command timed out. Check the device connection and try again.';

  @override
  String adbExecutionError(String error) {
    return 'Unable to run ADB command: $error';
  }

  @override
  String get adbConnectionTimeout => 'ADB connection check timed out. Check the cable or wireless connection.';

  @override
  String adbConnectionError(String error) {
    return 'Unable to check device connection: $error';
  }

  @override
  String get captureSaveLocation => 'Save location';

  @override
  String get captureComputerFolder => 'Computer folder';

  @override
  String get captureDeviceFolder => 'Device folder';

  @override
  String get captureChooseFolder => 'Choose folder';

  @override
  String get captureSetDevicePath => 'Set device path';

  @override
  String get captureSectionTitle => 'Screenshot and recording';

  @override
  String get captureTakeScreenshot => 'Take screenshot';

  @override
  String get captureStartRecording => 'Start recording';

  @override
  String get captureStopRecording => 'Stop recording';

  @override
  String get captureLocationLockedHint => 'The save location is locked during recording to prevent export errors.';

  @override
  String get captureChooseSaveFolder => 'Choose save folder';

  @override
  String get captureDeviceSavePath => 'Set device save path';

  @override
  String get captureScreenshotFailed => 'Failed to capture screenshot on device';

  @override
  String captureScreenshotSavedDevice(String path) {
    return 'Screenshot saved on device:\n$path';
  }

  @override
  String get captureScreenshotExportFailed => 'Failed to export screenshot';

  @override
  String captureScreenshotSavedComputer(String path) {
    return 'Screenshot saved on computer:\n$path';
  }

  @override
  String commandExecutionError(String error) {
    return 'Execution failed: $error';
  }

  @override
  String get captureRecordingStartFailed => 'Failed to start recording';

  @override
  String get captureRecordingProcessMissing => 'Unable to find the recording process. Check that the device supports screenrecord.';

  @override
  String get captureRecordingStarted => 'Recording started.';

  @override
  String get captureRecordingInvalidState => 'Invalid recording state. Please restart recording.';

  @override
  String captureRecordingSavedDevice(String path) {
    return 'Recording saved on device:\n$path';
  }

  @override
  String get captureRecordingExportFailed => 'Failed to export recording';

  @override
  String captureRecordingSavedComputer(String path) {
    return 'Recording saved on computer:\n$path';
  }

  @override
  String get flashPageTitle => 'Custom flash';

  @override
  String get flashCustomPartition => 'Custom partition';

  @override
  String get flashChooseFile => 'File';

  @override
  String get flashTargetPartition => 'Flash to';

  @override
  String get flashAction => 'Flash';

  @override
  String get flashLogTitle => 'Log output';

  @override
  String get flashNoLogs => 'No logs yet';

  @override
  String get flashQuickActions => 'Quick actions';

  @override
  String get flashDisableVbmeta => 'Disable vbmeta verification';

  @override
  String get flashSwitchSlot => 'Switch slot';

  @override
  String get flashSelectImageFirst => 'Please select an image file first.';

  @override
  String get flashEnterPartition => 'Please enter a partition name.';

  @override
  String get flashSelectVbmetaImage => 'Select vbmeta image';

  @override
  String get flashUnknownSlot => 'Unable to identify the current slot. Check the fastboot log.';

  @override
  String flashSwitchSlotFailed(String error) {
    return 'Failed to switch slot: $error';
  }

  @override
  String flashOperationFailed(String code) {
    return 'Operation failed with exit code: $code';
  }

  @override
  String flashExecutionError(String error) {
    return 'Unable to run fastboot command: $error';
  }

  @override
  String get flashNoDevice => 'No fastboot device detected. Make sure the device is in fastboot mode.';

  @override
  String flashDetectionError(String error) {
    return 'Unable to detect fastboot devices. Make sure fastboot is installed and available.\n$error';
  }

  @override
  String get memoryStatusTitle => 'Memory status';

  @override
  String get memoryTotal => 'Total memory';

  @override
  String get memoryUsed => 'Used';

  @override
  String get memoryAvailable => 'Available memory';

  @override
  String get memoryFree => 'Free memory';

  @override
  String get memoryCached => 'Cached';

  @override
  String get memoryCleanupTitle => 'Cleanup actions';

  @override
  String get memoryClearBackground => 'Clear background processes';

  @override
  String get memoryClearCache => 'Clear app cache';

  @override
  String get memoryCustomPackage => 'Custom package to stop';

  @override
  String get memoryPackageHint => 'Example: com.google.android.gms';

  @override
  String get memoryForceStop => 'Force stop app';

  @override
  String get memoryBackgroundCleared => 'Background processes cleared.';

  @override
  String get memoryCacheCommandSent => 'Cache cleanup command executed.';

  @override
  String get memoryEnterPackage => 'Please enter a package name.';

  @override
  String memoryStopAttempted(String packageName) {
    return 'Attempted to stop: $packageName';
  }

  @override
  String commandStderrFailure(String details) {
    return 'Execution failed: $details';
  }

  @override
  String commandExitCodeFailure(String code) {
    return 'Command failed with exit code: $code';
  }

  @override
  String get privacyParagraph1 => 'Privacy Policy';

  @override
  String get privacyParagraph2 => 'Uotan WearBox Privacy Policy';

  @override
  String get privacyParagraph3 => 'Last updated: September 19, 2024';

  @override
  String get privacyParagraph4 => 'Welcome to Uotan WearBox (the “App”). We understand the importance of personal information and undertake to comply strictly with applicable laws and regulations and adopt appropriate security measures to protect it. Before using the App, please read and fully understand this Privacy Policy.';

  @override
  String get privacyParagraph5 => '1. Information we collect';

  @override
  String get privacyParagraph6 => '1. Internet Protocol address: We collect your IP address only when necessary to ensure the proper operation and security of the App. Apart from your IP address, we do not collect other information that identifies you personally.';

  @override
  String get privacyParagraph7 => '2. Required permissions:';

  @override
  String get privacyParagraph8 => '     - Network access: The App requires network access for data transfers, server communication, and feature updates.\n     - Device information: To improve performance and compatibility, we may read device information such as the model and operating system version.\n     - Storage access: The App may read and write device storage to cache data, save user settings, and provide offline features.';

  @override
  String get privacyParagraph9 => '2. How we use information';

  @override
  String get privacyParagraph10 => '1. Providing and maintaining services: We use the IP address and device information collected to ensure the App operates properly, improve its features, and continually enhance the user experience.';

  @override
  String get privacyParagraph11 => '2. Security: We use IP addresses and device information for security monitoring and risk prevention, including preventing fraud, network attacks, and other activities that may compromise system security.';

  @override
  String get privacyParagraph12 => '3. Legal basis for processing personal information';

  @override
  String get privacyParagraph13 => 'For users in mainland China, we collect and use personal information to provide products and/or services in accordance with the Cybersecurity Law of the People’s Republic of China, Information Security Technology — Personal Information Security Specification (GB/T 35273-2017), and other applicable laws and regulations. We generally collect personal information only with your consent. In some cases, collection may be necessary to meet legal obligations, perform a contract, or protect your vital interests or those of others.';

  @override
  String get privacyParagraph14 => '4. Sharing, transferring, and publicly disclosing information';

  @override
  String get privacyParagraph15 => '1. Legal requirements: We may disclose personal information when lawfully required by judicial or governmental authorities, subject to applicable laws and regulations.';

  @override
  String get privacyParagraph16 => '2. Business transfers: In a merger, acquisition, asset transfer, or similar transaction, your personal information may be transferred as an asset. We will require the new holder to remain bound by this Policy or obtain your consent again.';

  @override
  String get privacyParagraph17 => '3. Unauthorized disclosure: We will not publicly disclose your personal information without your explicit consent.';

  @override
  String get privacyParagraph18 => '4. Exceptions to consent for sharing, transferring, or publicly disclosing personal information';

  @override
  String get privacyParagraph19 => 'Under applicable laws and regulations, we may share, transfer, or publicly disclose personal information without your consent in the following circumstances:';

  @override
  String get privacyParagraph20 => '    - Matters concerning national security or national defense;\n    - Matters concerning public security, public health, or major public interests;\n    - Criminal investigations, prosecutions, trials, or enforcement of judgments;\n    - Protecting major lawful rights and interests, such as life or property, when obtaining consent is difficult;\n    - Personal information you have made public yourself;\n    - Information collected from lawful public disclosures, such as legitimate news reports or government disclosures;\n    - Other circumstances prescribed by law.';

  @override
  String get privacyParagraph21 => '5. Storage and protection of information';

  @override
  String get privacyParagraph22 => '1. Storage: We store information collected from you in the People’s Republic of China or the Hong Kong Special Administrative Region. For cross-border transfers, we will separately notify you by a pop-up or email of the purpose, recipient, and other details, and obtain your consent. We will ensure the recipient has adequate data protection capabilities.';

  @override
  String get privacyParagraph23 => '2. Security measures: We strive to protect your personal information through physical, electronic, and administrative safeguards that meet industry standards. We establish data classification systems and standards for data security management and secure development to govern storage and use, and ensure we do not collect personal information unrelated to our services.';

  @override
  String get privacyParagraph24 => '3. Security incidents: Although we make every effort to secure the information you send us, technical limitations and malicious activity on the Internet mean that absolute security cannot be guaranteed. Systems and communication networks used to access our services may experience problems beyond our control.';

  @override
  String get privacyParagraph25 => 'We maintain warning mechanisms and emergency plans to prevent security incidents. If a personal information security incident occurs, we will promptly inform you, as required by law, of its nature and potential impact, measures taken or planned, advice on reducing risks, and remedies available to you. We will immediately activate our emergency plan to minimize losses. We will notify you by telephone, push notification, or other means, or issue a reasonable and effective public announcement if individual notification is difficult. We will also report our response to regulators as required and cooperate closely with government authorities.';

  @override
  String get privacyParagraph26 => '6. Your rights';

  @override
  String get privacyParagraph27 => '1. Access and correction: You have the right to access and update your personal information. To exercise these rights, contact us using the details in this Policy.';

  @override
  String get privacyParagraph28 => '2. Deletion and withdrawal of consent: Subject to applicable laws, you may request deletion of your personal information or withdraw consent. Deletion or withdrawal may prevent us from continuing to provide some or all services.';

  @override
  String get privacyParagraph29 => '7. Protection of minors';

  @override
  String get privacyParagraph30 => 'We take the protection of minors’ personal information seriously. If you are under 18, use the App with the consent and guidance of a parent or legal guardian, and provide personal information only with their consent.';

  @override
  String get privacyParagraph31 => '8. Updates to this Privacy Policy';

  @override
  String get privacyParagraph32 => 'We may revise this Policy as our business develops or laws and regulations change. Revisions will be published on this page and take effect upon publication. Please review this Policy regularly to learn about the latest privacy protections.';

  @override
  String get privacyParagraph33 => '9. Governing law and dispute resolution';

  @override
  String get privacyParagraph34 => 'The formation, effectiveness, performance, interpretation, and dispute resolution of this Policy are governed by the laws of the People’s Republic of China. Disputes shall be resolved through amicable consultation; if consultation fails, either party may bring proceedings in the people’s court with jurisdiction where the App is based.';

  @override
  String get privacyParagraph35 => '10. Contact us';

  @override
  String get privacyParagraph36 => 'If you have questions, comments, or suggestions about this Policy, or wish to exercise your rights, contact us at:\nEmail: support@Gnayoah.com';

  @override
  String get privacyParagraph37 => 'We will review the matter as soon as possible and respond promptly after receiving your request.';

  @override
  String get privacyParagraph38 => 'Thank you for your trust in and support of Uotan WearBox.';

  @override
  String get agreementParagraph1 => 'User Agreement';

  @override
  String get agreementParagraph2 => 'Uotan WearBox User Agreement';

  @override
  String get agreementParagraph3 => 'Last updated: September 18, 2024';

  @override
  String get agreementParagraph4 => 'Before using Uotan WearBox (the “App” or “we”), please read and fully understand this User Agreement (the “Agreement”). This is a legally binding agreement between you (the “User” or “you”) and Uotan WearBox concerning use of the App. Downloading, installing, or otherwise using the App means that you have read, understood, and agreed to all its terms and conditions.';

  @override
  String get agreementParagraph5 => '1. Independence of the Privacy Policy';

  @override
  String get agreementParagraph6 => 'The privacy policies of Uotan Community and Uotan WearBox are entirely separate and unrelated. To review the Uotan Community privacy policy, visit its official website. The App’s Privacy Policy applies only to Uotan WearBox.';

  @override
  String get agreementParagraph7 => '2. Acceptance and amendment';

  @override
  String get agreementParagraph8 => '1. Acceptance';

  @override
  String get agreementParagraph9 => 'Read this Agreement in full before using the App. If you disagree with any term, stop using the App immediately. Downloading, installing, or using the App constitutes acceptance of this Agreement.';

  @override
  String get agreementParagraph10 => '2. Amendments';

  @override
  String get agreementParagraph11 => 'We reserve the right to revise this Agreement at any time as our business develops or laws and regulations change, without separate individual notice. Revisions take effect upon publication. You are responsible for reviewing the latest version; continued use after changes constitutes acceptance of the revised Agreement.';

  @override
  String get agreementParagraph12 => '3. Services and usage rules';

  @override
  String get agreementParagraph13 => '1. Services';

  @override
  String get agreementParagraph14 => 'The App provides watch-related assistance and services, including time display, alarm settings, and health monitoring. The services available are determined by the actual features provided in the App.';

  @override
  String get agreementParagraph15 => '2. Changes, suspension, or termination of services';

  @override
  String get agreementParagraph16 => 'We may adjust, suspend, or terminate some or all services at any time as circumstances require, without prior notice. We accept no liability for losses resulting from such adjustments, suspension, or termination.';

  @override
  String get agreementParagraph17 => '4. User conduct';

  @override
  String get agreementParagraph18 => '1. Lawful use';

  @override
  String get agreementParagraph19 => 'You undertake to use the App lawfully and not to engage in conduct that violates laws, public morality, or the lawful rights of others, including the following:';

  @override
  String get agreementParagraph20 => '• Intellectual property infringement: Do not copy, distribute, modify, or otherwise use content protected by copyright, trademark, patent, or other laws without authorization.';

  @override
  String get agreementParagraph21 => '• Inappropriate content: Do not publish or distribute content prohibited by law, including obscenity, pornography, gambling, violence, terrorism, superstition, defamation, insults, incitement, or encouragement of crime.';

  @override
  String get agreementParagraph22 => '• Security threats: Do not compromise or attempt to compromise network security, including spreading malware, viruses, trojans, or worms, or attacking the App’s servers, networks, or other users’ devices.';

  @override
  String get agreementParagraph23 => '2. Compliance with laws';

  @override
  String get agreementParagraph24 => 'When using the App, comply strictly with applicable laws, including the Cybersecurity Law and Civil Code of the People’s Republic of China. Do not use the App for illegal or criminal activities.';

  @override
  String get agreementParagraph25 => '5. Intellectual property';

  @override
  String get agreementParagraph26 => '1. Ownership';

  @override
  String get agreementParagraph27 => 'The App and all its content, including text, graphics, interface designs, visual effects, logos, trademarks, code, programs, software, services, and documentation, are protected by applicable laws, including the Copyright Law, Trademark Law, and Patent Law of the People’s Republic of China. The relevant rights belong to Gnayoah or its licensors.';

  @override
  String get agreementParagraph28 => '2. License';

  @override
  String get agreementParagraph29 => 'We grant you a personal, non-transferable, non-exclusive, revocable, limited license to download, install, and use the App under this Agreement. Without our prior written consent, you may not copy, modify, distribute, sell, transfer, or otherwise exploit any part of the App.';

  @override
  String get agreementParagraph30 => '3. Prohibited acts';

  @override
  String get agreementParagraph31 => 'Without written authorization from us or the relevant rights holders, you may not exercise, exploit, transfer, or license third parties to exercise, exploit, or transfer the above intellectual property in any form, including reverse engineering, decompiling, disassembling, or cracking the App.';

  @override
  String get agreementParagraph32 => '6. Privacy and data protection';

  @override
  String get agreementParagraph33 => '1. Personal information protection';

  @override
  String get agreementParagraph34 => 'We take personal information protection seriously and collect, use, store, and share your information strictly in accordance with the App’s Privacy Policy and applicable laws.';

  @override
  String get agreementParagraph35 => '2. Acceptance of the Policy';

  @override
  String get agreementParagraph36 => 'Using the App means that you have read and agreed to our Privacy Policy in full. If you disagree with any part of it, stop using the App immediately.';

  @override
  String get agreementParagraph37 => '7. Disclaimers and limitation of liability';

  @override
  String get agreementParagraph38 => '1. Services provided as is';

  @override
  String get agreementParagraph39 => 'The App is provided “as is” and “as available.” We make no express or implied warranties regarding its continuity, timeliness, security, accuracy, completeness, or reliability.';

  @override
  String get agreementParagraph40 => '2. Limitation of liability';

  @override
  String get agreementParagraph41 => 'To the maximum extent permitted by applicable law, we are not liable for any direct, indirect, incidental, special, consequential, or punitive damages resulting from using or being unable to use the App, including lost profits, lost data, or business interruption.';

  @override
  String get agreementParagraph42 => '3. Third parties';

  @override
  String get agreementParagraph43 => 'We are not responsible for the content, accuracy, legality, or reliability of third-party websites, services, or resources accessed through the App. You assume the risks of using third-party services.';

  @override
  String get agreementParagraph44 => '8. Breach and remedies';

  @override
  String get agreementParagraph45 => '1. Handling breaches';

  @override
  String get agreementParagraph46 => 'If you breach this Agreement or applicable laws, we may, without prior notice, issue warnings, restrict, suspend, or terminate access to and use of the App, preserve relevant records, and pursue legal remedies.';

  @override
  String get agreementParagraph47 => '2. Compensation';

  @override
  String get agreementParagraph48 => 'If your breach of this Agreement or applicable laws causes losses to us or a third party, you shall bear full compensation liability under the law, including direct and indirect losses, lost expected benefits, court costs, and legal fees.';

  @override
  String get agreementParagraph49 => '9. Termination and consequences';

  @override
  String get agreementParagraph50 => '1. Our right to terminate';

  @override
  String get agreementParagraph51 => 'For business reasons, we may terminate this Agreement or restrict, suspend, or terminate your access to and use of the App at any time, for any reason, without prior notice.';

  @override
  String get agreementParagraph52 => '2. Your right to stop using the App';

  @override
  String get agreementParagraph53 => 'You may stop using the App at any time. Stopping use does not terminate this Agreement; provisions on intellectual property, limitation of liability, governing law, and similar matters remain legally effective after you stop using the App.';

  @override
  String get agreementParagraph54 => '10. Force majeure';

  @override
  String get agreementParagraph55 => 'We are not liable for service interruptions or other defects caused by events beyond our reasonable control, including natural disasters, war, terrorism, government acts, changes in laws or policies, network failures, or hacking.';

  @override
  String get agreementParagraph56 => '11. Governing law and dispute resolution';

  @override
  String get agreementParagraph57 => '1. Governing law';

  @override
  String get agreementParagraph58 => 'The formation, effectiveness, performance, interpretation, and dispute resolution of this Agreement are governed by the laws of the People’s Republic of China, excluding, for this Agreement, the laws of Hong Kong, Macao, and Taiwan.';

  @override
  String get agreementParagraph59 => '2. Dispute resolution';

  @override
  String get agreementParagraph60 => 'Disputes arising from or relating to this Agreement shall first be resolved through amicable consultation. If consultation fails, either party may bring proceedings in the people’s court with jurisdiction where we are based.';

  @override
  String get agreementParagraph61 => '12. Interpretation';

  @override
  String get agreementParagraph62 => 'Uotan WearBox holds the right of final interpretation of this Agreement. We reserve all rights to interpret, amend, and update it.';

  @override
  String get agreementParagraph63 => '13. Other provisions';

  @override
  String get agreementParagraph64 => '1. Entire agreement';

  @override
  String get agreementParagraph65 => 'This Agreement, including the Privacy Policy, constitutes the entire agreement between the parties on its subject matter and supersedes all prior written or oral agreements, commitments, or representations.';

  @override
  String get agreementParagraph66 => '2. Severability';

  @override
  String get agreementParagraph67 => 'If a court with jurisdiction finds a provision invalid or unenforceable, it shall be limited or removed only to the minimum extent necessary. The validity and enforceability of the remaining provisions are unaffected.';

  @override
  String get agreementParagraph68 => '3. Waiver';

  @override
  String get agreementParagraph69 => 'Failure or delay by us to exercise a right or remedy under this Agreement does not waive it or affect our ability to exercise it in the future.';

  @override
  String get agreementParagraph70 => '4. Notices and delivery';

  @override
  String get agreementParagraph71 => 'You agree that we may send notices concerning this Agreement or the App by email, text message, in-app notification, or announcement. Such notices are deemed delivered when sent.';

  @override
  String get agreementParagraph72 => '14. Contact us';

  @override
  String get agreementParagraph73 => 'If you have questions, comments, or suggestions about this Agreement, contact us at:';

  @override
  String get agreementParagraph74 => 'Email: support@Gnayoah.com';

  @override
  String get agreementParagraph75 => 'We will respond to your request within a reasonable time.';

  @override
  String get agreementParagraph76 => 'Thank you for choosing Uotan WearBox!';

  @override
  String get deviceValueUnknown => 'Unknown';

  @override
  String get deviceBootloaderLocked => 'Locked';

  @override
  String get deviceBootloaderUnlocked => 'Unlocked';

  @override
  String deviceMemoryUsage(String used, String total, String percent) {
    return '${used}G/${total}G ($percent% used)';
  }

  @override
  String deviceUptimeDays(String days, String hours, String minutes) {
    return '$days d $hours h $minutes min';
  }

  @override
  String deviceUptimeHours(String hours, String minutes) {
    return '$hours h $minutes min';
  }

  @override
  String deviceUptimeMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String get flashReady => 'Flash tool ready.';

  @override
  String flashSelectedFile(String path) {
    return 'Selected file: $path';
  }

  @override
  String flashSelectedVbmeta(String path) {
    return 'Selected vbmeta image: $path';
  }

  @override
  String flashSlotParseLog(String output) {
    return 'Could not parse current slot from output: $output';
  }

  @override
  String flashActionPartition(String partition) {
    return 'Flash $partition';
  }

  @override
  String flashActionSlot(String current, String target) {
    return 'Switch slot $current → $target';
  }

  @override
  String flashLogStart(String action) {
    return 'Start: $action';
  }

  @override
  String flashLogDone(String action) {
    return 'Done: $action';
  }

  @override
  String flashLogFailed(String action, String code) {
    return 'Failed: $action (exit code $code)';
  }
}
