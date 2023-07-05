//
//  ApiLogsView.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 23/06/23.
//

import Foundation
import NetworkEye
import SwiftUI

struct ApiLogsView: UIViewControllerRepresentable {

    typealias UIViewControllerType = NEHTTPEyeViewController
    func makeUIViewController(context: Context) -> NEHTTPEyeViewController {
        let neHTTPEyeViewController = NEHTTPEyeViewController()
               // Do some configurations here if needed.
               return neHTTPEyeViewController
           // Return MyViewController instance
       }

       func updateUIViewController(_ uiViewController: NEHTTPEyeViewController, context: Context) {
           // Updates the state of the specified view controller with new information from SwiftUI.
       }
}
