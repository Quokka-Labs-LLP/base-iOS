//
//  UINavigationController+Extension.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import UIKit

typealias SuccessIn = (_ success: Bool) -> ()

/**
 UINavigationController Extension
 */
extension UINavigationController {
  /**
    Pop to specific view controller
    - Parameter : viewcontroller want to pop
    - Return : nil
   */
  func backToViewController(vc: Swift.AnyClass, success: SuccessIn) {
    // iterate to find the type of vc
    for element in viewControllers as Array {
      if element.isKind(of: vc) {
        popToViewController(element, animated: true)
        return
      }
    }

    success(true)
  }

  /// Pop current view controller and open a new one
  /// - Parameter newViewController: view controller to replace current view controller
  func popAndPush(newViewController: UIViewController) {
    var viewControllers = viewControllers
    viewControllers.removeLast()
    viewControllers.append(newViewController)
    setViewControllers(viewControllers, animated: false)
  }

  var previousViewController: UIViewController? {
    viewControllers.count > 1 ? viewControllers[viewControllers.count - 2] : nil
  }
}

