//
//  BaseProjectApp.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 06/06/23.
//

import SwiftUI
//import NetworkEye
import CocoaDebug
@main
struct BaseProjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().onAppear {
//                    NEHTTPEye.setEnabled(true)

                    print("Debug message")
                    CocoaDebug.enable()
                    CocoaDebugSettings.shared.enableLogMonitoring = true
                    print("Debug message")
//                    Swift.print(message)
//                       _SwiftLogHelper.shared.handleLog(file: file, function: function, line: line, message: message, color: color)
                }
            }

        }
    }
}
