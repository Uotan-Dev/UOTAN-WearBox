import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('zh')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox'**
  String get appTitle;

  /// No description provided for @navigationHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navigationHome;

  /// No description provided for @navigationFeatures.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get navigationFeatures;

  /// No description provided for @navigationAbout.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navigationAbout;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox'**
  String get settingsPageTitle;

  /// No description provided for @settingsVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}   Design & Development: Gnayoah'**
  String settingsVersionLabel(Object version);

  /// No description provided for @settingsSectionFaq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get settingsSectionFaq;

  /// No description provided for @settingsSectionAgreements.
  ///
  /// In en, this message translates to:
  /// **'Agreements'**
  String get settingsSectionAgreements;

  /// No description provided for @settingsSectionVisit.
  ///
  /// In en, this message translates to:
  /// **'Visit Website'**
  String get settingsSectionVisit;

  /// No description provided for @settingsFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get settingsFaqTitle;

  /// No description provided for @settingsFaqSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Having trouble using or connecting? Start by reading the FAQ.'**
  String get settingsFaqSubtitle;

  /// No description provided for @settingsDonateTitle.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get settingsDonateTitle;

  /// No description provided for @settingsDonateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This project is free—thank you for supporting us! (❁´◡`❁)'**
  String get settingsDonateSubtitle;

  /// No description provided for @donationTitle.
  ///
  /// In en, this message translates to:
  /// **'Support us'**
  String get donationTitle;

  /// No description provided for @donationChooseAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Choose an amount:'**
  String get donationChooseAmountLabel;

  /// No description provided for @donationAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'¥{amount}'**
  String donationAmountLabel(Object amount);

  /// No description provided for @donationAmountCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get donationAmountCustom;

  /// No description provided for @donationSelectedAmount.
  ///
  /// In en, this message translates to:
  /// **'¥{amount}'**
  String donationSelectedAmount(Object amount);

  /// No description provided for @donationSelectedAmountCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom amount'**
  String get donationSelectedAmountCustom;

  /// No description provided for @donationPaymentAlipay.
  ///
  /// In en, this message translates to:
  /// **'Alipay'**
  String get donationPaymentAlipay;

  /// No description provided for @donationPaymentWeChat.
  ///
  /// In en, this message translates to:
  /// **'WeChat'**
  String get donationPaymentWeChat;

  /// No description provided for @donationThanksMessage.
  ///
  /// In en, this message translates to:
  /// **'Our team sincerely thanks you for your support.'**
  String get donationThanksMessage;

  /// No description provided for @donationNetworkErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Network connection error'**
  String get donationNetworkErrorTitle;

  /// No description provided for @donationNetworkErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Unable to reach the server—please check your connection.'**
  String get donationNetworkErrorBody;

  /// No description provided for @settingsFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get settingsFeedbackTitle;

  /// No description provided for @settingsFeedbackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please read the FAQ first. If it doesn\'t help, send us your feedback.'**
  String get settingsFeedbackSubtitle;

  /// No description provided for @settingsPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyTitle;

  /// No description provided for @settingsPrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Make sure you have read and understood our privacy policy.'**
  String get settingsPrivacySubtitle;

  /// No description provided for @settingsUserAgreementTitle.
  ///
  /// In en, this message translates to:
  /// **'User Agreement'**
  String get settingsUserAgreementTitle;

  /// No description provided for @settingsUserAgreementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Make sure you have read and understood our user agreement.'**
  String get settingsUserAgreementSubtitle;

  /// No description provided for @settingsWebsiteTitle.
  ///
  /// In en, this message translates to:
  /// **'Official Site'**
  String get settingsWebsiteTitle;

  /// No description provided for @settingsWebsiteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox'**
  String get settingsWebsiteSubtitle;

  /// No description provided for @settingsCommunityTitle.
  ///
  /// In en, this message translates to:
  /// **'Uotan Community'**
  String get settingsCommunityTitle;

  /// No description provided for @settingsCommunitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tech Device Users Community'**
  String get settingsCommunitySubtitle;

  /// No description provided for @settingsFooter.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox\n© 2020-2025 Gnayoah.com All rights reserved.'**
  String get settingsFooter;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageTitle;

  /// No description provided for @settingsLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Switch the display language'**
  String get settingsLanguageSubtitle;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get languageSystem;

  /// No description provided for @languageChinese.
  ///
  /// In en, this message translates to:
  /// **'Simplified Chinese'**
  String get languageChinese;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @wirelessPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Wireless connection'**
  String get wirelessPageTitle;

  /// No description provided for @wirelessHeaderIntro.
  ///
  /// In en, this message translates to:
  /// **'Enter the device IP address and port'**
  String get wirelessHeaderIntro;

  /// No description provided for @wirelessIpLabel.
  ///
  /// In en, this message translates to:
  /// **'Device IP address'**
  String get wirelessIpLabel;

  /// No description provided for @wirelessPortLabel.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get wirelessPortLabel;

  /// No description provided for @wirelessConnectButton.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get wirelessConnectButton;

  /// No description provided for @wirelessErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get wirelessErrorTitle;

  /// No description provided for @wirelessSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get wirelessSuccessTitle;

  /// No description provided for @wirelessInputIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Please enter both IP address and port'**
  String get wirelessInputIncomplete;

  /// No description provided for @wirelessConnectSuccess.
  ///
  /// In en, this message translates to:
  /// **'Connected to {target}'**
  String wirelessConnectSuccess(Object target);

  /// No description provided for @wirelessConnectFailure.
  ///
  /// In en, this message translates to:
  /// **'Connection failed: {details}'**
  String wirelessConnectFailure(Object details);

  /// No description provided for @wirelessExecutionFailed.
  ///
  /// In en, this message translates to:
  /// **'Execution failed: {details}'**
  String wirelessExecutionFailed(Object details);

  /// No description provided for @faqPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqPageTitle;

  /// No description provided for @faqMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get faqMenuTitle;

  /// No description provided for @faqMenuDeviceCannotConnect.
  ///
  /// In en, this message translates to:
  /// **'Device cannot connect'**
  String get faqMenuDeviceCannotConnect;

  /// No description provided for @faqMenuHowEnableUsbDebug.
  ///
  /// In en, this message translates to:
  /// **'How to enable USB debugging'**
  String get faqMenuHowEnableUsbDebug;

  /// No description provided for @faqMenuWhyAdbDebug.
  ///
  /// In en, this message translates to:
  /// **'Why does my device show ADB debugging'**
  String get faqMenuWhyAdbDebug;

  /// No description provided for @faqMenuHowWirelessConnect.
  ///
  /// In en, this message translates to:
  /// **'How to connect wirelessly'**
  String get faqMenuHowWirelessConnect;

  /// No description provided for @faqMenuHowGetWirelessIpPort.
  ///
  /// In en, this message translates to:
  /// **'How to get wireless debugging IP and port'**
  String get faqMenuHowGetWirelessIpPort;

  /// No description provided for @faqMenuFeatureNoResponse.
  ///
  /// In en, this message translates to:
  /// **'Some features don\'t respond'**
  String get faqMenuFeatureNoResponse;

  /// No description provided for @faqQ1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Device cannot connect or be detected'**
  String get faqQ1Title;

  /// No description provided for @faqQ1Body.
  ///
  /// In en, this message translates to:
  /// **'Make sure USB debugging is enabled and authorize USB debugging when connecting. This is required for Uotan WearBox to communicate with your device.'**
  String get faqQ1Body;

  /// No description provided for @faqQ2Title.
  ///
  /// In en, this message translates to:
  /// **'2. How to enable USB debugging'**
  String get faqQ2Title;

  /// No description provided for @faqQ2Intro.
  ///
  /// In en, this message translates to:
  /// **'Follow these steps:'**
  String get faqQ2Intro;

  /// No description provided for @faqQ2Step1.
  ///
  /// In en, this message translates to:
  /// **'• Open <b>Settings</b> and tap <b>About</b>.'**
  String get faqQ2Step1;

  /// No description provided for @faqQ2Step2.
  ///
  /// In en, this message translates to:
  /// **'• Tap <b>Build number</b> several times until developer mode is enabled.'**
  String get faqQ2Step2;

  /// No description provided for @faqQ2Step3.
  ///
  /// In en, this message translates to:
  /// **'• Go back to <b>Settings</b> and open <b>Developer options</b>.'**
  String get faqQ2Step3;

  /// No description provided for @faqQ2Step4.
  ///
  /// In en, this message translates to:
  /// **'• Enable <b>USB debugging</b>.'**
  String get faqQ2Step4;

  /// No description provided for @faqQ3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Why does my device show ADB debugging'**
  String get faqQ3Title;

  /// No description provided for @faqQ3Body.
  ///
  /// In en, this message translates to:
  /// **'ADB debugging and USB debugging are essentially the same. ADB communicates with the device over USB, so there is no difference.'**
  String get faqQ3Body;

  /// No description provided for @faqQ4Title.
  ///
  /// In en, this message translates to:
  /// **'4. How to connect wirelessly'**
  String get faqQ4Title;

  /// No description provided for @faqQ4Intro.
  ///
  /// In en, this message translates to:
  /// **'To enable wireless debugging, ensure the following:'**
  String get faqQ4Intro;

  /// No description provided for @faqQ4Bullet1.
  ///
  /// In en, this message translates to:
  /// **'• Your computer and watch are on the same local network (2.4G or 5G is fine; they must be on the same IP subnet).'**
  String get faqQ4Bullet1;

  /// No description provided for @faqQ4Bullet2.
  ///
  /// In en, this message translates to:
  /// **'• In Developer options on the watch, enable <b>Wireless debugging</b> or <b>WLAN debugging</b>.'**
  String get faqQ4Bullet2;

  /// No description provided for @faqQ4Conclusion.
  ///
  /// In en, this message translates to:
  /// **'After enabling wireless debugging, you can operate the watch wirelessly with Uotan WearBox.'**
  String get faqQ4Conclusion;

  /// No description provided for @faqQ5Title.
  ///
  /// In en, this message translates to:
  /// **'5. How to get the wireless debugging IP and port'**
  String get faqQ5Title;

  /// No description provided for @faqQ5Intro.
  ///
  /// In en, this message translates to:
  /// **'You can obtain them as follows:'**
  String get faqQ5Intro;

  /// No description provided for @faqQ5Body.
  ///
  /// In en, this message translates to:
  /// **'Open Developer options on the watch and tap Wireless debugging information to view the current IP address and port.'**
  String get faqQ5Body;

  /// No description provided for @faqQ6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Some features don\'t respond'**
  String get faqQ6Title;

  /// No description provided for @faqQ6Body1.
  ///
  /// In en, this message translates to:
  /// **'Some features may be unavailable due to OEM system limitations, especially on customized Android systems. Uotan WearBox supports about 90% of features on customized Android, e.g., OPPO Watch, Meizu Watch.'**
  String get faqQ6Body1;

  /// No description provided for @faqQ6Body2.
  ///
  /// In en, this message translates to:
  /// **'WearOS by Google devices support about 99% of features, e.g., Pixel Watch, Mi Watch, TicWatch. You can try the operation multiple times.'**
  String get faqQ6Body2;

  /// No description provided for @faqQ6Body3.
  ///
  /// In en, this message translates to:
  /// **'If a feature doesn\'t work, try again or reconnect the device.'**
  String get faqQ6Body3;

  /// No description provided for @feedbackEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox - Feedback'**
  String get feedbackEmailSubject;

  /// No description provided for @feedbackEmailBody.
  ///
  /// In en, this message translates to:
  /// **'System version:\n\nFeedback:\n\n\n\n\n\n\n\n'**
  String get feedbackEmailBody;

  /// No description provided for @updateDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get updateDialogTitle;

  /// No description provided for @updateDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'New version found: {remoteVersion}\nRelease date: {releaseDate}'**
  String updateDialogMessage(Object remoteVersion, Object releaseDate);

  /// No description provided for @updateDialogUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update now'**
  String get updateDialogUpdate;

  /// No description provided for @networkErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Unable to reach the server'**
  String get networkErrorTitle;

  /// No description provided for @networkErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your network connection or try again later.'**
  String get networkErrorMessage;

  /// No description provided for @networkErrorExit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get networkErrorExit;

  /// No description provided for @networkErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get networkErrorRetry;

  /// No description provided for @homeGreetingEarlyMorning.
  ///
  /// In en, this message translates to:
  /// **'Good early morning'**
  String get homeGreetingEarlyMorning;

  /// No description provided for @homeGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get homeGreetingMorning;

  /// No description provided for @homeGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get homeGreetingAfternoon;

  /// No description provided for @homeGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get homeGreetingEvening;

  /// No description provided for @homeWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Uotan WearBox'**
  String get homeWelcomeMessage;

  /// No description provided for @homeNoDeviceDetected.
  ///
  /// In en, this message translates to:
  /// **'No watch detected. Follow the steps below to connect.'**
  String get homeNoDeviceDetected;

  /// No description provided for @homeConnectionMethodsTitle.
  ///
  /// In en, this message translates to:
  /// **'Supported connection methods:'**
  String get homeConnectionMethodsTitle;

  /// No description provided for @homeConnectionWired.
  ///
  /// In en, this message translates to:
  /// **'1. Connect the watch to your computer with a cable or charging dock (recommended)'**
  String get homeConnectionWired;

  /// No description provided for @homeConnectionWirelessPrefix.
  ///
  /// In en, this message translates to:
  /// **'2. Tap'**
  String get homeConnectionWirelessPrefix;

  /// No description provided for @homeConnectionWirelessLink.
  ///
  /// In en, this message translates to:
  /// **'Wireless connection'**
  String get homeConnectionWirelessLink;

  /// No description provided for @homeConnectionWirelessSuffix.
  ///
  /// In en, this message translates to:
  /// **'to start Wi-Fi or Bluetooth pairing.'**
  String get homeConnectionWirelessSuffix;

  /// No description provided for @homeTroubleshootTitle.
  ///
  /// In en, this message translates to:
  /// **'If the connection fails, try:'**
  String get homeTroubleshootTitle;

  /// No description provided for @homeTroubleshootUsbDebug.
  ///
  /// In en, this message translates to:
  /// **'1. Check that USB debugging is enabled on your watch'**
  String get homeTroubleshootUsbDebug;

  /// No description provided for @homeTroubleshootUsbDebugLink.
  ///
  /// In en, this message translates to:
  /// **'View tutorial'**
  String get homeTroubleshootUsbDebugLink;

  /// No description provided for @homeTroubleshootDriver.
  ///
  /// In en, this message translates to:
  /// **'2. Confirm the USB driver is installed'**
  String get homeTroubleshootDriver;

  /// No description provided for @homeTroubleshootDriverLink.
  ///
  /// In en, this message translates to:
  /// **'Install driver'**
  String get homeTroubleshootDriverLink;

  /// No description provided for @homeTroubleshootReinstall.
  ///
  /// In en, this message translates to:
  /// **'3. Reinstall this app and check for updates'**
  String get homeTroubleshootReinstall;

  /// No description provided for @homeTroubleshootRestart.
  ///
  /// In en, this message translates to:
  /// **'4. Restart the computer, switch USB ports or cables, and try again'**
  String get homeTroubleshootRestart;

  /// No description provided for @deviceBasicInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Basic information'**
  String get deviceBasicInfoTitle;

  /// No description provided for @deviceBatteryStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Battery status'**
  String get deviceBatteryStatusTitle;

  /// No description provided for @deviceSystemVersionTitle.
  ///
  /// In en, this message translates to:
  /// **'System version'**
  String get deviceSystemVersionTitle;

  /// No description provided for @deviceBrand.
  ///
  /// In en, this message translates to:
  /// **'Brand: {brand}'**
  String deviceBrand(Object brand);

  /// No description provided for @deviceResolution.
  ///
  /// In en, this message translates to:
  /// **'Resolution: {resolution}'**
  String deviceResolution(Object resolution);

  /// No description provided for @deviceModel.
  ///
  /// In en, this message translates to:
  /// **'Model: {model}'**
  String deviceModel(Object model);

  /// No description provided for @deviceDpi.
  ///
  /// In en, this message translates to:
  /// **'DPI: {dpi}'**
  String deviceDpi(Object dpi);

  /// No description provided for @deviceSerial.
  ///
  /// In en, this message translates to:
  /// **'Serial number: {serial}'**
  String deviceSerial(Object serial);

  /// No description provided for @deviceMemory.
  ///
  /// In en, this message translates to:
  /// **'Memory: {memory}'**
  String deviceMemory(Object memory);

  /// No description provided for @deviceUptime.
  ///
  /// In en, this message translates to:
  /// **'Uptime: {uptime}'**
  String deviceUptime(Object uptime);

  /// No description provided for @deviceStorage.
  ///
  /// In en, this message translates to:
  /// **'Storage: {storage}'**
  String deviceStorage(Object storage);

  /// No description provided for @deviceBootloader.
  ///
  /// In en, this message translates to:
  /// **'Bootloader: {bootloader}'**
  String deviceBootloader(Object bootloader);

  /// No description provided for @deviceArchitecture.
  ///
  /// In en, this message translates to:
  /// **'Architecture: {architecture}'**
  String deviceArchitecture(Object architecture);

  /// No description provided for @deviceBatteryLevel.
  ///
  /// In en, this message translates to:
  /// **'Battery: {level}%'**
  String deviceBatteryLevel(Object level);

  /// No description provided for @deviceBatteryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health: {health}'**
  String deviceBatteryHealth(Object health);

  /// No description provided for @deviceBatteryVoltage.
  ///
  /// In en, this message translates to:
  /// **'Voltage: {voltage} mV'**
  String deviceBatteryVoltage(Object voltage);

  /// No description provided for @deviceBatteryTemperature.
  ///
  /// In en, this message translates to:
  /// **'Temperature: {temperature} °C'**
  String deviceBatteryTemperature(Object temperature);

  /// No description provided for @deviceAndroidVersion.
  ///
  /// In en, this message translates to:
  /// **'Android version: {androidVersion}'**
  String deviceAndroidVersion(Object androidVersion);

  /// No description provided for @devicePatchDate.
  ///
  /// In en, this message translates to:
  /// **'Patch date: {patchDate}'**
  String devicePatchDate(Object patchDate);

  /// No description provided for @deviceSoftwareVersion.
  ///
  /// In en, this message translates to:
  /// **'Software version: {softwareVersion}'**
  String deviceSoftwareVersion(Object softwareVersion);

  /// No description provided for @deviceKernelVersion.
  ///
  /// In en, this message translates to:
  /// **'Kernel version: {kernelVersion}'**
  String deviceKernelVersion(Object kernelVersion);

  /// No description provided for @featuresTitle.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get featuresTitle;

  /// No description provided for @featureInstallApp.
  ///
  /// In en, this message translates to:
  /// **'Install apps'**
  String get featureInstallApp;

  /// No description provided for @featureAppManagement.
  ///
  /// In en, this message translates to:
  /// **'App management'**
  String get featureAppManagement;

  /// No description provided for @featureFileManagement.
  ///
  /// In en, this message translates to:
  /// **'File manager'**
  String get featureFileManagement;

  /// No description provided for @featureSendText.
  ///
  /// In en, this message translates to:
  /// **'Send text'**
  String get featureSendText;

  /// No description provided for @featureDisplaySettings.
  ///
  /// In en, this message translates to:
  /// **'Display settings'**
  String get featureDisplaySettings;

  /// No description provided for @featureMemoryClean.
  ///
  /// In en, this message translates to:
  /// **'Memory cleanup'**
  String get featureMemoryClean;

  /// No description provided for @featureKeySimulation.
  ///
  /// In en, this message translates to:
  /// **'Button simulation'**
  String get featureKeySimulation;

  /// No description provided for @featureBatteryManager.
  ///
  /// In en, this message translates to:
  /// **'Battery manager'**
  String get featureBatteryManager;

  /// No description provided for @featureRotateScreen.
  ///
  /// In en, this message translates to:
  /// **'Force screen rotation'**
  String get featureRotateScreen;

  /// No description provided for @featureCapture.
  ///
  /// In en, this message translates to:
  /// **'Screenshot / Recording'**
  String get featureCapture;

  /// No description provided for @featureRePair.
  ///
  /// In en, this message translates to:
  /// **'WearOS Re-pair'**
  String get featureRePair;

  /// No description provided for @featureFlashTool.
  ///
  /// In en, this message translates to:
  /// **'Flash tool'**
  String get featureFlashTool;

  /// No description provided for @featureComingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get featureComingSoonTitle;

  /// No description provided for @featureComingSoonMessage.
  ///
  /// In en, this message translates to:
  /// **'This feature ({feature}) is not available in this rebuild yet. We will add it soon.'**
  String featureComingSoonMessage(Object feature);

  /// No description provided for @dialogOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get dialogOk;

  /// No description provided for @setting_config.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting_config;

  /// No description provided for @connect_successfully.
  ///
  /// In en, this message translates to:
  /// **'Connected! Please keep the device connected and enable USB debugging.'**
  String get connect_successfully;

  /// No description provided for @installApptoWatch.
  ///
  /// In en, this message translates to:
  /// **'Install app(apk) on watch'**
  String get installApptoWatch;

  /// No description provided for @selectApptoInstall.
  ///
  /// In en, this message translates to:
  /// **'Select an APK file to install'**
  String get selectApptoInstall;

  /// No description provided for @installingWaiting.
  ///
  /// In en, this message translates to:
  /// **'Installation in progress, please wait...'**
  String get installingWaiting;

  /// No description provided for @installNoDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'No device connected'**
  String get installNoDeviceTitle;

  /// No description provided for @installNoDeviceMessage.
  ///
  /// In en, this message translates to:
  /// **'No device was detected. Please make sure the device is connected.'**
  String get installNoDeviceMessage;

  /// No description provided for @installSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Install successful'**
  String get installSuccessTitle;

  /// No description provided for @installSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'The app has been installed successfully!'**
  String get installSuccessMessage;

  /// No description provided for @installFailureTitle.
  ///
  /// In en, this message translates to:
  /// **'Install failed'**
  String get installFailureTitle;

  /// No description provided for @installFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'An issue occurred during installation.'**
  String get installFailureMessage;

  /// No description provided for @installFailureWithReason.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String installFailureWithReason(Object error);

  /// No description provided for @installErrorOutput.
  ///
  /// In en, this message translates to:
  /// **'Error: {details}'**
  String installErrorOutput(Object details);

  /// No description provided for @installTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get installTipTitle;

  /// No description provided for @installNoFileSelected.
  ///
  /// In en, this message translates to:
  /// **'No file selected.'**
  String get installNoFileSelected;

  /// No description provided for @commonErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get commonErrorTitle;

  /// No description provided for @commonNoticeTitle.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get commonNoticeTitle;

  /// No description provided for @buttonPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Button simulation'**
  String get buttonPageTitle;

  /// No description provided for @buttonDeviceNotConnectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Device not connected'**
  String get buttonDeviceNotConnectedTitle;

  /// No description provided for @buttonDeviceNotConnectedMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check that the device is connected to the computer and USB debugging is enabled.'**
  String get buttonDeviceNotConnectedMessage;

  /// No description provided for @buttonConnectFirstMessage.
  ///
  /// In en, this message translates to:
  /// **'Please connect the device first.'**
  String get buttonConnectFirstMessage;

  /// No description provided for @buttonSendKeySuccess.
  ///
  /// In en, this message translates to:
  /// **'Key event {keycode} sent successfully.'**
  String buttonSendKeySuccess(Object keycode);

  /// No description provided for @buttonExecutionFailed.
  ///
  /// In en, this message translates to:
  /// **'Execution failed: {details}'**
  String buttonExecutionFailed(Object details);

  /// No description provided for @buttonNameHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get buttonNameHome;

  /// No description provided for @buttonNameBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get buttonNameBack;

  /// No description provided for @buttonNamePower.
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get buttonNamePower;

  /// No description provided for @buttonNameVolumeUp.
  ///
  /// In en, this message translates to:
  /// **'Volume +'**
  String get buttonNameVolumeUp;

  /// No description provided for @buttonNameVolumeDown.
  ///
  /// In en, this message translates to:
  /// **'Volume -'**
  String get buttonNameVolumeDown;

  /// No description provided for @buttonNameSpeakerMute.
  ///
  /// In en, this message translates to:
  /// **'Speaker mute'**
  String get buttonNameSpeakerMute;

  /// No description provided for @buttonNameMicMute.
  ///
  /// In en, this message translates to:
  /// **'Microphone mute'**
  String get buttonNameMicMute;

  /// No description provided for @buttonNameCallDial.
  ///
  /// In en, this message translates to:
  /// **'Dial'**
  String get buttonNameCallDial;

  /// No description provided for @buttonNameCallEnd.
  ///
  /// In en, this message translates to:
  /// **'Hang up'**
  String get buttonNameCallEnd;

  /// No description provided for @buttonNamePlayPause.
  ///
  /// In en, this message translates to:
  /// **'Play / pause'**
  String get buttonNamePlayPause;

  /// No description provided for @buttonNameNextTrack.
  ///
  /// In en, this message translates to:
  /// **'Next track'**
  String get buttonNameNextTrack;

  /// No description provided for @buttonNamePreviousTrack.
  ///
  /// In en, this message translates to:
  /// **'Previous track'**
  String get buttonNamePreviousTrack;

  /// No description provided for @buttonNameScreenOn.
  ///
  /// In en, this message translates to:
  /// **'Turn screen on'**
  String get buttonNameScreenOn;

  /// No description provided for @buttonNameScreenOff.
  ///
  /// In en, this message translates to:
  /// **'Turn screen off'**
  String get buttonNameScreenOff;

  /// No description provided for @displayPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Display settings'**
  String get displayPageTitle;

  /// No description provided for @displayValueUnknown.
  ///
  /// In en, this message translates to:
  /// **'Not fetched'**
  String get displayValueUnknown;

  /// No description provided for @displayValueUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get displayValueUnavailable;

  /// No description provided for @displayDeviceNotConnectedMessage.
  ///
  /// In en, this message translates to:
  /// **'No device detected. Please check the connection.'**
  String get displayDeviceNotConnectedMessage;

  /// No description provided for @displayErrorCheckingConnection.
  ///
  /// In en, this message translates to:
  /// **'Unable to check device connection status: {error}'**
  String displayErrorCheckingConnection(Object error);

  /// No description provided for @displayCurrentDpi.
  ///
  /// In en, this message translates to:
  /// **'Current DPI: {value}'**
  String displayCurrentDpi(Object value);

  /// No description provided for @displaySelectedDpi.
  ///
  /// In en, this message translates to:
  /// **'Selected: {value}'**
  String displaySelectedDpi(Object value);

  /// No description provided for @displayDpiLabel.
  ///
  /// In en, this message translates to:
  /// **'DPI:'**
  String get displayDpiLabel;

  /// No description provided for @displayResetDefaultButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get displayResetDefaultButton;

  /// No description provided for @displayApplyDpiButton.
  ///
  /// In en, this message translates to:
  /// **'Apply DPI'**
  String get displayApplyDpiButton;

  /// No description provided for @displayCurrentResolution.
  ///
  /// In en, this message translates to:
  /// **'Current resolution: {value}'**
  String displayCurrentResolution(Object value);

  /// No description provided for @displaySelectedResolution.
  ///
  /// In en, this message translates to:
  /// **'Selected: {value}'**
  String displaySelectedResolution(Object value);

  /// No description provided for @displayWidthLabel.
  ///
  /// In en, this message translates to:
  /// **'Width:'**
  String get displayWidthLabel;

  /// No description provided for @displayHeightLabel.
  ///
  /// In en, this message translates to:
  /// **'Height:'**
  String get displayHeightLabel;

  /// No description provided for @displayApplyResolutionButton.
  ///
  /// In en, this message translates to:
  /// **'Apply resolution'**
  String get displayApplyResolutionButton;

  /// No description provided for @displayDpiSetSuccess.
  ///
  /// In en, this message translates to:
  /// **'DPI changed to {value}'**
  String displayDpiSetSuccess(Object value);

  /// No description provided for @displayDpiSetFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to change DPI: {error}'**
  String displayDpiSetFailure(Object error);

  /// No description provided for @displayResolutionSetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Resolution changed to {value}'**
  String displayResolutionSetSuccess(Object value);

  /// No description provided for @displayResolutionSetFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to change resolution: {error}'**
  String displayResolutionSetFailure(Object error);

  /// No description provided for @displayDpiResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'DPI restored to default'**
  String get displayDpiResetSuccess;

  /// No description provided for @displayDpiResetFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to reset DPI: {error}'**
  String displayDpiResetFailure(Object error);

  /// No description provided for @displayResolutionResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Resolution restored to default'**
  String get displayResolutionResetSuccess;

  /// No description provided for @displayResolutionResetFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to reset resolution: {error}'**
  String displayResolutionResetFailure(Object error);

  /// No description provided for @displayDeviceDisconnectedMessage.
  ///
  /// In en, this message translates to:
  /// **'The device appears to be disconnected.'**
  String get displayDeviceDisconnectedMessage;

  /// No description provided for @dialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get dialogCancel;

  /// No description provided for @dialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get dialogConfirm;

  /// No description provided for @appManageTitle.
  ///
  /// In en, this message translates to:
  /// **'App management'**
  String get appManageTitle;

  /// No description provided for @appManageShowSystemApps.
  ///
  /// In en, this message translates to:
  /// **'Show system apps'**
  String get appManageShowSystemApps;

  /// No description provided for @appManageNoAppsOrDevice.
  ///
  /// In en, this message translates to:
  /// **'No apps detected or the device is not connected.'**
  String get appManageNoAppsOrDevice;

  /// No description provided for @appManageCannotFetch.
  ///
  /// In en, this message translates to:
  /// **'Failed to load installed apps: {error}'**
  String appManageCannotFetch(Object error);

  /// No description provided for @appManageDeviceDisconnected.
  ///
  /// In en, this message translates to:
  /// **'The device appears to be disconnected.'**
  String get appManageDeviceDisconnected;

  /// No description provided for @appManageTooltipUnfreeze.
  ///
  /// In en, this message translates to:
  /// **'Unfreeze'**
  String get appManageTooltipUnfreeze;

  /// No description provided for @appManageTooltipFreeze.
  ///
  /// In en, this message translates to:
  /// **'Freeze'**
  String get appManageTooltipFreeze;

  /// No description provided for @appManageTooltipExportApk.
  ///
  /// In en, this message translates to:
  /// **'Export APK'**
  String get appManageTooltipExportApk;

  /// No description provided for @appManageTooltipUninstall.
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get appManageTooltipUninstall;

  /// No description provided for @appManageConfirmUninstallTitle.
  ///
  /// In en, this message translates to:
  /// **'Uninstall app'**
  String get appManageConfirmUninstallTitle;

  /// No description provided for @appManageConfirmUninstallMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to uninstall {packageName}?'**
  String appManageConfirmUninstallMessage(Object packageName);

  /// No description provided for @appManagePullProgress.
  ///
  /// In en, this message translates to:
  /// **'Pulling APK...'**
  String get appManagePullProgress;

  /// No description provided for @appManagePullSuccess.
  ///
  /// In en, this message translates to:
  /// **'APK exported to: {path}'**
  String appManagePullSuccess(Object path);

  /// No description provided for @appManagePullFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to export APK: {error}'**
  String appManagePullFailure(Object error);

  /// No description provided for @appManageUninstallSuccess.
  ///
  /// In en, this message translates to:
  /// **'App uninstalled: {packageName}'**
  String appManageUninstallSuccess(Object packageName);

  /// No description provided for @appManageUninstallFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to uninstall app: {error}'**
  String appManageUninstallFailure(Object error);

  /// No description provided for @appManageFreezeSuccess.
  ///
  /// In en, this message translates to:
  /// **'App frozen: {packageName}'**
  String appManageFreezeSuccess(Object packageName);

  /// No description provided for @appManageFreezeFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to freeze app: {error}'**
  String appManageFreezeFailure(Object error);

  /// No description provided for @appManageUnfreezeSuccess.
  ///
  /// In en, this message translates to:
  /// **'App unfrozen: {packageName}'**
  String appManageUnfreezeSuccess(Object packageName);

  /// No description provided for @appManageUnfreezeFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to unfreeze app: {error}'**
  String appManageUnfreezeFailure(Object error);

  /// No description provided for @fileManagerListFailure.
  ///
  /// In en, this message translates to:
  /// **'Unable to list files under {path}. Please check the device connection.'**
  String fileManagerListFailure(Object path);

  /// No description provided for @fileManagerErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String fileManagerErrorMessage(Object error);

  /// No description provided for @fileManagerSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get fileManagerSuccessTitle;

  /// No description provided for @fileManagerConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete item'**
  String get fileManagerConfirmDeleteTitle;

  /// No description provided for @fileManagerConfirmDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {entry}?'**
  String fileManagerConfirmDeleteMessage(Object entry);

  /// No description provided for @fileManagerDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get fileManagerDeleteButton;

  /// No description provided for @fileManagerDeleteProgress.
  ///
  /// In en, this message translates to:
  /// **'Deleting {entry}...'**
  String fileManagerDeleteProgress(Object entry);

  /// No description provided for @fileManagerDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'{entry} has been deleted.'**
  String fileManagerDeleteSuccess(Object entry);

  /// No description provided for @fileManagerDeleteFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete {entry}.'**
  String fileManagerDeleteFailure(Object entry);

  /// No description provided for @fileManagerRenameTitle.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get fileManagerRenameTitle;

  /// No description provided for @fileManagerRenameLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter a new name'**
  String get fileManagerRenameLabel;

  /// No description provided for @fileManagerRenameAction.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get fileManagerRenameAction;

  /// No description provided for @fileManagerSaveDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose save location'**
  String get fileManagerSaveDialogTitle;

  /// No description provided for @fileManagerSaveProgress.
  ///
  /// In en, this message translates to:
  /// **'Saving {file} to your computer...'**
  String fileManagerSaveProgress(Object file);

  /// No description provided for @fileManagerSaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'File saved to {path}'**
  String fileManagerSaveSuccess(Object path);

  /// No description provided for @fileManagerSaveFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to copy the file to your computer.'**
  String get fileManagerSaveFailure;

  /// No description provided for @fileManagerUploadProgress.
  ///
  /// In en, this message translates to:
  /// **'Uploading file...'**
  String get fileManagerUploadProgress;

  /// No description provided for @fileManagerUploadSuccess.
  ///
  /// In en, this message translates to:
  /// **'File uploaded to {path}'**
  String fileManagerUploadSuccess(Object path);

  /// No description provided for @fileManagerUploadFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload the file to the device.'**
  String get fileManagerUploadFailure;

  /// No description provided for @fileManagerContextRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get fileManagerContextRename;

  /// No description provided for @fileManagerContextCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy to computer'**
  String get fileManagerContextCopy;

  /// No description provided for @fileManagerContextDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get fileManagerContextDelete;

  /// No description provided for @fileManagerTitle.
  ///
  /// In en, this message translates to:
  /// **'File manager ({path})'**
  String fileManagerTitle(Object path);

  /// No description provided for @fileManagerRootLabel.
  ///
  /// In en, this message translates to:
  /// **'Internal storage'**
  String get fileManagerRootLabel;

  /// No description provided for @pairingPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Re-pair without reset (WearOS)'**
  String get pairingPageTitle;

  /// No description provided for @pairingStepTitle.
  ///
  /// In en, this message translates to:
  /// **'Step {step}'**
  String pairingStepTitle(Object step);

  /// No description provided for @pairingStepDescription1.
  ///
  /// In en, this message translates to:
  /// **'On the old phone, remove the Bluetooth pairing between the phone and the watch.'**
  String get pairingStepDescription1;

  /// No description provided for @pairingClearServicesButton.
  ///
  /// In en, this message translates to:
  /// **'Clear Google services and reboot'**
  String get pairingClearServicesButton;

  /// No description provided for @pairingStepDescription4.
  ///
  /// In en, this message translates to:
  /// **'On the new phone, open the WearOS by Google app and pair with the watch.'**
  String get pairingStepDescription4;

  /// No description provided for @pairingEnableBluetoothButton.
  ///
  /// In en, this message translates to:
  /// **'Enable Bluetooth discoverable mode'**
  String get pairingEnableBluetoothButton;

  /// No description provided for @pairingClearFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to clear Google services: {error}'**
  String pairingClearFailure(Object error);

  /// No description provided for @pairingRebooting.
  ///
  /// In en, this message translates to:
  /// **'Device is rebooting...'**
  String get pairingRebooting;

  /// No description provided for @pairingRebootFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to reboot: {error}'**
  String pairingRebootFailure(Object error);

  /// No description provided for @pairingExecuteFailure.
  ///
  /// In en, this message translates to:
  /// **'Command failed: {error}'**
  String pairingExecuteFailure(Object error);

  /// No description provided for @pairingBluetoothEnabled.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth discoverable mode enabled.'**
  String get pairingBluetoothEnabled;

  /// No description provided for @rotatePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Force screen rotation'**
  String get rotatePageTitle;

  /// No description provided for @rotateButtonLeft.
  ///
  /// In en, this message translates to:
  /// **'Rotate left'**
  String get rotateButtonLeft;

  /// No description provided for @rotateButtonRight.
  ///
  /// In en, this message translates to:
  /// **'Rotate right'**
  String get rotateButtonRight;

  /// No description provided for @rotateButtonFlip.
  ///
  /// In en, this message translates to:
  /// **'Flip vertically'**
  String get rotateButtonFlip;

  /// No description provided for @rotateButtonReset.
  ///
  /// In en, this message translates to:
  /// **'Reset rotation'**
  String get rotateButtonReset;

  /// No description provided for @rotateSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Screen rotated: {direction}'**
  String rotateSuccessMessage(Object direction);

  /// No description provided for @rotateExecuteFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to apply rotation: {error}'**
  String rotateExecuteFailure(Object error);

  /// No description provided for @typePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Send text to watch'**
  String get typePageTitle;

  /// No description provided for @typeHint.
  ///
  /// In en, this message translates to:
  /// **'Type your text here...'**
  String get typeHint;

  /// No description provided for @typeImportButton.
  ///
  /// In en, this message translates to:
  /// **'Import text'**
  String get typeImportButton;

  /// No description provided for @typeClearButton.
  ///
  /// In en, this message translates to:
  /// **'Clear text'**
  String get typeClearButton;

  /// No description provided for @typeSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send to watch'**
  String get typeSendButton;

  /// No description provided for @typeImportFailure.
  ///
  /// In en, this message translates to:
  /// **'Unable to import the text file: {error}'**
  String typeImportFailure(Object error);

  /// No description provided for @typeNoDeviceMessage.
  ///
  /// In en, this message translates to:
  /// **'No device detected. Please check the connection.'**
  String get typeNoDeviceMessage;

  /// No description provided for @typeEmptyTextMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter some text.'**
  String get typeEmptyTextMessage;

  /// No description provided for @typeSendingProgress.
  ///
  /// In en, this message translates to:
  /// **'Sending text...'**
  String get typeSendingProgress;

  /// No description provided for @typePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Enable \"USB debugging (Security settings)\" in Developer Options and try again.'**
  String get typePermissionDenied;

  /// No description provided for @typeSendSuccess.
  ///
  /// In en, this message translates to:
  /// **'Text sent to the device.'**
  String get typeSendSuccess;

  /// No description provided for @typeSendFailure.
  ///
  /// In en, this message translates to:
  /// **'An error occurred: {error}'**
  String typeSendFailure(Object error);

  /// No description provided for @typeConnectionCheckFailure.
  ///
  /// In en, this message translates to:
  /// **'Unable to check device connection: {error}'**
  String typeConnectionCheckFailure(Object error);

  /// No description provided for @viewOnGithub.
  ///
  /// In en, this message translates to:
  /// **'Github'**
  String get viewOnGithub;

  /// No description provided for @githubDescription.
  ///
  /// In en, this message translates to:
  /// **'Open-sourced under the APGL-3.0 License'**
  String get githubDescription;

  /// No description provided for @driverTitle.
  ///
  /// In en, this message translates to:
  /// **'USB Driver Installation Guide'**
  String get driverTitle;

  /// No description provided for @driverIntro.
  ///
  /// In en, this message translates to:
  /// **'This tutorial applies only to Windows. Users on macOS or Linux do not need to install the USB driver.'**
  String get driverIntro;

  /// No description provided for @driverStep1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Download the USB driver'**
  String get driverStep1Title;

  /// No description provided for @driverStep1LinkPrefix.
  ///
  /// In en, this message translates to:
  /// **'Open the'**
  String get driverStep1LinkPrefix;

  /// No description provided for @driverStep1LinkText.
  ///
  /// In en, this message translates to:
  /// **'Android USB Driver'**
  String get driverStep1LinkText;

  /// No description provided for @driverStep1LinkSuffix.
  ///
  /// In en, this message translates to:
  /// **'download page'**
  String get driverStep1LinkSuffix;

  /// No description provided for @driverStep1DownloadInstructions.
  ///
  /// In en, this message translates to:
  /// **'Click \"Download the Google USB Driver ZIP file (ZIP)\", accept the license, then download \"usb_driver_r13-windows.zip\" and extract it anywhere.'**
  String get driverStep1DownloadInstructions;

  /// No description provided for @driverStep2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Open Device Manager'**
  String get driverStep2Title;

  /// No description provided for @driverStep2Description.
  ///
  /// In en, this message translates to:
  /// **'Open Settings and go to System Information, then open Device Manager.'**
  String get driverStep2Description;

  /// No description provided for @driverStep3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Connect your device'**
  String get driverStep3Title;

  /// No description provided for @driverStep3Description.
  ///
  /// In en, this message translates to:
  /// **'Connect your device to the computer via cable or charging dock, then find and expand Other devices or Portable devices in Device Manager.'**
  String get driverStep3Description;

  /// No description provided for @driverStep4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Update the driver'**
  String get driverStep4Title;

  /// No description provided for @driverStep4Description.
  ///
  /// In en, this message translates to:
  /// **'Right-click the device entry and choose Update driver.'**
  String get driverStep4Description;

  /// No description provided for @driverStep5Title.
  ///
  /// In en, this message translates to:
  /// **'5. In the dialog that appears, choose \"Browse my computer for drivers\"'**
  String get driverStep5Title;

  /// No description provided for @driverStep6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Select the driver folder'**
  String get driverStep6Title;

  /// No description provided for @driverStep6Description.
  ///
  /// In en, this message translates to:
  /// **'Click Browse and locate the USB driver folder you extracted, \"usb_driver_r13-windows\".'**
  String get driverStep6Description;

  /// No description provided for @driverStep7Title.
  ///
  /// In en, this message translates to:
  /// **'7. Install the driver'**
  String get driverStep7Title;

  /// No description provided for @driverStep7Description.
  ///
  /// In en, this message translates to:
  /// **'Click Next to install the driver and finish the setup.'**
  String get driverStep7Description;

  /// No description provided for @driverUrlLaunchError.
  ///
  /// In en, this message translates to:
  /// **'Unable to open link: {url}'**
  String driverUrlLaunchError(Object url);

  /// No description provided for @tutorialTitle.
  ///
  /// In en, this message translates to:
  /// **'USB debugging setup guide (applicable to most devices)'**
  String get tutorialTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
