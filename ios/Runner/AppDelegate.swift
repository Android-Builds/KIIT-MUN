import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyA-DK2KuSpTQzFd39K9PIQyyFXwi1TFSGw")

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as ? UNUserNotificationCenterDelegate    
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
