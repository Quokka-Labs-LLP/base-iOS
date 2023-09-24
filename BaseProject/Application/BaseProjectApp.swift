//
//  BaseProjectApp.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 06/06/23.
//

import SwiftUI
import CocoaDebug
@main
struct BaseProjectApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var settings = UserSettings()
    init() {
            PushNotificationManager.shared.registerForPushNotifications()
        }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserListView()
                    .onAppear {
                        debugPrint("Debug message 1")
                        enableCocoaDebugSeetting()
                    }
            }.environmentObject(settings)
                .onOpenURL(perform: {_ in 
                    print("link")
                })
        }
    }

    private func enableCocoaDebugSeetting() {
        CocoaDebug.enable()
        CocoaDebugSettings.shared.enableLogMonitoring = true
        CocoaDebugSettings.shared.enableCrashRecording = true
        CocoaDebugSettings.shared.enableMemoryLeaksMonitoring_ViewController = true
        CocoaDebugSettings.shared.enableRNMonitoring  = true
        debugPrint("Debug message 2")
    }
}
