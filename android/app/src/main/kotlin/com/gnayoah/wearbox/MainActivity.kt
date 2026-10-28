package com.gnayoah.wearbox

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // 向 Dart 提供随 APK 打包的 adb / fastboot 所在目录，以及可写的 HOME / 临时目录
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "wearbox/platform_tools")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getPaths" -> result.success(
                        mapOf(
                            "nativeLibraryDir" to applicationInfo.nativeLibraryDir,
                            "filesDir" to filesDir.absolutePath,
                            "cacheDir" to cacheDir.absolutePath,
                        )
                    )
                    else -> result.notImplemented()
                }
            }
    }
}
