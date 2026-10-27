import 'app_localizations.dart';

/// Device output stays language-neutral until it is displayed, so changing the
/// app language also updates values already loaded from ADB.
String localizeDeviceValue(AppLocalizations l10n, String value) {
  return value.toLowerCase() == 'unknown' ? l10n.deviceValueUnknown : value;
}

String localizeBatteryHealth(AppLocalizations l10n, String code) {
  switch (code.trim()) {
    case '2':
      return l10n.batteryHealthGood;
    case '3':
      return l10n.batteryHealthOverheat;
    case '4':
      return l10n.batteryHealthDead;
    case '5':
      return l10n.batteryHealthOverVoltage;
    case '6':
      return l10n.batteryHealthFailure;
    case '7':
      return l10n.batteryHealthCold;
    case '-':
    case '--':
      return code;
    case '':
    case 'Unknown':
      return l10n.deviceValueUnknown;
    default:
      return l10n.batteryHealthUnknown(code);
  }
}

String localizeBootloaderStatus(AppLocalizations l10n, String status) {
  switch (status) {
    case 'locked':
      return l10n.deviceBootloaderLocked;
    case 'unlocked':
      return l10n.deviceBootloaderUnlocked;
    default:
      return localizeDeviceValue(l10n, status);
  }
}

String localizeMemoryUsage(AppLocalizations l10n, String value) {
  final match = RegExp(r'^(\d+)G/(\d+)G \((\d+)%\)$').firstMatch(value);
  if (match == null) return localizeDeviceValue(l10n, value);
  return l10n.deviceMemoryUsage(match[1]!, match[2]!, match[3]!);
}

String localizeUptime(AppLocalizations l10n, String value) {
  final days = RegExp(r'^(\d+) days?').firstMatch(value);
  final clock = RegExp(r'(\d+):(\d+)').firstMatch(value);
  final minutes = RegExp(r'(\d+) min').firstMatch(value);
  if (days != null) {
    return l10n.deviceUptimeDays(
        days[1]!, clock?[1] ?? '0', clock?[2] ?? minutes?[1] ?? '0');
  }
  if (clock != null) return l10n.deviceUptimeHours(clock[1]!, clock[2]!);
  if (minutes != null) return l10n.deviceUptimeMinutes(minutes[1]!);
  return localizeDeviceValue(l10n, value);
}
