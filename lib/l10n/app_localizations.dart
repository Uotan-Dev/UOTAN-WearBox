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

  /// No description provided for @setting_config.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting_config;

  /// No description provided for @connect_successfully.
  ///
  /// In en, this message translates to:
  /// **'Connected! Keep the device connected and enable USB debugging.'**
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
