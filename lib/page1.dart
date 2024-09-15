import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'adb_device_info.dart';
import 'tutorial.dart';

class Page1 extends StatelessWidget {
  final List<AdbDeviceInfo> devices;

  const Page1({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(), // 允许拖动窗口
            child: Container(
              color: Colors.transparent, // 设置为透明背景
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右对齐
                children: [
                  Row(
                    children: [
                      Image.asset('assets/logo.png'), // 增大Logo的尺寸
                    ],
                  ),
                  Row(
                    children: [
                      // 最小化按钮
                      IconButton(
                        icon: Image.asset('assets/mini.png'),
                        onPressed: () {
                          windowManager.minimize();
                        },
                      ),
                      // 关闭按钮
                      IconButton(
                        icon: Image.asset('assets/close.png'),
                        onPressed: () {
                          windowManager.close();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: devices.isEmpty
            ? _buildNoDeviceConnected(context) // 传递 context 参数
            : _buildDeviceInfo(context, devices[0]),
      ),
    );
  }

 // 构建设备未连接时的说明卡片
Widget _buildNoDeviceConnected(BuildContext context) {
  final greeting = _getGreetingBasedOnTime(); // 根据时间获取问候语

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 0),
      Padding(
        padding: const EdgeInsets.only(left: 5.0), // 设置左边距
        child: Text(
          '$greeting\n欢迎使用柚坛手表助手',
          style: const TextStyle(
            fontSize: 34,
            fontFamily: 'OPPOSansMed',
            height: 1.25,
          ),
        ),
      ),
      const SizedBox(height: 6),
      const Padding(
        padding: EdgeInsets.only(left: 5.0), // 设置左边距
        child: Text(
          '未检测到手表, 请根据下方指引连接手表',
          style: TextStyle(fontSize: 16),
        ),
      ),
      
      const SizedBox(height: 15),


      
      Card(
        color: const Color(0xFFF9F9F9),  // 设置背景颜色为浅灰色
        elevation: 0, // 可选：去除阴影效果或根据需要设置
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '支持的连接方式：',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. 使用数据线/充电底座连接电脑与手表（推荐）',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    '2. 使用无线连接，请点击',
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 无线连接点击事件
                    },
                    child: const Text(
                      ' 无线连接',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(13, 143, 250, 1),
                      ),
                    ),
                  ),
                  const Text(
                    ' 进行无线局域网或蓝牙连接',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                '若无法连接请尝试：',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    '1. 检查手表是否开启 USB 调试',
                    style: TextStyle(fontSize: 15),
                  ),
                 MouseRegion(
  cursor: SystemMouseCursors.click, // 设置鼠标光标为点击手的图标
  child: GestureDetector(
    onTap: () {
      // 导航到教程页面
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TutorialPage()),
      );
    },
    child: const Text(
      ' 查看教程',
      style: TextStyle(
        fontSize: 15,
        color: Colors.blue,
      ),
    ),
  ),
),

                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    '2. 检查 ADB 驱动是否安装',
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 安装驱动点击事件
                    },
                    child: const Text(
                      ' 安装驱动',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              
              const Text(
                '3. 重新下载安装此应用，并检查应用版本更新',
                style: TextStyle(fontSize: 15),
              ),
             const SizedBox(height: 10),
              
              const Text(
                '4. 重新启动计算机、更换电脑或数据线并再次尝试连接',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

// 根据当前时间获取问候语
  String _getGreetingBasedOnTime() {
    final now = DateTime.now(); // 获取当前时间
    final hour = now.hour; // 获取当前的小时

    if (hour >= 0 && hour < 6) {
      return '凌晨好';
    } else if (hour >= 6 && hour < 12) {
      return '早上好';
    } else if (hour >= 12 && hour < 18) {
      return '下午好';
    } else {
      return '晚上好';
    }
  }


  // 构建设备连接时的界面
  Widget _buildDeviceInfo(BuildContext context, AdbDeviceInfo device) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' ${device.model}',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        const Text(
          ' 已成功连接！请保持设备连接并开启USB调试',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        buildBasicInfoCard(context, '基本信息', [
          ['品牌: ${device.brand}', '分辨率: ${device.resolution}'],
          ['型号: ${device.model}', 'DPI: ${device.dpi}'],
          ['序列号: ${device.deviceId}', '内存: ${device.memory}'],
          ['开机时间: ${device.uptime}', '储存: ${device.storage}'],
          ['BL锁: ${device.bootloaderStatus}', '架构: ${device.cpuArch}'],
        ]),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: buildInfoCard('电池状况', [
                '电量: ${device.batteryLevel}%',
                '健康: ${device.batteryHealth}',
                '电压: ${device.batteryVoltage}mV',
                '温度: ${device.batteryTemperature}°C',
              ]),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: buildInfoCard('系统版本', [
                '安卓版本: ${device.androidVersion}',
                '补丁日期: ${device.patchDate}',
                '系统版本: ${device.softwareVersion}',
                '内核版本: ${device.kernelVersion}', // 显示内核版本
              ]),
            ),
          ],
        ),
      ],
    );
  }

  // 基本信息卡片
  Widget buildBasicInfoCard(BuildContext context, String title, List<List<String>> info) {
    return Card(
      color: const Color(0xFFF9F9F9),  // 设置背景颜色为浅灰色
      elevation: 0, // 可选：去除阴影效果或根据需要设置
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...info.map((pair) => Row(
              children: [
                Expanded(
                  child: Text(
                    pair[0],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    pair[1],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  // 信息卡片
  Widget buildInfoCard(String title, List<String> info) {
    return Card(
      color: const Color(0xFFF9F9F9),  // 设置背景颜色为浅灰色
      elevation: 0, // 可选：去除阴影效果或根据需要设置
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (var item in info)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
