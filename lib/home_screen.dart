import 'app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watch_assistant/utils.dart';
import 'package:watch_assistant/l10n/l10n.dart';
import 'package:window_manager/window_manager.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'adb_device_info.dart';
import 'platform_support.dart';
import 'app_sidebar.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page_transition.dart';
import 'store_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onLocaleChanged,
    required this.locale,
    required this.onThemeModeChanged,
    required this.themeMode,
  });

  final ValueChanged<Locale?> onLocaleChanged;
  final Locale? locale;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final ThemeMode themeMode;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WindowListener {
  int _selectedIndex = 0;
  List<AdbDeviceInfo> _devices = []; // 用于存储设备信息
  double currentVersion = 17.0; // 当前应用版本号
  bool _isCheckingUpdate = true; // 是否正在检查更新的状态

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    checkAdbDevicesPeriodically(
      setState: setState,
      onDevicesUpdated: (devices) {
        setState(() {
          _devices = devices;
        });
      },
    );
    _checkNetworkAndUpdate(); // 初始化时检查网络和版本更新
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    _pageController?.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [];

  // 检查网络连接并访问URL
  Future<void> _checkNetworkAndUpdate() async {
    await Future.delayed(const Duration(milliseconds: 500)); // 修改延迟为0.5秒
    setState(() {
      _isCheckingUpdate = true; // 开始检查时显示进度条
    });

    try {
      // 尝试发送请求到 wear.gnayoah.com
      final response = await http.get(Uri.parse('https://wear.gnayoah.com'));
      if (response.statusCode == 200) {
        // 网站访问正常，继续检查版本更新
        await _checkForUpdates();
      } else {
        // 无法访问，显示错误提示
        _showNoNetworkDialog();
      }
    } catch (e) {
      // 捕获异常，显示网络错误提示
      _showNoNetworkDialog();
    } finally {
      setState(() {
        _isCheckingUpdate = false; // 检查完成后隐藏进度条
      });
    }
  }

  Future<void> _refreshDevicesNow() async {
    try {
      final List<AdbDeviceInfo> devices = await fetchAdbDevices();
      if (!mounted) {
        return;
      }
      setState(() {
        _devices = devices;
      });
    } catch (e) {
      print('Failed to refresh devices: $e');
    }
  }

  // 检查远程版本号是否最新，有新版本时弹出更新提示
  Future<UpdateCheckResult> _checkForUpdates() async {
    try {
      final response = await http.get(
        Uri.parse('https://wear.gnayoah.com/version/windows.txt'),
      );

      if (response.statusCode == 200) {
        final lines = response.body.split('\n');
        double _safeParseDouble(String s) {
          return double.tryParse(s) ?? 0.0;
        }

// 使用
        final remoteVersion = _safeParseDouble(
          lines
              .firstWhere((line) => line.startsWith('[version]'))
              .replaceAll('[version]', '')
              .trim(),
        );

        final releaseDate = lines
            .firstWhere((line) => line.startsWith('[date]'))
            .replaceAll('[date]', '')
            .trim();

        if (remoteVersion > currentVersion) {
          _showUpdateDialog(remoteVersion, releaseDate);
          return UpdateCheckResult.available;
        }
        return UpdateCheckResult.upToDate;
      } else {
        print('Failed to load version info');
      }
    } catch (e) {
      print('Error checking version: $e');
    }
    return UpdateCheckResult.failed;
  }

  // 显示更新提示框，带有发布日期和去更新按钮
  void _showUpdateDialog(double remoteVersion, String releaseDate) {
    showDialog(
      context: context,
      barrierDismissible: true, // 非强制更新，允许点击对话框外部区域关闭
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: context.palette.surface, // 弹窗背景颜色
          title: Text(l10n.updateDialogTitle),
          content: Text(l10n.updateDialogMessage(remoteVersion, releaseDate)),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return context.palette.button; // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                    context.palette.text), // 文本颜色
              ),
              child: Text(l10n.updateDialogLater),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
              },
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return context.palette.button; // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                    context.palette.text), // 文本颜色
              ),
              child: Text(l10n.updateDialogUpdate),
              onPressed: () {
                _launchURL(); // 点击跳转到浏览器
              },
            ),
          ],
        );
      },
    );
  }

  // 显示无网络连接或无法访问的提示框
  void _showNoNetworkDialog([String? message]) {
    showDialog(
      context: context,
      barrierDismissible: false, // 设置为false，禁止点击对话框外部区域取消
      builder: (BuildContext context) {
        final l10n = context.l10n;
        return AlertDialog(
          backgroundColor: context.palette.surface, // 弹窗背景颜色
          title: Text(l10n.networkErrorTitle),
          content: Text(message ?? l10n.networkErrorMessage),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return context.palette.button; // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                    context.palette.text), // 文本颜色
              ),
              child: Text(l10n.networkErrorExit),
              onPressed: () {
                closeApp();
              },
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered)) {
                      return context.palette.button; // 点击或悬浮时的背景颜色
                    }
                    return null; // 默认状态下不更改颜色
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                    context.palette.text), // 文本颜色
              ),
              child: Text(l10n.networkErrorRetry),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
                _checkNetworkAndUpdate(); // 重新检查网络
              },
            ),
          ],
        );
      },
    );
  }

  // 打开浏览器跳转到指定URL
  void _launchURL() async {
    const url = 'https://wear.gnayoah.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 窗口宽度小于该值时切换为底部导航栏布局
  static const double _narrowLayoutBreakpoint = 600;

  // 每个导航项拥有独立的嵌套 Navigator，二级页面在内容区域内打开，侧边栏保持显示
  final List<GlobalKey<NavigatorState>> _navigatorKeys =
      List.generate(4, (_) => GlobalKey<NavigatorState>());

  void _onDestinationSelected(int index) {
    if (index == _selectedIndex) {
      // 再次点击当前导航项时返回该栏目的首页
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
    // 窄屏：像原生分页一样连续滚动到目标页，跨页时会经过中间的页面
    final PageController? controller = _pageController;
    if (controller != null && controller.hasClients) {
      final int token = ++_pageAnimationToken;
      controller
          .animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      )
          .whenComplete(() {
        // 只有最后一次点击触发的动画结束时才恢复跟随滑动
        if (token == _pageAnimationToken) {
          _pageAnimationToken = 0;
        }
      });
    }
  }

  // 窄屏分页控制器：进入窄屏布局时按当前页创建，切换到宽屏时释放
  PageController? _pageController;

  // 非 0 表示正在执行点击导航触发的翻页动画，此时忽略经过中间页时的 onPageChanged
  int _pageAnimationToken = 0;

  void _releasePageController() {
    final PageController? controller = _pageController;
    if (controller == null) {
      return;
    }
    _pageController = null;
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
  }

  // 窄屏页面容器：可左右滑动切换，与底部导航栏联动
  Widget _buildNarrowPager() {
    final PageController controller =
        _pageController ??= PageController(initialPage: _selectedIndex);
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        if (_pageAnimationToken != 0 || index == _selectedIndex) {
          return;
        }
        setState(() {
          _selectedIndex = index;
        });
      },
      children: _pages,
    );
  }

  // 宽屏内容区域：一级页面作为嵌套 Navigator 的根页面
  Widget _buildContent() {
    return Navigator(
      key: _navigatorKeys[_selectedIndex],
      pages: [
        MaterialPage(
          key: ValueKey('tab_$_selectedIndex'),
          child: _pages[_selectedIndex],
        ),
      ],
      onDidRemovePage: (_) {},
    );
  }

  // 切换导航项时新页面淡入并轻微上移。
  // 只做入场动画、不与旧页面交叉淡化：旧页面的嵌套 Navigator 使用 GlobalKey，
  // 快速来回切换时两份同 key 的页面同时存在会报错
  Widget _buildTabTransition(Widget child) {
    return TweenAnimationBuilder<double>(
      key: ValueKey<int>(_selectedIndex),
      tween: Tween<double>(begin: 0, end: 1),
      duration: kPageEnterDuration,
      curve: kPageEnterCurve,
      builder: (context, t, child) => fadeRise(t, child!),
      child: child,
    );
  }

  // 侧边栏与底部导航栏共用的导航项
  List<AppSidebarItem> _navItems(BuildContext context) => [
        AppSidebarItem(
          icon: 'home',
          selectedIcon: 'home_filled',
          label: context.l10n.navigationHome,
        ),
        AppSidebarItem(
          icon: 'features',
          selectedIcon: 'features_filled',
          label: context.l10n.navigationFeatures,
        ),
        AppSidebarItem(
          icon: 'store',
          selectedIcon: 'store_filled',
          label: context.l10n.navigationStore,
        ),
        AppSidebarItem(
          icon: 'settings',
          selectedIcon: 'settings_filled',
          label: context.l10n.navigationAbout,
        ),
      ];

  // 宽屏布局：左侧导航栏
  Widget _buildWideLayout(BuildContext context) {
    _releasePageController();
    return Row(
      children: [
        AppSidebar(
          selectedIndex: _selectedIndex,
          onSelected: _onDestinationSelected,
          items: _navItems(context),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: _buildTabTransition(_buildContent()),
        ),
      ],
    );
  }

  // 窄屏布局：底部导航栏
  Widget _buildNarrowLayout(BuildContext context) {
    // 窄屏下二级页面仍全屏打开，不保留底部导航栏。
    // 导航栏悬浮在页面之上（毛玻璃透出下方内容），页面通过 MediaQuery 底部内边距留出空间
    final MediaQueryData media = MediaQuery.of(context);
    return Stack(
      children: [
        MediaQuery(
          data: media.copyWith(
            padding: media.padding.copyWith(
              bottom: media.padding.bottom + AppBottomBar.totalHeight,
            ),
          ),
          child: _buildNarrowPager(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: AppBottomBar(
            items: _navItems(context),
            selectedIndex: _selectedIndex,
            onSelected: _onDestinationSelected,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _pages
      ..clear()
      ..add(Page1(
        devices: _devices,
        onRefreshDevices: _refreshDevicesNow,
      ))
      ..add(const Page2())
      ..add(const StorePage())
      ..add(Page3(
        onLocaleChanged: widget.onLocaleChanged,
        currentLocale: widget.locale,
        onThemeModeChanged: widget.onThemeModeChanged,
        themeMode: widget.themeMode,
        currentVersion: '$currentVersion',
        onCheckUpdate: _checkForUpdates,
      ));

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500), // 动画时长
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child); // 使用淡入淡出过渡
        },
        child: _isCheckingUpdate
            ? Center(
                key: ValueKey('loading'), // 唯一键值
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 垂直居中对齐
                  children: [
                    /// const SizedBox(height: 80),
                    /// Image.asset(
                    //   'assets/logo2.png', // 加载 logo
                    //   width: 120, // 设置 Logo 的宽度
                    //   height: 120, // 设置 Logo 的高度
                    //  ),
                    //  const SizedBox(height: 80),
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/new_logo.png',
                      height: 65,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 20, // 设置进度条的宽度
                      height: 20, // 设置进度条的高度
                      child: CircularProgressIndicator(
                        strokeWidth: 2, // 设置进度条的粗细，默认是 4.0
                        color: context.palette.text,
                      ),
                    ),
                  ],
                ),
              )
            : LayoutBuilder(
                key: const ValueKey('content'), // 唯一键值
                builder: (context, constraints) {
                  // 窄屏（窄窗口 / 移动端）时将侧边栏移动到页面底部
                  if (constraints.maxWidth < _narrowLayoutBreakpoint) {
                    return _buildNarrowLayout(context);
                  }
                  return _buildWideLayout(context);
                },
              ),
      ),
    );
  }
}
