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
  String get settingsFooter => 'Uotan WearBox\n© 2020-2025 Gnayoah.com All rights reserved.';

  @override
  String get settingsLanguageTitle => 'Language';

  @override
  String get settingsLanguageSubtitle => 'Switch the display language';

  @override
  String get languageSystem => 'Follow system';

  @override
  String get languageChinese => 'Simplified Chinese';

  @override
  String get languageEnglish => 'English';

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
  String get homeNoDeviceDetected => 'No watch detected. Follow the steps below to connect.';

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
    return 'Bootloader: $bootloader';
  }

  @override
  String deviceArchitecture(Object architecture) {
    return 'Architecture: $architecture';
  }

  @override
  String deviceBatteryLevel(Object level) {
    return 'Battery: $level%';
  }

  @override
  String deviceBatteryHealth(Object health) {
    return 'Health: $health';
  }

  @override
  String deviceBatteryVoltage(Object voltage) {
    return 'Voltage: $voltage mV';
  }

  @override
  String deviceBatteryTemperature(Object temperature) {
    return 'Temperature: $temperature °C';
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
  String get featureMemoryClean => 'Memory cleanup';

  @override
  String get featureKeySimulation => 'Button simulation';

  @override
  String get featureBatteryManager => 'Battery manager';

  @override
  String get featureRotateScreen => 'Force screen rotation';

  @override
  String get featureCapture => 'Screenshot / Recording';

  @override
  String get featureRePair => 'Re-pair';

  @override
  String get featureFlashTool => 'Flash tool';

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
  String get buttonNameCallEnd => 'Hang up (SIM 1)';

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
}
