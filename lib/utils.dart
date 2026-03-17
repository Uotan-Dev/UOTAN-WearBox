import 'dart:async';
import 'dart:io';

import 'adb_device_info.dart';

void checkAdbDevicesPeriodically({
  required Function(void Function()) setState,
  required Function(List<AdbDeviceInfo>) onDevicesUpdated,
}) {
  Timer.periodic(const Duration(seconds: 3), (timer) async {
    try {
      final ProcessResult result = await Process.run('adb', <String>['devices']);
      final String output = result.stdout.toString();

      if (output.contains('device')) {
        final List<AdbDeviceInfo> devices = <AdbDeviceInfo>[];
        final List<String> lines = output.split('\n');

        for (final String line in lines) {
          if (!line.contains('\tdevice')) {
            continue;
          }
          final String deviceId = line.split('\t')[0];

          final String brand =
              await getAdbDeviceProperty(deviceId, 'ro.product.brand');
          final String model =
              await getAdbDeviceProperty(deviceId, 'ro.product.model');
          final String serial =
              await getAdbDeviceProperty(deviceId, 'ro.serialno');
          final String memory = await getMemoryInfo(deviceId);
          final String storage = await getStorageInfo(deviceId);
          final String androidVersion =
              await getAdbDeviceProperty(deviceId, 'ro.build.version.release');
          final String apiLevel =
              await getAdbDeviceProperty(deviceId, 'ro.build.version.sdk');
          final String patchDate = await getAdbDeviceProperty(
              deviceId, 'ro.build.version.security_patch');
          final String softwareVersion = await getAdbDeviceProperty(
              deviceId, 'ro.build.version.incremental');
          final String cpuArch =
              await getAdbDeviceProperty(deviceId, 'ro.product.cpu.abi');

          final String resolution = await getAdbShellOutput(deviceId, 'wm size');
          final String dpi = await getAdbShellOutput(deviceId, 'wm density');
          final String bootloaderStatusRaw = await getAdbDeviceProperty(
              deviceId, 'ro.boot.verifiedbootstate');
          final String bootloaderStatus = mapBootloaderStatus(bootloaderStatusRaw);
          final String uptime = await getAdbShellOutput(deviceId, 'uptime');
          final String kernelVersionRaw =
              await getAdbShellOutput(deviceId, 'uname -r');
          final String kernelVersion = kernelVersionRaw.split('-')[0];

          final String batteryLevel =
              await getAdbShellOutput(deviceId, 'dumpsys battery | grep level');
          final String batteryHealthRaw =
              await getAdbShellOutput(deviceId, 'dumpsys battery | grep health');
          final String batteryHealth =
              mapBatteryHealth(batteryHealthRaw.split(':').last.trim());
          final String batteryVoltage =
              await getAdbShellOutput(deviceId, 'dumpsys battery | grep voltage');
          final String batteryTemperatureRaw = await getAdbShellOutput(
              deviceId, 'dumpsys battery | grep temperature');

          final int tempRaw =
              int.tryParse(batteryTemperatureRaw.split(':').last.trim()) ?? 0;
          final String batteryTemperature =
              (tempRaw / 10).toStringAsFixed(1);

          final String fullAndroidVersion = '$androidVersion ($apiLevel)';

          devices.add(
            AdbDeviceInfo(
              deviceId: serial,
              brand: brand,
              model: model,
              memory: memory,
              storage: storage,
              androidVersion: fullAndroidVersion,
              apiLevel: apiLevel,
              patchDate: patchDate,
              softwareVersion: softwareVersion,
              kernelVersion: kernelVersion,
              batteryLevel: batteryLevel.split(':').last.trim(),
              batteryHealth: batteryHealth,
              batteryVoltage: batteryVoltage.split(':').last.trim(),
              batteryTemperature: batteryTemperature,
              resolution: resolution.split(':').last.trim(),
              dpi: dpi.split(':').last.trim(),
              bootloaderStatus: bootloaderStatus,
              uptime: uptime.split('up ').last.split(',')[0].trim(),
              cpuArch: cpuArch,
            ),
          );
        }
        onDevicesUpdated(devices);
      } else {
        print('No adb devices connected');
        onDevicesUpdated(<AdbDeviceInfo>[]);
      }
    } catch (e) {
      print('Failed to run adb command: $e');
    }
  });
}

Future<String> getAdbDeviceProperty(String deviceId, String property) async {
  try {
    final ProcessResult result = await Process.run(
      'adb',
      <String>['-s', deviceId, 'shell', 'getprop', property],
    );
    return result.stdout.toString().trim();
  } catch (e) {
    print('Failed to get device property: $e');
    return 'Unknown';
  }
}

Future<String> getMemoryInfo(String deviceId) async {
  try {
    final ProcessResult result = await Process.run(
      'adb',
      <String>['-s', deviceId, 'shell', 'cat', '/proc/meminfo'],
    );
    final String output = result.stdout.toString();

    int totalMem = int.parse(
      RegExp(r'MemTotal:\s+(\d+) kB').firstMatch(output)?.group(1) ?? '0',
    );
    final int availableMem = int.parse(
      RegExp(r'MemAvailable:\s+(\d+) kB').firstMatch(output)?.group(1) ?? '0',
    );

    if (totalMem <= 0) {
      return 'Unknown';
    }

    final int usedMem = (totalMem - availableMem) ~/ 1024 ~/ 1024;
    totalMem = totalMem ~/ 1024 ~/ 1024;
    final int percent = usedMem * 100 ~/ totalMem;

    return '${usedMem}G/${totalMem}G ($percent% used)';
  } catch (e) {
    print('Failed to get memory info: $e');
    return 'Unknown';
  }
}

Future<String> getStorageInfo(String deviceId) async {
  try {
    final List<List<String>> commands = <List<String>>[
      <String>['-s', deviceId, 'shell', 'df', '-k', '/data'],
      <String>['-s', deviceId, 'shell', 'df', '-k', '/storage/emulated'],
      <String>['-s', deviceId, 'shell', 'df', '-h', '/data'],
    ];

    for (final List<String> command in commands) {
      final ProcessResult result = await Process.run('adb', command);
      final String parsed = _parseStorageFromDfOutput(result.stdout.toString());
      if (parsed != 'Unknown') {
        return parsed;
      }
    }

    return 'Unknown';
  } catch (e) {
    print('Failed to get storage info: $e');
    return 'Unknown';
  }
}

String _parseStorageFromDfOutput(String output) {
  final List<String> lines = output
      .split('\n')
      .map((String line) => line.trim())
      .where((String line) => line.isNotEmpty)
      .toList();

  List<String> candidates = lines
      .where((String line) =>
          !line.toLowerCase().startsWith('filesystem') &&
          (line.contains('/data') || line.contains('/storage/emulated')))
      .toList();
  if (candidates.isEmpty) {
    candidates = lines
        .where((String line) => !line.toLowerCase().startsWith('filesystem'))
        .toList();
  }

  for (final String line in candidates) {

    final List<String> parts =
        line.split(RegExp(r'\s+')).where((String s) => s.isNotEmpty).toList();
    if (parts.length < 4) {
      continue;
    }

    final int? totalKb = int.tryParse(parts[1]);
    final int? usedKb = int.tryParse(parts[2]);

    if (totalKb != null && usedKb != null) {
      return '${_formatKbToGb(usedKb)}/${_formatKbToGb(totalKb)}';
    }

    if (parts.length >= 6) {
      final String total = parts[1];
      final String used = parts[2];
      if (RegExp(r'\d').hasMatch(total) && RegExp(r'\d').hasMatch(used)) {
        return '$used/$total';
      }
    }
  }

  return 'Unknown';
}

String _formatKbToGb(int kb) {
  const double kbPerGb = 1024 * 1024;
  return '${(kb / kbPerGb).toStringAsFixed(2)}G';
}

Future<String> getAdbShellOutput(String deviceId, String command) async {
  try {
    final ProcessResult result = await Process.run(
      'adb',
      <String>['-s', deviceId, 'shell', command],
    );
    return result.stdout.toString().trim();
  } catch (e) {
    print('Failed to get shell output: $e');
    return 'Unknown';
  }
}

String mapBatteryHealth(String healthCode) {
  switch (healthCode.trim()) {
    case '2':
      return '良好 (2)';
    case '3':
      return '过热 (3)';
    case '4':
      return '无用 (4)';
    case '5':
      return '超压 (5)';
    case '7':
      return '温度过低 (7)';
    default:
      return '未知 ($healthCode)';
  }
}

String mapBootloaderStatus(String status) {
  switch (status.toLowerCase()) {
    case 'green':
    case 'yellow':
    case 'orange':
    case 'red':
      return 'unlocked';
    default:
      return 'unknown';
  }
}
