import 'dart:async';
import 'dart:io';
import 'adb_device_info.dart';

// 检查ADB设备的函数
void checkAdbDevicesPeriodically({
  required Function(void Function()) setState,
  required Function(List<AdbDeviceInfo>) onDevicesUpdated,
}) {
  Timer.periodic(const Duration(seconds: 3), (timer) async {
    try {
      ProcessResult result = await Process.run('adb', ['devices']);
      String output = result.stdout;

      if (output.contains('device')) {
        List<AdbDeviceInfo> devices = [];
        List<String> lines = output.split('\n');
        for (String line in lines) {
          if (line.contains('\tdevice')) {
            String deviceId = line.split('\t')[0];

            // 获取设备的详细信息
            String brand = await getAdbDeviceProperty(deviceId, 'ro.product.brand');
            String model = await getAdbDeviceProperty(deviceId, 'ro.product.model');
            String serial = await getAdbDeviceProperty(deviceId, 'ro.serialno');
            String memory = await getMemoryInfo(deviceId); // 获取内存信息
            String storage = await getStorageInfo(deviceId); // 获取存储信息
            String androidVersion = await getAdbDeviceProperty(deviceId, 'ro.build.version.release');
            String apiLevel = await getAdbDeviceProperty(deviceId, 'ro.build.version.sdk'); // 获取API级别
            String patchDate = await getAdbDeviceProperty(deviceId, 'ro.build.version.security_patch');
            String softwareVersion = await getAdbDeviceProperty(deviceId, 'ro.build.version.incremental');
            String cpuArch = await getAdbDeviceProperty(deviceId, 'ro.product.cpu.abi'); // 获取CPU架构

            // 新增的设备信息
            String resolution = await getAdbShellOutput(deviceId, 'wm size'); // 获取分辨率
            String dpi = await getAdbShellOutput(deviceId, 'wm density'); // 获取DPI
            String bootloaderStatusRaw = await getAdbDeviceProperty(deviceId, 'ro.boot.verifiedbootstate'); // 获取Bootloader锁状态
            String bootloaderStatus = mapBootloaderStatus(bootloaderStatusRaw); // 映射为易读的状态
            String uptime = await getAdbShellOutput(deviceId, 'uptime'); // 获取开机时间
            String kernelVersionRaw = await getAdbShellOutput(deviceId, 'uname -r'); // 获取内核版本
            String kernelVersion = kernelVersionRaw.split('-')[0]; // 只保留第一个“-”前面的版本号

            // 获取电池信息
            String batteryLevel = await getAdbShellOutput(deviceId, 'dumpsys battery | grep level');
            String batteryHealthRaw = await getAdbShellOutput(deviceId, 'dumpsys battery | grep health');
            String batteryHealth = mapBatteryHealth(batteryHealthRaw.split(":").last.trim());
            String batteryVoltage = await getAdbShellOutput(deviceId, 'dumpsys battery | grep voltage');
            String batteryTemperatureRaw = await getAdbShellOutput(deviceId, 'dumpsys battery | grep temperature');
            String batteryTemperature = (int.parse(batteryTemperatureRaw.split(":").last.trim()) / 10).toStringAsFixed(1); // 转换为摄氏度并保留1位小数

            // 将API级别与安卓版本号组合
            String fullAndroidVersion = '$androidVersion ($apiLevel)';

            devices.add(AdbDeviceInfo(
              deviceId: serial,
              brand: brand,
              model: model,
              memory: memory,
              storage: storage,
              androidVersion: fullAndroidVersion, // 使用组合后的安卓版本和API级别
              apiLevel: apiLevel,
              patchDate: patchDate,
              softwareVersion: softwareVersion,
              kernelVersion: kernelVersion,
              batteryLevel: batteryLevel.split(":").last.trim(),
              batteryHealth: batteryHealth,
              batteryVoltage: batteryVoltage.split(":").last.trim(),
              batteryTemperature: batteryTemperature,
              resolution: resolution.split(":").last.trim(),
              dpi: dpi.split(":").last.trim(),
              bootloaderStatus: bootloaderStatus,
              uptime: uptime.split("up ").last.split(",")[0].trim(),
              cpuArch: cpuArch,
            ));
          }
        }
        onDevicesUpdated(devices);
      } else {
        print('没有ADB设备连接');
        onDevicesUpdated([]);
      }
    } catch (e) {
      print('无法执行ADB命令：$e');
    }
  });
}

// 获取ADB设备属性
Future<String> getAdbDeviceProperty(String deviceId, String property) async {
  try {
    ProcessResult result = await Process.run('adb', ['-s', deviceId, 'shell', 'getprop', property]);
    return result.stdout.toString().trim();
  } catch (e) {
    print('无法获取设备属性：$e');
    return 'Unknown';
  }
}

// 获取内存信息
Future<String> getMemoryInfo(String deviceId) async {
  try {
    ProcessResult result = await Process.run('adb', ['-s', deviceId, 'shell', 'cat /proc/meminfo']);
    String output = result.stdout.toString();
    var totalMem = int.parse(RegExp(r'MemTotal:\s+(\d+) kB').firstMatch(output)?.group(1) ?? '0');
    
    var freeMem = int.parse(RegExp(r'MemAvailable:\s+(\d+) kB').firstMatch(output)?.group(1) ?? '0');
    var usedMem = (totalMem - freeMem) ~/ 1024 ~/ 1024; // 转换为MB

    totalMem = totalMem  ~/ 1024~/ 1024; // 转换为MB
    var per = usedMem * 100 ~/ totalMem;

    return '$usedMem' 'G/$totalMem' 'G ($per% used)';
  } catch (e) {
    print('无法获取内存信息：$e');
    return 'Unknown';
  }
}

// 获取存储信息
Future<String> getStorageInfo(String deviceId) async {
  try {
    ProcessResult result = await Process.run('adb', ['-s', deviceId, 'shell', 'df -h /data']);
    String output = result.stdout.toString();
    List<String> lines = output.split('\n');

    for (var line in lines) {
      if (line.contains('/data')) {
        var parts = line.split(RegExp(r'\s+'));
        
        if (parts.length >= 5) {
          String usedStorage = parts[2]; // 已用存储
          
          String totalStorage = parts[1]; // 总共存储

          return '$usedStorage/$totalStorage';
        }
      }
    }
    return 'Unknown';
  } catch (e) {
    print('无法获取存储信息：$e');
    return 'Unknown';
  }
}

// 运行ADB shell命令
Future<String> getAdbShellOutput(String deviceId, String command) async {
  try {
    ProcessResult result = await Process.run('adb', ['-s', deviceId, 'shell', command]);
    return result.stdout.toString().trim();
  } catch (e) {
    print('无法获取设备shell信息：$e');
    return 'Unknown';
  }
}

// 映射电池健康状态
String mapBatteryHealth(String healthCode) {
  switch (healthCode.trim()) {
    case '2':
      return '良好 (2)';
    case '3':
      return '过热 (3)';
    case '4':
      return '无用的 (4)';
    case '5':
      return '超压 (5)';
    case '7':
      return '温度过低 (7)';
    default:
      return '未知 ($healthCode)';
  }
}

// 映射Bootloader锁状态
String mapBootloaderStatus(String status) {
  switch (status.toLowerCase()) {
    case 'green':
      return 'unlocked';
    case 'yellow':
      return 'unlocked';
    case 'orange':
      return 'unlocked';
    case 'red':
      return 'unlocked';
    default:
      return 'unknown';
  }
}
