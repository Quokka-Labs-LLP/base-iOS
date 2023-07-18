//
//  PushNotificationManager.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 13/07/23.
//

import Foundation
import Firebase

final class PushNotificationManager: NSObject, MessagingDelegate {
    static let shared = PushNotificationManager()

    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = self

        Messaging.messaging().delegate = self
        Messaging.messaging().isAutoInitEnabled = true

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        // Store the FCM token for later use
        guard let token = fcmToken else { return }
        print("Firebase registration token: \(token)")
        // Save the token to your server or use it to send notifications
    }

    // Handle receiving and handling notifications here
    func handleNotification(_ userInfo: [AnyHashable: Any]) {
        // Extract the relevant data from the notification
        // and perform necessary actions in your app
    }
}

extension PushNotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        handleNotification(userInfo)
        completionHandler()
    }
}
