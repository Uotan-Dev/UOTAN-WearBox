import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
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
  /// **'Re-pair'**
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
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
