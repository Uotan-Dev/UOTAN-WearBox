import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> with SingleTickerProviderStateMixin {
  String currentQrCodeUrl = 'https://wear.gnayoah.com/donate/alipay3.png'; // 初始化默认的二维码图片链接
  String selectedAmount = '3.00元'; // 初始化默认选中的金额
  String currentPaymentMethod = 'alipay'; // 当前支付方式，初始化为支付宝

  late TabController _tabController;

  // 按钮对应的二维码链接
  final Map<String, String> qrCodeUrls = {
    '3.00元': '3',
    '6.00元': '6',
    '9.00元': '9',
    '12.00元': '12',
    '15.00元': '15',
    '自定义': '',
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 创建 TabController
    _tabController.addListener(() {
      setState(() {
        // 切换支付方式时更新支付方式
        currentPaymentMethod = _tabController.index == 0 ? 'alipay' : 'wx';
        _updateQrCodeUrl(); // 更新二维码URL
      });
    });
  }

  void _updateQrCodeUrl() {
    final code = qrCodeUrls[selectedAmount];
    if (code != null && code.isNotEmpty) {
      currentQrCodeUrl = 'https://wear.gnayoah.com/donate/${currentPaymentMethod}${code}.png';
    } else {
      currentQrCodeUrl = 'https://wear.gnayoah.com/donate/${currentPaymentMethod}.png'; // 自定义二维码
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0), // 设置 AppBar 的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 40), // 设置顶部边距
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
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20), // 返回图标
                        onPressed: () {
                          Navigator.pop(context); // 返回到上一个页面
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '支持我们', // 页面标题
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'MiSansLight', // 使用自定义字体
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
        
        padding: const EdgeInsets.all(25.0), // 设置页面内边距
        
        child: Row(
          
          children: [
           
            Expanded(
              
              flex: 2, // 设置按钮部分所占比例
              child: GridView.count(
                crossAxisCount: 2, // 两列
                crossAxisSpacing: 10, // 列间距
                mainAxisSpacing: 10, // 行间距
                childAspectRatio: 3, // 按钮的宽高比，设置为较宽的比例
                children: qrCodeUrls.keys.map((buttonLabel) {
                    
                  return Card(
                    
                    color: const Color(0xFFF9F9F9), // 设置卡片背景颜色
                    elevation: 0, // 去掉阴影
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // 圆角效果
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedAmount = buttonLabel; // 更新选中的金额
                          _updateQrCodeUrl(); // 更新二维码URL
                        });
                      },
                      
                      child: Center(
                        
                        child: Text(
                          buttonLabel,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 20), // 左右部分的间距
            Expanded(
              flex: 1, // 设置二维码部分所占比例
              child: Column(
                
                children: [
                   
                  Container(
                    width: 180,
                  child: Card(
                    
                    color: const Color(0xFFF9F9F9), // 设置卡片背景颜色
                    elevation: 0, // 去掉阴影
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0), // 圆角效果
                    ),
                   child: InkWell(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0), // 添加上下和左右的内边距
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F9F9), // 设置 TabBar 背景颜色
                              borderRadius: BorderRadius.circular(8.0), // 设置圆角效果
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: const BoxDecoration(
                                color: Colors.white, // 选中的标签背景颜色
                                borderRadius: BorderRadius.all(Radius.circular(8.0)), // 圆角效果
                              ),
                              indicatorSize: TabBarIndicatorSize.tab, // 设置指示器大小与整个Tab等宽
                              indicatorPadding: EdgeInsets.zero, // 移除指示器内边距
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.transparent, // 去除下划线
                              dividerHeight: 0,
    tabs: [
      Container(
        height: 26, // 设置固定高度
        alignment: Alignment.center,
        child: const Text('  支付宝  '),
      ),
      Container(
        height: 26, // 设置固定高度
        alignment: Alignment.center,
        child: const Text('  微信  '),
      ),
    ],
  ),
),

                      ),
                    ),
                  ),
                  ),
                  // 将 TabBar 移动到二维码上方并自定义样式
                 
                  const SizedBox(height: 10), // 添加一些间距
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircularProgressIndicator(
                         color: Colors.black, // 进度条颜色设置为黑色
                      ), // 在加载图片时显示进度条

                      Image.network(
                        currentQrCodeUrl, // 根据按钮点击事件更换二维码图片
                        width: 200, // 固定宽度
                        height: 200, // 固定高度，确保是正方形
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const SizedBox(); // 如果正在加载则返回空盒子，只显示加载动画
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '￥${selectedAmount.replaceAll('元', '')}',
                    style: const TextStyle(fontSize: 18),
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
