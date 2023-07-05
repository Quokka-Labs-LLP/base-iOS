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
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .onAppear {
                        debugPrint("Debug message 1")
                        enableCocoaDebugSeetting()
                    }
            }

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
