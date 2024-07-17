import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      try! dummyMethodToEnforceBundling()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    public func dummyMethodToEnforceBundling() throws{
        // This will never be executed
        let ort_session_options = try ORTSessionOptions()
        
        try ort_session_options.registerCustomOps(functionPointer: RegisterCustomOps)
//        RegisterCustomOps(nil, nil);
      }
}
