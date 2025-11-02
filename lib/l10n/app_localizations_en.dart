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
  String get wirelessPageTitle => 'Wireless connection';

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
  String get featureRePair => 'WearOS Re-pair';

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
  String get githubDescription => 'Open-sourced under the APGL-3.0 License';

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
}
