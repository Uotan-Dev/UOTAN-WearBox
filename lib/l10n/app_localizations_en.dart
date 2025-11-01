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
  String get setting_config => 'Settings';

  @override
  String get connect_successfully => 'Connected! Keep the device connected and enable USB debugging.';
}
