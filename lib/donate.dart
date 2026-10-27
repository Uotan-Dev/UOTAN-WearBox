import 'app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:window_manager/window_manager.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage>
    with SingleTickerProviderStateMixin {
  static const Map<String, String> _qrCodeSuffixes = {
    '3': '3',
    '6': '6',
    '9': '9',
    '12': '12',
    '15': '15',
    'custom': '',
  };

  late TabController _tabController;
  String currentPaymentMethod = 'alipay';
  String selectedAmountCode = '3';
  String currentQrCodeUrl = 'https://wear.gnayoah.com/donate/alipay3.png';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _checkNetworkConnection();
        currentPaymentMethod = _tabController.index == 0 ? 'alipay' : 'wx';
        _updateQrCodeUrl();
      });
    });
  }

  Future<void> _checkNetworkConnection() async {
    try {
      final response = await http.get(Uri.parse('https://wear.gnayoah.com'));
      if (response.statusCode != 200) {
        _showNoNetworkDialog();
      }
    } catch (e) {
      _showNoNetworkDialog();
    }
  }

  void _showNoNetworkDialog() {
    final l10n = context.l10n;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.palette.surface,
          title: Text(l10n.donationNetworkErrorTitle),
          content: Text(l10n.donationNetworkErrorBody),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return context.palette.button;
                    }
                    return null;
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(context.palette.text),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(this.context);
              },
              child: Text(l10n.dialogConfirm,
                  style: TextStyle(color: context.palette.text)),
            ),
          ],
        );
      },
    );
  }

  void _updateQrCodeUrl() {
    final suffix = _qrCodeSuffixes[selectedAmountCode] ?? '';
    if (suffix.isNotEmpty) {
      currentQrCodeUrl =
          'https://wear.gnayoah.com/donate/${currentPaymentMethod}$suffix.png';
    } else {
      currentQrCodeUrl =
          'https://wear.gnayoah.com/donate/$currentPaymentMethod.png';
    }
  }

  List<_DonationOption> _buildDonationOptions(AppLocalizations l10n) {
    return [
      _DonationOption(
          code: '3',
          label: l10n.donationAmountLabel('3.00'),
          summary: l10n.donationSelectedAmount('3.00')),
      _DonationOption(
          code: '6',
          label: l10n.donationAmountLabel('6.00'),
          summary: l10n.donationSelectedAmount('6.00')),
      _DonationOption(
          code: '9',
          label: l10n.donationAmountLabel('9.00'),
          summary: l10n.donationSelectedAmount('9.00')),
      _DonationOption(
          code: '12',
          label: l10n.donationAmountLabel('12.00'),
          summary: l10n.donationSelectedAmount('12.00')),
      _DonationOption(
          code: '15',
          label: l10n.donationAmountLabel('15.00'),
          summary: l10n.donationSelectedAmount('15.00')),
      _DonationOption(
          code: 'custom',
          label: l10n.donationAmountCustom,
          summary: l10n.donationSelectedAmountCustom),
    ];
  }

  String _selectedAmountSummary(AppLocalizations l10n) {
    final options = _buildDonationOptions(l10n);
    final match = options.firstWhere(
      (option) => option.code == selectedAmountCode,
      orElse: () => options.first,
    );
    return match.summary;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final donationOptions = _buildDonationOptions(l10n);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: context.palette.text, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.donationTitle,
                        style: TextStyle(
                          color: context.palette.text,
                          fontSize: 26,
                          fontFamily: 'MiSansLight',
                        ),
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
        padding:
            const EdgeInsets.only(top: 25.0, right: 25, bottom: 25, left: 28),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    l10n.donationChooseAmountLabel,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3,
                      children: donationOptions.map((option) {
                        final isSelected = option.code == selectedAmountCode;
                        return Card(
                          color: context.palette.surface,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: () {
                              setState(() {
                                selectedAmountCode = option.code;
                                _updateQrCodeUrl();
                              });
                            },
                            child: Center(
                              child: Text(
                                option.label,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 180,
                    child: Card(
                      color: context.palette.surface,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: InkWell(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              color: context.palette.surface,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: BoxDecoration(
                                color: context.palette.field,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: EdgeInsets.zero,
                              labelColor: context.palette.text,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.transparent,
                              dividerColor: Colors.transparent,
                              tabs: [
                                Container(
                                  height: 26,
                                  alignment: Alignment.center,
                                  child: Text(l10n.donationPaymentAlipay),
                                ),
                                Container(
                                  height: 26,
                                  alignment: Alignment.center,
                                  child: Text(l10n.donationPaymentWeChat),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12), // 添加一些间距
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: context.palette.text, // 进度条颜色设置为黑色
                      ), // 在加载图片时显示进度条
                      Image.network(
                        currentQrCodeUrl, // 根据按钮点击事件更换二维码图片
                        width: 155, // 固定宽度
                        height: 155, // 固定高度，确保是正方形
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const SizedBox(); // 如果正在加载则返回空盒子，只显示加载动画
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _selectedAmountSummary(l10n),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.donationThanksMessage,
                    style: TextStyle(
                      fontSize: 14,
                      color: context.palette.textSecondary,
                      fontFamily: 'MiSansLight',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DonationOption {
  const _DonationOption({
    required this.code,
    required this.label,
    required this.summary,
  });

  final String code;
  final String label;
  final String summary;
}
