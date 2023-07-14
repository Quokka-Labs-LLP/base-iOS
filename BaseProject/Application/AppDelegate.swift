//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 12/07/23.
//

import Foundation
import UIKit
import FirebaseCrashlytics
import FirebaseMessaging
import Firebase
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Use the Firebase library to configure APIs.
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        let center = UNUserNotificationCenter.current()
        center.delegate = self
            // check for user permission first
            center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, _) in
                NSLog("PUSH NOTIFICATION PERMISSION GRANTED: \(granted)")
                guard granted else { return }
                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
                    }
                }
        Messaging.messaging().isAutoInitEnabled = true

        return true
    }

}
extension AppDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo

        print(userInfo)

        completionHandler()
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//            if let refreshedToken = InstanceID.instanceID().token() {
//               print("InstanceID token: \(refreshedToken)")
                Messaging.messaging().apnsToken = deviceToken
//            }
        }
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {

      let deviceToken: [String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken) // This token can be used for testing notifications on FCM
    }
}
