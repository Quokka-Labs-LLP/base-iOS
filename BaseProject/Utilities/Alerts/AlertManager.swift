//
//  AlertManager.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import UIKit

class AlertManager {
    class func showOkayAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
//        if let rootViewController = AppDelegate.sharedDelegate().getRootViewController() {
//            let okayAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "Okay", style: .default, handler: handler)
//            okayAlertController.addAction(okAction)
//
//            if !(rootViewController.isBeingPresented) {
//                rootViewController.present(okayAlertController, animated: true, completion: nil)
//            } else {
//                rootViewController.presentedViewController?.present(okayAlertController, animated: true)
//            }
//
//        } else {
//            controllerNotFoundError()
//        }
    }

    class func showDestrictiveAlert(title: String, message: String, destructiveButtonTitle: String, destructiveButtonAction: @escaping () -> Void) {
//        if let rootViewController = AppDelegate.sharedDelegate().getRootViewController() {
//            let destructiveAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//            let destructiveAction = UIAlertAction(title: destructiveButtonTitle, style: .destructive, handler: { _ in
//                destructiveButtonAction()
//            })
//
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//
//            destructiveAlertController.addAction(cancelAction)
//            destructiveAlertController.addAction(destructiveAction)
//
//            rootViewController.present(destructiveAlertController, animated: true)
//        } else {
//            controllerNotFoundError()
//        }
    }

    class private func controllerNotFoundError() {
        debugLog(logType: .warning, anyObject: nil, text: "Root view controller not found.")
    }
}
