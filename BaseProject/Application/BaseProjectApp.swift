//
//  BaseProjectApp.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 06/06/23.
//

import SwiftUI
import NetworkEye
@main
struct BaseProjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().onAppear{
                    NEHTTPEye.setEnabled(true)
                }
            }

        }
    }
}
