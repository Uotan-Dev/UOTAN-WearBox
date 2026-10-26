import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    // 调用 adb/fastboot 时子进程提前退出会触发 SIGPIPE，默认行为是直接杀死整个应用；
    // 忽略后写入会返回 EPIPE，由 Dart 侧的 try/catch 正常处理。
    signal(SIGPIPE, SIG_IGN)

    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    // MainMenu.xib 中的 APP_NAME 占位符替换为本地化后的应用名（如“退出 柚坛手表助手”）
    let appName = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String
      ?? Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
      ?? ProcessInfo.processInfo.processName
    self.title = appName
    if let mainMenu = NSApp.mainMenu {
      replaceAppNamePlaceholder(in: mainMenu, with: appName)
    }

    super.awakeFromNib()
  }

  private func replaceAppNamePlaceholder(in menu: NSMenu, with appName: String) {
    menu.title = menu.title.replacingOccurrences(of: "APP_NAME", with: appName)
    for item in menu.items {
      item.title = item.title.replacingOccurrences(of: "APP_NAME", with: appName)
      if let submenu = item.submenu {
        replaceAppNamePlaceholder(in: submenu, with: appName)
      }
    }
  }
}
