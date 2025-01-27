import UIKit
import Flutter
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()  // Initialize Firebase
    GeneratedPluginRegistrant.register(with: self)  // Register Flutter plugins
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
