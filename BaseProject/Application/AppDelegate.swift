//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 12/07/23.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseCrashlytics

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Use the Firebase library to configure APIs.
        FirebaseApp.configure()
        return true
    }
}
