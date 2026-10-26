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

    super.awakeFromNib()
  }
}
