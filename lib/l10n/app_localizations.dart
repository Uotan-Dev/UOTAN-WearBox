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
  /// **'Uotan WearBox\n© 2020-2026 Gnayoah.com All rights reserved.'**
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

  /// No description provided for @settingsDarkModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get settingsDarkModeTitle;

  /// No description provided for @settingsDarkModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Switch between light and dark appearance'**
  String get settingsDarkModeSubtitle;

  /// No description provided for @themeModeSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get themeModeSystem;

  /// No description provided for @themeModeAlwaysOn.
  ///
  /// In en, this message translates to:
  /// **'Always on'**
  String get themeModeAlwaysOn;

  /// No description provided for @themeModeAlwaysOff.
  ///
  /// In en, this message translates to:
  /// **'Always off'**
  String get themeModeAlwaysOff;

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

  /// No description provided for @updateDialogLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get updateDialogLater;

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
  /// **'No device detected. Follow the steps below to connect.'**
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
  /// **'Bootloader Lock: {bootloader}'**
  String deviceBootloader(Object bootloader);

  /// No description provided for @deviceArchitecture.
  ///
  /// In en, this message translates to:
  /// **'CPU Architecture: {architecture}'**
  String deviceArchitecture(Object architecture);

  /// No description provided for @deviceBatteryLevel.
  ///
  /// In en, this message translates to:
  /// **'Battery: {level}%'**
  String deviceBatteryLevel(Object level);

  /// No description provided for @deviceBatteryHealth.
  ///
  /// In en, this message translates to:
  /// **'Battery Health: {health}'**
  String deviceBatteryHealth(Object health);

  /// No description provided for @deviceBatteryVoltage.
  ///
  /// In en, this message translates to:
  /// **'Battery Voltage: {voltage} mV'**
  String deviceBatteryVoltage(Object voltage);

  /// No description provided for @deviceBatteryTemperature.
  ///
  /// In en, this message translates to:
  /// **'Battery Temperature: {temperature} °C'**
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
  /// **'Storage / Memory cleanup'**
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
  /// **'Custom flash'**
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
  /// **'Open-sourced under the AGPL-3.0 License'**
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

  /// No description provided for @homeConnectionHelp.
  ///
  /// In en, this message translates to:
  /// **'Connection help'**
  String get homeConnectionHelp;

  /// No description provided for @homeWirelessUse.
  ///
  /// In en, this message translates to:
  /// **'2. Use'**
  String get homeWirelessUse;

  /// No description provided for @homeCheckDebugPrefix.
  ///
  /// In en, this message translates to:
  /// **'3. Make sure you have enabled'**
  String get homeCheckDebugPrefix;

  /// No description provided for @homeUsbDebugLink.
  ///
  /// In en, this message translates to:
  /// **'USB debugging'**
  String get homeUsbDebugLink;

  /// No description provided for @homeInstallDriverPrefix.
  ///
  /// In en, this message translates to:
  /// **'and installed the'**
  String get homeInstallDriverPrefix;

  /// No description provided for @homeAdbDriverLink.
  ///
  /// In en, this message translates to:
  /// **'ADB driver'**
  String get homeAdbDriverLink;

  /// No description provided for @homeDriverSuffix.
  ///
  /// In en, this message translates to:
  /// **''**
  String get homeDriverSuffix;

  /// No description provided for @homeRebootTo.
  ///
  /// In en, this message translates to:
  /// **'Reboot to'**
  String get homeRebootTo;

  /// No description provided for @homeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get homeSystem;

  /// No description provided for @homeSelectDevice.
  ///
  /// In en, this message translates to:
  /// **'Select device'**
  String get homeSelectDevice;

  /// No description provided for @homeNoConnectedDevices.
  ///
  /// In en, this message translates to:
  /// **'No connected devices'**
  String get homeNoConnectedDevices;

  /// No description provided for @homeRefreshing.
  ///
  /// In en, this message translates to:
  /// **'Refreshing...'**
  String get homeRefreshing;

  /// No description provided for @homeRefreshDevices.
  ///
  /// In en, this message translates to:
  /// **'Refresh devices'**
  String get homeRefreshDevices;

  /// No description provided for @homeDevicesRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Device list refreshed'**
  String get homeDevicesRefreshed;

  /// No description provided for @homeRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to refresh devices: {error}'**
  String homeRefreshFailed(String error);

  /// No description provided for @homeDeviceInfo.
  ///
  /// In en, this message translates to:
  /// **'Device information'**
  String get homeDeviceInfo;

  /// No description provided for @homeSelectDeviceFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select a device first'**
  String get homeSelectDeviceFirst;

  /// No description provided for @homeCommandSent.
  ///
  /// In en, this message translates to:
  /// **'Command sent'**
  String get homeCommandSent;

  /// No description provided for @commandExitFailure.
  ///
  /// In en, this message translates to:
  /// **'Command failed with exit code: {code}'**
  String commandExitFailure(String code);

  /// No description provided for @homeAdbError.
  ///
  /// In en, this message translates to:
  /// **'ADB error: {error}'**
  String homeAdbError(String error);

  /// No description provided for @batteryCurrentLevel.
  ///
  /// In en, this message translates to:
  /// **'Current charge'**
  String get batteryCurrentLevel;

  /// No description provided for @batteryTemperatureLabel.
  ///
  /// In en, this message translates to:
  /// **'Temperature (°C)'**
  String get batteryTemperatureLabel;

  /// No description provided for @batteryLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Charge (%)'**
  String get batteryLevelLabel;

  /// No description provided for @batterySimulateDischarging.
  ///
  /// In en, this message translates to:
  /// **'Simulate discharging'**
  String get batterySimulateDischarging;

  /// No description provided for @batterySimulateWireless.
  ///
  /// In en, this message translates to:
  /// **'Simulate wireless charging'**
  String get batterySimulateWireless;

  /// No description provided for @batterySimulateUsb.
  ///
  /// In en, this message translates to:
  /// **'Simulate USB charging'**
  String get batterySimulateUsb;

  /// No description provided for @batteryRestoreDefault.
  ///
  /// In en, this message translates to:
  /// **'Restore defaults'**
  String get batteryRestoreDefault;

  /// No description provided for @batteryModify.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get batteryModify;

  /// No description provided for @batteryHealthGood.
  ///
  /// In en, this message translates to:
  /// **'Good (2)'**
  String get batteryHealthGood;

  /// No description provided for @batteryHealthOverheat.
  ///
  /// In en, this message translates to:
  /// **'Overheating (3)'**
  String get batteryHealthOverheat;

  /// No description provided for @batteryHealthDead.
  ///
  /// In en, this message translates to:
  /// **'Dead (4)'**
  String get batteryHealthDead;

  /// No description provided for @batteryHealthOverVoltage.
  ///
  /// In en, this message translates to:
  /// **'Overvoltage (5)'**
  String get batteryHealthOverVoltage;

  /// No description provided for @batteryHealthFailure.
  ///
  /// In en, this message translates to:
  /// **'Failure (6)'**
  String get batteryHealthFailure;

  /// No description provided for @batteryHealthCold.
  ///
  /// In en, this message translates to:
  /// **'Too cold (7)'**
  String get batteryHealthCold;

  /// No description provided for @batteryHealthUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown ({code})'**
  String batteryHealthUnknown(String code);

  /// No description provided for @batteryResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Battery simulation settings restored.'**
  String get batteryResetSuccess;

  /// No description provided for @batteryEnterTemperature.
  ///
  /// In en, this message translates to:
  /// **'Please enter a temperature.'**
  String get batteryEnterTemperature;

  /// No description provided for @batteryInvalidTemperature.
  ///
  /// In en, this message translates to:
  /// **'Invalid temperature format.'**
  String get batteryInvalidTemperature;

  /// No description provided for @batteryTemperatureChanged.
  ///
  /// In en, this message translates to:
  /// **'Temperature changed to {temperature}°C'**
  String batteryTemperatureChanged(String temperature);

  /// No description provided for @batteryEnterLevel.
  ///
  /// In en, this message translates to:
  /// **'Please enter a charge level.'**
  String get batteryEnterLevel;

  /// No description provided for @batteryInvalidLevel.
  ///
  /// In en, this message translates to:
  /// **'Charge must be an integer from 0 to 100.'**
  String get batteryInvalidLevel;

  /// No description provided for @batteryLevelChanged.
  ///
  /// In en, this message translates to:
  /// **'Charge changed to {level}%'**
  String batteryLevelChanged(String level);

  /// No description provided for @adbCommandFailed.
  ///
  /// In en, this message translates to:
  /// **'ADB command failed.'**
  String get adbCommandFailed;

  /// No description provided for @adbCommandError.
  ///
  /// In en, this message translates to:
  /// **'ADB command failed: {details}'**
  String adbCommandError(String details);

  /// No description provided for @adbCommandTimeout.
  ///
  /// In en, this message translates to:
  /// **'ADB command timed out. Check the device connection and try again.'**
  String get adbCommandTimeout;

  /// No description provided for @adbExecutionError.
  ///
  /// In en, this message translates to:
  /// **'Unable to run ADB command: {error}'**
  String adbExecutionError(String error);

  /// No description provided for @adbConnectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'ADB connection check timed out. Check the cable or wireless connection.'**
  String get adbConnectionTimeout;

  /// No description provided for @adbConnectionError.
  ///
  /// In en, this message translates to:
  /// **'Unable to check device connection: {error}'**
  String adbConnectionError(String error);

  /// No description provided for @captureSaveLocation.
  ///
  /// In en, this message translates to:
  /// **'Save location'**
  String get captureSaveLocation;

  /// No description provided for @captureComputerFolder.
  ///
  /// In en, this message translates to:
  /// **'Computer folder'**
  String get captureComputerFolder;

  /// No description provided for @captureDeviceFolder.
  ///
  /// In en, this message translates to:
  /// **'Device folder'**
  String get captureDeviceFolder;

  /// No description provided for @captureChooseFolder.
  ///
  /// In en, this message translates to:
  /// **'Choose folder'**
  String get captureChooseFolder;

  /// No description provided for @captureSetDevicePath.
  ///
  /// In en, this message translates to:
  /// **'Set device path'**
  String get captureSetDevicePath;

  /// No description provided for @captureSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Screenshot and recording'**
  String get captureSectionTitle;

  /// No description provided for @captureTakeScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Take screenshot'**
  String get captureTakeScreenshot;

  /// No description provided for @captureStartRecording.
  ///
  /// In en, this message translates to:
  /// **'Start recording'**
  String get captureStartRecording;

  /// No description provided for @captureStopRecording.
  ///
  /// In en, this message translates to:
  /// **'Stop recording'**
  String get captureStopRecording;

  /// No description provided for @captureLocationLockedHint.
  ///
  /// In en, this message translates to:
  /// **'The save location is locked during recording to prevent export errors.'**
  String get captureLocationLockedHint;

  /// No description provided for @captureChooseSaveFolder.
  ///
  /// In en, this message translates to:
  /// **'Choose save folder'**
  String get captureChooseSaveFolder;

  /// No description provided for @captureDeviceSavePath.
  ///
  /// In en, this message translates to:
  /// **'Set device save path'**
  String get captureDeviceSavePath;

  /// No description provided for @captureScreenshotFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to capture screenshot on device'**
  String get captureScreenshotFailed;

  /// No description provided for @captureScreenshotSavedDevice.
  ///
  /// In en, this message translates to:
  /// **'Screenshot saved on device:\n{path}'**
  String captureScreenshotSavedDevice(String path);

  /// No description provided for @captureScreenshotExportFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export screenshot'**
  String get captureScreenshotExportFailed;

  /// No description provided for @captureScreenshotSavedComputer.
  ///
  /// In en, this message translates to:
  /// **'Screenshot saved on computer:\n{path}'**
  String captureScreenshotSavedComputer(String path);

  /// No description provided for @commandExecutionError.
  ///
  /// In en, this message translates to:
  /// **'Execution failed: {error}'**
  String commandExecutionError(String error);

  /// No description provided for @captureRecordingStartFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to start recording'**
  String get captureRecordingStartFailed;

  /// No description provided for @captureRecordingProcessMissing.
  ///
  /// In en, this message translates to:
  /// **'Unable to find the recording process. Check that the device supports screenrecord.'**
  String get captureRecordingProcessMissing;

  /// No description provided for @captureRecordingStarted.
  ///
  /// In en, this message translates to:
  /// **'Recording started.'**
  String get captureRecordingStarted;

  /// No description provided for @captureRecordingInvalidState.
  ///
  /// In en, this message translates to:
  /// **'Invalid recording state. Please restart recording.'**
  String get captureRecordingInvalidState;

  /// No description provided for @captureRecordingSavedDevice.
  ///
  /// In en, this message translates to:
  /// **'Recording saved on device:\n{path}'**
  String captureRecordingSavedDevice(String path);

  /// No description provided for @captureRecordingExportFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export recording'**
  String get captureRecordingExportFailed;

  /// No description provided for @captureRecordingSavedComputer.
  ///
  /// In en, this message translates to:
  /// **'Recording saved on computer:\n{path}'**
  String captureRecordingSavedComputer(String path);

  /// No description provided for @flashPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom flash'**
  String get flashPageTitle;

  /// No description provided for @flashCustomPartition.
  ///
  /// In en, this message translates to:
  /// **'Custom partition'**
  String get flashCustomPartition;

  /// No description provided for @flashChooseFile.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get flashChooseFile;

  /// No description provided for @flashTargetPartition.
  ///
  /// In en, this message translates to:
  /// **'Flash to'**
  String get flashTargetPartition;

  /// No description provided for @flashAction.
  ///
  /// In en, this message translates to:
  /// **'Flash'**
  String get flashAction;

  /// No description provided for @flashLogTitle.
  ///
  /// In en, this message translates to:
  /// **'Log output'**
  String get flashLogTitle;

  /// No description provided for @flashNoLogs.
  ///
  /// In en, this message translates to:
  /// **'No logs yet'**
  String get flashNoLogs;

  /// No description provided for @flashQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get flashQuickActions;

  /// No description provided for @flashDisableVbmeta.
  ///
  /// In en, this message translates to:
  /// **'Disable vbmeta verification'**
  String get flashDisableVbmeta;

  /// No description provided for @flashSwitchSlot.
  ///
  /// In en, this message translates to:
  /// **'Switch slot'**
  String get flashSwitchSlot;

  /// No description provided for @flashSelectImageFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select an image file first.'**
  String get flashSelectImageFirst;

  /// No description provided for @flashEnterPartition.
  ///
  /// In en, this message translates to:
  /// **'Please enter a partition name.'**
  String get flashEnterPartition;

  /// No description provided for @flashSelectVbmetaImage.
  ///
  /// In en, this message translates to:
  /// **'Select vbmeta image'**
  String get flashSelectVbmetaImage;

  /// No description provided for @flashUnknownSlot.
  ///
  /// In en, this message translates to:
  /// **'Unable to identify the current slot. Check the fastboot log.'**
  String get flashUnknownSlot;

  /// No description provided for @flashSwitchSlotFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to switch slot: {error}'**
  String flashSwitchSlotFailed(String error);

  /// No description provided for @flashOperationFailed.
  ///
  /// In en, this message translates to:
  /// **'Operation failed with exit code: {code}'**
  String flashOperationFailed(String code);

  /// No description provided for @flashExecutionError.
  ///
  /// In en, this message translates to:
  /// **'Unable to run fastboot command: {error}'**
  String flashExecutionError(String error);

  /// No description provided for @flashNoDevice.
  ///
  /// In en, this message translates to:
  /// **'No fastboot device detected. Make sure the device is in fastboot mode.'**
  String get flashNoDevice;

  /// No description provided for @flashDetectionError.
  ///
  /// In en, this message translates to:
  /// **'Unable to detect fastboot devices. Make sure fastboot is installed and available.\n{error}'**
  String flashDetectionError(String error);

  /// No description provided for @memoryStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Memory status'**
  String get memoryStatusTitle;

  /// No description provided for @memoryTotal.
  ///
  /// In en, this message translates to:
  /// **'Total memory'**
  String get memoryTotal;

  /// No description provided for @memoryUsed.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get memoryUsed;

  /// No description provided for @memoryAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available memory'**
  String get memoryAvailable;

  /// No description provided for @memoryFree.
  ///
  /// In en, this message translates to:
  /// **'Free memory'**
  String get memoryFree;

  /// No description provided for @memoryCached.
  ///
  /// In en, this message translates to:
  /// **'Cached'**
  String get memoryCached;

  /// No description provided for @memoryCleanupTitle.
  ///
  /// In en, this message translates to:
  /// **'Cleanup actions'**
  String get memoryCleanupTitle;

  /// No description provided for @memoryClearBackground.
  ///
  /// In en, this message translates to:
  /// **'Clear background processes'**
  String get memoryClearBackground;

  /// No description provided for @memoryClearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear app cache'**
  String get memoryClearCache;

  /// No description provided for @memoryCustomPackage.
  ///
  /// In en, this message translates to:
  /// **'Custom package to stop'**
  String get memoryCustomPackage;

  /// No description provided for @memoryPackageHint.
  ///
  /// In en, this message translates to:
  /// **'Example: com.google.android.gms'**
  String get memoryPackageHint;

  /// No description provided for @memoryForceStop.
  ///
  /// In en, this message translates to:
  /// **'Force stop app'**
  String get memoryForceStop;

  /// No description provided for @memoryBackgroundCleared.
  ///
  /// In en, this message translates to:
  /// **'Background processes cleared.'**
  String get memoryBackgroundCleared;

  /// No description provided for @memoryCacheCommandSent.
  ///
  /// In en, this message translates to:
  /// **'Cache cleanup command executed.'**
  String get memoryCacheCommandSent;

  /// No description provided for @memoryEnterPackage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a package name.'**
  String get memoryEnterPackage;

  /// No description provided for @memoryStopAttempted.
  ///
  /// In en, this message translates to:
  /// **'Attempted to stop: {packageName}'**
  String memoryStopAttempted(String packageName);

  /// No description provided for @commandStderrFailure.
  ///
  /// In en, this message translates to:
  /// **'Execution failed: {details}'**
  String commandStderrFailure(String details);

  /// No description provided for @commandExitCodeFailure.
  ///
  /// In en, this message translates to:
  /// **'Command failed with exit code: {code}'**
  String commandExitCodeFailure(String code);

  /// No description provided for @privacyParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyParagraph1;

  /// No description provided for @privacyParagraph2.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox Privacy Policy'**
  String get privacyParagraph2;

  /// No description provided for @privacyParagraph3.
  ///
  /// In en, this message translates to:
  /// **'Last updated: September 19, 2024'**
  String get privacyParagraph3;

  /// No description provided for @privacyParagraph4.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Uotan WearBox (the “App”). We understand the importance of personal information and undertake to comply strictly with applicable laws and regulations and adopt appropriate security measures to protect it. Before using the App, please read and fully understand this Privacy Policy.'**
  String get privacyParagraph4;

  /// No description provided for @privacyParagraph5.
  ///
  /// In en, this message translates to:
  /// **'1. Information we collect'**
  String get privacyParagraph5;

  /// No description provided for @privacyParagraph6.
  ///
  /// In en, this message translates to:
  /// **'1. Internet Protocol address: We collect your IP address only when necessary to ensure the proper operation and security of the App. Apart from your IP address, we do not collect other information that identifies you personally.'**
  String get privacyParagraph6;

  /// No description provided for @privacyParagraph7.
  ///
  /// In en, this message translates to:
  /// **'2. Required permissions:'**
  String get privacyParagraph7;

  /// No description provided for @privacyParagraph8.
  ///
  /// In en, this message translates to:
  /// **'     - Network access: The App requires network access for data transfers, server communication, and feature updates.\n     - Device information: To improve performance and compatibility, we may read device information such as the model and operating system version.\n     - Storage access: The App may read and write device storage to cache data, save user settings, and provide offline features.'**
  String get privacyParagraph8;

  /// No description provided for @privacyParagraph9.
  ///
  /// In en, this message translates to:
  /// **'2. How we use information'**
  String get privacyParagraph9;

  /// No description provided for @privacyParagraph10.
  ///
  /// In en, this message translates to:
  /// **'1. Providing and maintaining services: We use the IP address and device information collected to ensure the App operates properly, improve its features, and continually enhance the user experience.'**
  String get privacyParagraph10;

  /// No description provided for @privacyParagraph11.
  ///
  /// In en, this message translates to:
  /// **'2. Security: We use IP addresses and device information for security monitoring and risk prevention, including preventing fraud, network attacks, and other activities that may compromise system security.'**
  String get privacyParagraph11;

  /// No description provided for @privacyParagraph12.
  ///
  /// In en, this message translates to:
  /// **'3. Legal basis for processing personal information'**
  String get privacyParagraph12;

  /// No description provided for @privacyParagraph13.
  ///
  /// In en, this message translates to:
  /// **'For users in mainland China, we collect and use personal information to provide products and/or services in accordance with the Cybersecurity Law of the People’s Republic of China, Information Security Technology — Personal Information Security Specification (GB/T 35273-2017), and other applicable laws and regulations. We generally collect personal information only with your consent. In some cases, collection may be necessary to meet legal obligations, perform a contract, or protect your vital interests or those of others.'**
  String get privacyParagraph13;

  /// No description provided for @privacyParagraph14.
  ///
  /// In en, this message translates to:
  /// **'4. Sharing, transferring, and publicly disclosing information'**
  String get privacyParagraph14;

  /// No description provided for @privacyParagraph15.
  ///
  /// In en, this message translates to:
  /// **'1. Legal requirements: We may disclose personal information when lawfully required by judicial or governmental authorities, subject to applicable laws and regulations.'**
  String get privacyParagraph15;

  /// No description provided for @privacyParagraph16.
  ///
  /// In en, this message translates to:
  /// **'2. Business transfers: In a merger, acquisition, asset transfer, or similar transaction, your personal information may be transferred as an asset. We will require the new holder to remain bound by this Policy or obtain your consent again.'**
  String get privacyParagraph16;

  /// No description provided for @privacyParagraph17.
  ///
  /// In en, this message translates to:
  /// **'3. Unauthorized disclosure: We will not publicly disclose your personal information without your explicit consent.'**
  String get privacyParagraph17;

  /// No description provided for @privacyParagraph18.
  ///
  /// In en, this message translates to:
  /// **'4. Exceptions to consent for sharing, transferring, or publicly disclosing personal information'**
  String get privacyParagraph18;

  /// No description provided for @privacyParagraph19.
  ///
  /// In en, this message translates to:
  /// **'Under applicable laws and regulations, we may share, transfer, or publicly disclose personal information without your consent in the following circumstances:'**
  String get privacyParagraph19;

  /// No description provided for @privacyParagraph20.
  ///
  /// In en, this message translates to:
  /// **'    - Matters concerning national security or national defense;\n    - Matters concerning public security, public health, or major public interests;\n    - Criminal investigations, prosecutions, trials, or enforcement of judgments;\n    - Protecting major lawful rights and interests, such as life or property, when obtaining consent is difficult;\n    - Personal information you have made public yourself;\n    - Information collected from lawful public disclosures, such as legitimate news reports or government disclosures;\n    - Other circumstances prescribed by law.'**
  String get privacyParagraph20;

  /// No description provided for @privacyParagraph21.
  ///
  /// In en, this message translates to:
  /// **'5. Storage and protection of information'**
  String get privacyParagraph21;

  /// No description provided for @privacyParagraph22.
  ///
  /// In en, this message translates to:
  /// **'1. Storage: We store information collected from you in the People’s Republic of China or the Hong Kong Special Administrative Region. For cross-border transfers, we will separately notify you by a pop-up or email of the purpose, recipient, and other details, and obtain your consent. We will ensure the recipient has adequate data protection capabilities.'**
  String get privacyParagraph22;

  /// No description provided for @privacyParagraph23.
  ///
  /// In en, this message translates to:
  /// **'2. Security measures: We strive to protect your personal information through physical, electronic, and administrative safeguards that meet industry standards. We establish data classification systems and standards for data security management and secure development to govern storage and use, and ensure we do not collect personal information unrelated to our services.'**
  String get privacyParagraph23;

  /// No description provided for @privacyParagraph24.
  ///
  /// In en, this message translates to:
  /// **'3. Security incidents: Although we make every effort to secure the information you send us, technical limitations and malicious activity on the Internet mean that absolute security cannot be guaranteed. Systems and communication networks used to access our services may experience problems beyond our control.'**
  String get privacyParagraph24;

  /// No description provided for @privacyParagraph25.
  ///
  /// In en, this message translates to:
  /// **'We maintain warning mechanisms and emergency plans to prevent security incidents. If a personal information security incident occurs, we will promptly inform you, as required by law, of its nature and potential impact, measures taken or planned, advice on reducing risks, and remedies available to you. We will immediately activate our emergency plan to minimize losses. We will notify you by telephone, push notification, or other means, or issue a reasonable and effective public announcement if individual notification is difficult. We will also report our response to regulators as required and cooperate closely with government authorities.'**
  String get privacyParagraph25;

  /// No description provided for @privacyParagraph26.
  ///
  /// In en, this message translates to:
  /// **'6. Your rights'**
  String get privacyParagraph26;

  /// No description provided for @privacyParagraph27.
  ///
  /// In en, this message translates to:
  /// **'1. Access and correction: You have the right to access and update your personal information. To exercise these rights, contact us using the details in this Policy.'**
  String get privacyParagraph27;

  /// No description provided for @privacyParagraph28.
  ///
  /// In en, this message translates to:
  /// **'2. Deletion and withdrawal of consent: Subject to applicable laws, you may request deletion of your personal information or withdraw consent. Deletion or withdrawal may prevent us from continuing to provide some or all services.'**
  String get privacyParagraph28;

  /// No description provided for @privacyParagraph29.
  ///
  /// In en, this message translates to:
  /// **'7. Protection of minors'**
  String get privacyParagraph29;

  /// No description provided for @privacyParagraph30.
  ///
  /// In en, this message translates to:
  /// **'We take the protection of minors’ personal information seriously. If you are under 18, use the App with the consent and guidance of a parent or legal guardian, and provide personal information only with their consent.'**
  String get privacyParagraph30;

  /// No description provided for @privacyParagraph31.
  ///
  /// In en, this message translates to:
  /// **'8. Updates to this Privacy Policy'**
  String get privacyParagraph31;

  /// No description provided for @privacyParagraph32.
  ///
  /// In en, this message translates to:
  /// **'We may revise this Policy as our business develops or laws and regulations change. Revisions will be published on this page and take effect upon publication. Please review this Policy regularly to learn about the latest privacy protections.'**
  String get privacyParagraph32;

  /// No description provided for @privacyParagraph33.
  ///
  /// In en, this message translates to:
  /// **'9. Governing law and dispute resolution'**
  String get privacyParagraph33;

  /// No description provided for @privacyParagraph34.
  ///
  /// In en, this message translates to:
  /// **'The formation, effectiveness, performance, interpretation, and dispute resolution of this Policy are governed by the laws of the People’s Republic of China. Disputes shall be resolved through amicable consultation; if consultation fails, either party may bring proceedings in the people’s court with jurisdiction where the App is based.'**
  String get privacyParagraph34;

  /// No description provided for @privacyParagraph35.
  ///
  /// In en, this message translates to:
  /// **'10. Contact us'**
  String get privacyParagraph35;

  /// No description provided for @privacyParagraph36.
  ///
  /// In en, this message translates to:
  /// **'If you have questions, comments, or suggestions about this Policy, or wish to exercise your rights, contact us at:\nEmail: support@Gnayoah.com'**
  String get privacyParagraph36;

  /// No description provided for @privacyParagraph37.
  ///
  /// In en, this message translates to:
  /// **'We will review the matter as soon as possible and respond promptly after receiving your request.'**
  String get privacyParagraph37;

  /// No description provided for @privacyParagraph38.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your trust in and support of Uotan WearBox.'**
  String get privacyParagraph38;

  /// No description provided for @agreementParagraph1.
  ///
  /// In en, this message translates to:
  /// **'User Agreement'**
  String get agreementParagraph1;

  /// No description provided for @agreementParagraph2.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox User Agreement'**
  String get agreementParagraph2;

  /// No description provided for @agreementParagraph3.
  ///
  /// In en, this message translates to:
  /// **'Last updated: September 18, 2024'**
  String get agreementParagraph3;

  /// No description provided for @agreementParagraph4.
  ///
  /// In en, this message translates to:
  /// **'Before using Uotan WearBox (the “App” or “we”), please read and fully understand this User Agreement (the “Agreement”). This is a legally binding agreement between you (the “User” or “you”) and Uotan WearBox concerning use of the App. Downloading, installing, or otherwise using the App means that you have read, understood, and agreed to all its terms and conditions.'**
  String get agreementParagraph4;

  /// No description provided for @agreementParagraph5.
  ///
  /// In en, this message translates to:
  /// **'1. Independence of the Privacy Policy'**
  String get agreementParagraph5;

  /// No description provided for @agreementParagraph6.
  ///
  /// In en, this message translates to:
  /// **'The privacy policies of Uotan Community and Uotan WearBox are entirely separate and unrelated. To review the Uotan Community privacy policy, visit its official website. The App’s Privacy Policy applies only to Uotan WearBox.'**
  String get agreementParagraph6;

  /// No description provided for @agreementParagraph7.
  ///
  /// In en, this message translates to:
  /// **'2. Acceptance and amendment'**
  String get agreementParagraph7;

  /// No description provided for @agreementParagraph8.
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance'**
  String get agreementParagraph8;

  /// No description provided for @agreementParagraph9.
  ///
  /// In en, this message translates to:
  /// **'Read this Agreement in full before using the App. If you disagree with any term, stop using the App immediately. Downloading, installing, or using the App constitutes acceptance of this Agreement.'**
  String get agreementParagraph9;

  /// No description provided for @agreementParagraph10.
  ///
  /// In en, this message translates to:
  /// **'2. Amendments'**
  String get agreementParagraph10;

  /// No description provided for @agreementParagraph11.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to revise this Agreement at any time as our business develops or laws and regulations change, without separate individual notice. Revisions take effect upon publication. You are responsible for reviewing the latest version; continued use after changes constitutes acceptance of the revised Agreement.'**
  String get agreementParagraph11;

  /// No description provided for @agreementParagraph12.
  ///
  /// In en, this message translates to:
  /// **'3. Services and usage rules'**
  String get agreementParagraph12;

  /// No description provided for @agreementParagraph13.
  ///
  /// In en, this message translates to:
  /// **'1. Services'**
  String get agreementParagraph13;

  /// No description provided for @agreementParagraph14.
  ///
  /// In en, this message translates to:
  /// **'The App provides watch-related assistance and services, including time display, alarm settings, and health monitoring. The services available are determined by the actual features provided in the App.'**
  String get agreementParagraph14;

  /// No description provided for @agreementParagraph15.
  ///
  /// In en, this message translates to:
  /// **'2. Changes, suspension, or termination of services'**
  String get agreementParagraph15;

  /// No description provided for @agreementParagraph16.
  ///
  /// In en, this message translates to:
  /// **'We may adjust, suspend, or terminate some or all services at any time as circumstances require, without prior notice. We accept no liability for losses resulting from such adjustments, suspension, or termination.'**
  String get agreementParagraph16;

  /// No description provided for @agreementParagraph17.
  ///
  /// In en, this message translates to:
  /// **'4. User conduct'**
  String get agreementParagraph17;

  /// No description provided for @agreementParagraph18.
  ///
  /// In en, this message translates to:
  /// **'1. Lawful use'**
  String get agreementParagraph18;

  /// No description provided for @agreementParagraph19.
  ///
  /// In en, this message translates to:
  /// **'You undertake to use the App lawfully and not to engage in conduct that violates laws, public morality, or the lawful rights of others, including the following:'**
  String get agreementParagraph19;

  /// No description provided for @agreementParagraph20.
  ///
  /// In en, this message translates to:
  /// **'• Intellectual property infringement: Do not copy, distribute, modify, or otherwise use content protected by copyright, trademark, patent, or other laws without authorization.'**
  String get agreementParagraph20;

  /// No description provided for @agreementParagraph21.
  ///
  /// In en, this message translates to:
  /// **'• Inappropriate content: Do not publish or distribute content prohibited by law, including obscenity, pornography, gambling, violence, terrorism, superstition, defamation, insults, incitement, or encouragement of crime.'**
  String get agreementParagraph21;

  /// No description provided for @agreementParagraph22.
  ///
  /// In en, this message translates to:
  /// **'• Security threats: Do not compromise or attempt to compromise network security, including spreading malware, viruses, trojans, or worms, or attacking the App’s servers, networks, or other users’ devices.'**
  String get agreementParagraph22;

  /// No description provided for @agreementParagraph23.
  ///
  /// In en, this message translates to:
  /// **'2. Compliance with laws'**
  String get agreementParagraph23;

  /// No description provided for @agreementParagraph24.
  ///
  /// In en, this message translates to:
  /// **'When using the App, comply strictly with applicable laws, including the Cybersecurity Law and Civil Code of the People’s Republic of China. Do not use the App for illegal or criminal activities.'**
  String get agreementParagraph24;

  /// No description provided for @agreementParagraph25.
  ///
  /// In en, this message translates to:
  /// **'5. Intellectual property'**
  String get agreementParagraph25;

  /// No description provided for @agreementParagraph26.
  ///
  /// In en, this message translates to:
  /// **'1. Ownership'**
  String get agreementParagraph26;

  /// No description provided for @agreementParagraph27.
  ///
  /// In en, this message translates to:
  /// **'The App and all its content, including text, graphics, interface designs, visual effects, logos, trademarks, code, programs, software, services, and documentation, are protected by applicable laws, including the Copyright Law, Trademark Law, and Patent Law of the People’s Republic of China. The relevant rights belong to Gnayoah or its licensors.'**
  String get agreementParagraph27;

  /// No description provided for @agreementParagraph28.
  ///
  /// In en, this message translates to:
  /// **'2. License'**
  String get agreementParagraph28;

  /// No description provided for @agreementParagraph29.
  ///
  /// In en, this message translates to:
  /// **'We grant you a personal, non-transferable, non-exclusive, revocable, limited license to download, install, and use the App under this Agreement. Without our prior written consent, you may not copy, modify, distribute, sell, transfer, or otherwise exploit any part of the App.'**
  String get agreementParagraph29;

  /// No description provided for @agreementParagraph30.
  ///
  /// In en, this message translates to:
  /// **'3. Prohibited acts'**
  String get agreementParagraph30;

  /// No description provided for @agreementParagraph31.
  ///
  /// In en, this message translates to:
  /// **'Without written authorization from us or the relevant rights holders, you may not exercise, exploit, transfer, or license third parties to exercise, exploit, or transfer the above intellectual property in any form, including reverse engineering, decompiling, disassembling, or cracking the App.'**
  String get agreementParagraph31;

  /// No description provided for @agreementParagraph32.
  ///
  /// In en, this message translates to:
  /// **'6. Privacy and data protection'**
  String get agreementParagraph32;

  /// No description provided for @agreementParagraph33.
  ///
  /// In en, this message translates to:
  /// **'1. Personal information protection'**
  String get agreementParagraph33;

  /// No description provided for @agreementParagraph34.
  ///
  /// In en, this message translates to:
  /// **'We take personal information protection seriously and collect, use, store, and share your information strictly in accordance with the App’s Privacy Policy and applicable laws.'**
  String get agreementParagraph34;

  /// No description provided for @agreementParagraph35.
  ///
  /// In en, this message translates to:
  /// **'2. Acceptance of the Policy'**
  String get agreementParagraph35;

  /// No description provided for @agreementParagraph36.
  ///
  /// In en, this message translates to:
  /// **'Using the App means that you have read and agreed to our Privacy Policy in full. If you disagree with any part of it, stop using the App immediately.'**
  String get agreementParagraph36;

  /// No description provided for @agreementParagraph37.
  ///
  /// In en, this message translates to:
  /// **'7. Disclaimers and limitation of liability'**
  String get agreementParagraph37;

  /// No description provided for @agreementParagraph38.
  ///
  /// In en, this message translates to:
  /// **'1. Services provided as is'**
  String get agreementParagraph38;

  /// No description provided for @agreementParagraph39.
  ///
  /// In en, this message translates to:
  /// **'The App is provided “as is” and “as available.” We make no express or implied warranties regarding its continuity, timeliness, security, accuracy, completeness, or reliability.'**
  String get agreementParagraph39;

  /// No description provided for @agreementParagraph40.
  ///
  /// In en, this message translates to:
  /// **'2. Limitation of liability'**
  String get agreementParagraph40;

  /// No description provided for @agreementParagraph41.
  ///
  /// In en, this message translates to:
  /// **'To the maximum extent permitted by applicable law, we are not liable for any direct, indirect, incidental, special, consequential, or punitive damages resulting from using or being unable to use the App, including lost profits, lost data, or business interruption.'**
  String get agreementParagraph41;

  /// No description provided for @agreementParagraph42.
  ///
  /// In en, this message translates to:
  /// **'3. Third parties'**
  String get agreementParagraph42;

  /// No description provided for @agreementParagraph43.
  ///
  /// In en, this message translates to:
  /// **'We are not responsible for the content, accuracy, legality, or reliability of third-party websites, services, or resources accessed through the App. You assume the risks of using third-party services.'**
  String get agreementParagraph43;

  /// No description provided for @agreementParagraph44.
  ///
  /// In en, this message translates to:
  /// **'8. Breach and remedies'**
  String get agreementParagraph44;

  /// No description provided for @agreementParagraph45.
  ///
  /// In en, this message translates to:
  /// **'1. Handling breaches'**
  String get agreementParagraph45;

  /// No description provided for @agreementParagraph46.
  ///
  /// In en, this message translates to:
  /// **'If you breach this Agreement or applicable laws, we may, without prior notice, issue warnings, restrict, suspend, or terminate access to and use of the App, preserve relevant records, and pursue legal remedies.'**
  String get agreementParagraph46;

  /// No description provided for @agreementParagraph47.
  ///
  /// In en, this message translates to:
  /// **'2. Compensation'**
  String get agreementParagraph47;

  /// No description provided for @agreementParagraph48.
  ///
  /// In en, this message translates to:
  /// **'If your breach of this Agreement or applicable laws causes losses to us or a third party, you shall bear full compensation liability under the law, including direct and indirect losses, lost expected benefits, court costs, and legal fees.'**
  String get agreementParagraph48;

  /// No description provided for @agreementParagraph49.
  ///
  /// In en, this message translates to:
  /// **'9. Termination and consequences'**
  String get agreementParagraph49;

  /// No description provided for @agreementParagraph50.
  ///
  /// In en, this message translates to:
  /// **'1. Our right to terminate'**
  String get agreementParagraph50;

  /// No description provided for @agreementParagraph51.
  ///
  /// In en, this message translates to:
  /// **'For business reasons, we may terminate this Agreement or restrict, suspend, or terminate your access to and use of the App at any time, for any reason, without prior notice.'**
  String get agreementParagraph51;

  /// No description provided for @agreementParagraph52.
  ///
  /// In en, this message translates to:
  /// **'2. Your right to stop using the App'**
  String get agreementParagraph52;

  /// No description provided for @agreementParagraph53.
  ///
  /// In en, this message translates to:
  /// **'You may stop using the App at any time. Stopping use does not terminate this Agreement; provisions on intellectual property, limitation of liability, governing law, and similar matters remain legally effective after you stop using the App.'**
  String get agreementParagraph53;

  /// No description provided for @agreementParagraph54.
  ///
  /// In en, this message translates to:
  /// **'10. Force majeure'**
  String get agreementParagraph54;

  /// No description provided for @agreementParagraph55.
  ///
  /// In en, this message translates to:
  /// **'We are not liable for service interruptions or other defects caused by events beyond our reasonable control, including natural disasters, war, terrorism, government acts, changes in laws or policies, network failures, or hacking.'**
  String get agreementParagraph55;

  /// No description provided for @agreementParagraph56.
  ///
  /// In en, this message translates to:
  /// **'11. Governing law and dispute resolution'**
  String get agreementParagraph56;

  /// No description provided for @agreementParagraph57.
  ///
  /// In en, this message translates to:
  /// **'1. Governing law'**
  String get agreementParagraph57;

  /// No description provided for @agreementParagraph58.
  ///
  /// In en, this message translates to:
  /// **'The formation, effectiveness, performance, interpretation, and dispute resolution of this Agreement are governed by the laws of the People’s Republic of China, excluding, for this Agreement, the laws of Hong Kong, Macao, and Taiwan.'**
  String get agreementParagraph58;

  /// No description provided for @agreementParagraph59.
  ///
  /// In en, this message translates to:
  /// **'2. Dispute resolution'**
  String get agreementParagraph59;

  /// No description provided for @agreementParagraph60.
  ///
  /// In en, this message translates to:
  /// **'Disputes arising from or relating to this Agreement shall first be resolved through amicable consultation. If consultation fails, either party may bring proceedings in the people’s court with jurisdiction where we are based.'**
  String get agreementParagraph60;

  /// No description provided for @agreementParagraph61.
  ///
  /// In en, this message translates to:
  /// **'12. Interpretation'**
  String get agreementParagraph61;

  /// No description provided for @agreementParagraph62.
  ///
  /// In en, this message translates to:
  /// **'Uotan WearBox holds the right of final interpretation of this Agreement. We reserve all rights to interpret, amend, and update it.'**
  String get agreementParagraph62;

  /// No description provided for @agreementParagraph63.
  ///
  /// In en, this message translates to:
  /// **'13. Other provisions'**
  String get agreementParagraph63;

  /// No description provided for @agreementParagraph64.
  ///
  /// In en, this message translates to:
  /// **'1. Entire agreement'**
  String get agreementParagraph64;

  /// No description provided for @agreementParagraph65.
  ///
  /// In en, this message translates to:
  /// **'This Agreement, including the Privacy Policy, constitutes the entire agreement between the parties on its subject matter and supersedes all prior written or oral agreements, commitments, or representations.'**
  String get agreementParagraph65;

  /// No description provided for @agreementParagraph66.
  ///
  /// In en, this message translates to:
  /// **'2. Severability'**
  String get agreementParagraph66;

  /// No description provided for @agreementParagraph67.
  ///
  /// In en, this message translates to:
  /// **'If a court with jurisdiction finds a provision invalid or unenforceable, it shall be limited or removed only to the minimum extent necessary. The validity and enforceability of the remaining provisions are unaffected.'**
  String get agreementParagraph67;

  /// No description provided for @agreementParagraph68.
  ///
  /// In en, this message translates to:
  /// **'3. Waiver'**
  String get agreementParagraph68;

  /// No description provided for @agreementParagraph69.
  ///
  /// In en, this message translates to:
  /// **'Failure or delay by us to exercise a right or remedy under this Agreement does not waive it or affect our ability to exercise it in the future.'**
  String get agreementParagraph69;

  /// No description provided for @agreementParagraph70.
  ///
  /// In en, this message translates to:
  /// **'4. Notices and delivery'**
  String get agreementParagraph70;

  /// No description provided for @agreementParagraph71.
  ///
  /// In en, this message translates to:
  /// **'You agree that we may send notices concerning this Agreement or the App by email, text message, in-app notification, or announcement. Such notices are deemed delivered when sent.'**
  String get agreementParagraph71;

  /// No description provided for @agreementParagraph72.
  ///
  /// In en, this message translates to:
  /// **'14. Contact us'**
  String get agreementParagraph72;

  /// No description provided for @agreementParagraph73.
  ///
  /// In en, this message translates to:
  /// **'If you have questions, comments, or suggestions about this Agreement, contact us at:'**
  String get agreementParagraph73;

  /// No description provided for @agreementParagraph74.
  ///
  /// In en, this message translates to:
  /// **'Email: support@Gnayoah.com'**
  String get agreementParagraph74;

  /// No description provided for @agreementParagraph75.
  ///
  /// In en, this message translates to:
  /// **'We will respond to your request within a reasonable time.'**
  String get agreementParagraph75;

  /// No description provided for @agreementParagraph76.
  ///
  /// In en, this message translates to:
  /// **'Thank you for choosing Uotan WearBox!'**
  String get agreementParagraph76;

  /// No description provided for @deviceValueUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get deviceValueUnknown;

  /// No description provided for @deviceBootloaderLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get deviceBootloaderLocked;

  /// No description provided for @deviceBootloaderUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get deviceBootloaderUnlocked;

  /// No description provided for @deviceMemoryUsage.
  ///
  /// In en, this message translates to:
  /// **'{used}G/{total}G ({percent}% used)'**
  String deviceMemoryUsage(String used, String total, String percent);

  /// No description provided for @deviceUptimeDays.
  ///
  /// In en, this message translates to:
  /// **'{days} d {hours} h {minutes} min'**
  String deviceUptimeDays(String days, String hours, String minutes);

  /// No description provided for @deviceUptimeHours.
  ///
  /// In en, this message translates to:
  /// **'{hours} h {minutes} min'**
  String deviceUptimeHours(String hours, String minutes);

  /// No description provided for @deviceUptimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String deviceUptimeMinutes(String minutes);

  /// No description provided for @flashReady.
  ///
  /// In en, this message translates to:
  /// **'Flash tool ready.'**
  String get flashReady;

  /// No description provided for @flashSelectedFile.
  ///
  /// In en, this message translates to:
  /// **'Selected file: {path}'**
  String flashSelectedFile(String path);

  /// No description provided for @flashSelectedVbmeta.
  ///
  /// In en, this message translates to:
  /// **'Selected vbmeta image: {path}'**
  String flashSelectedVbmeta(String path);

  /// No description provided for @flashSlotParseLog.
  ///
  /// In en, this message translates to:
  /// **'Could not parse current slot from output: {output}'**
  String flashSlotParseLog(String output);

  /// No description provided for @flashActionPartition.
  ///
  /// In en, this message translates to:
  /// **'Flash {partition}'**
  String flashActionPartition(String partition);

  /// No description provided for @flashActionSlot.
  ///
  /// In en, this message translates to:
  /// **'Switch slot {current} → {target}'**
  String flashActionSlot(String current, String target);

  /// No description provided for @flashLogStart.
  ///
  /// In en, this message translates to:
  /// **'Start: {action}'**
  String flashLogStart(String action);

  /// No description provided for @flashLogDone.
  ///
  /// In en, this message translates to:
  /// **'Done: {action}'**
  String flashLogDone(String action);

  /// No description provided for @flashLogFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed: {action} (exit code {code})'**
  String flashLogFailed(String action, String code);
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
