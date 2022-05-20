import UIKit
import Flutter
import LeanCloud

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    do {
                LCApplication.logLevel = .all
                try LCApplication.default.set(
                    id: "{{appid}}",
                    key: "{{appkey}}",
                    serverURL: "https://xxx.example.com")
                GeneratedPluginRegistrant.register(with: self)
                return super.application(application, didFinishLaunchingWithOptions: launchOptions)
            } catch {
                fatalError("\(error)")
            }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
