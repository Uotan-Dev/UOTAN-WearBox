class AdbDeviceInfo {
  final String deviceId;
  final String brand;
  final String model;
  final String memory; // 内存信息
  final String storage; // 储存信息
  final String androidVersion; // 安卓版本信息，包括API级别
  final String apiLevel; // API级别
  final String patchDate;
  final String softwareVersion;
  final String kernelVersion; // 内核版本
  final String batteryLevel;
  final String batteryHealth;
  final String batteryVoltage;
  final String batteryTemperature; // 电池温度
  final String resolution; // 分辨率
  final String dpi; // DPI
  final String bootloaderStatus; // Bootloader锁状态
  final String uptime; // 开机时间
  final String cpuArch; // CPU架构

  AdbDeviceInfo({
    required this.deviceId,
    required this.brand,
    required this.model,
    required this.memory,
    required this.storage,
    required this.androidVersion,
    required this.apiLevel,
    required this.patchDate,
    required this.softwareVersion,
    required this.kernelVersion,
    required this.batteryLevel,
    required this.batteryHealth,
    required this.batteryVoltage,
    required this.batteryTemperature,
    required this.resolution,
    required this.dpi,
    required this.bootloaderStatus,
    required this.uptime,
    required this.cpuArch,
  });
}
