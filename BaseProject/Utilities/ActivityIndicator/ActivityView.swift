//
//  ActivityView.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import UIKit

/// Responsiblities
/// - Show activity indicator on root view.
/// - Accessible throughout the codebase.
class ActivityView: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var largeActivityIndicator : UIActivityIndicatorView!

    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Methods
    /// Shows a full screen indicator with an opaque background.
    class func showActivityIndicator() {
//        if let rootViewController = AppDelegate.sharedDelegate().getRootViewController() {
//            let activityView = ActivityView(nibName: "ActivityView", bundle: nil)
//            activityView.modalPresentationStyle = .overCurrentContext
//            activityView.modalTransitionStyle = .crossDissolve
//            rootViewController.present(activityView, animated: true)
//        }
    }

    /// Hides the activty indicator after checking if it is loaded in the current view hierarchy.
    class func hideActivityIndicator() {
//        if let rootViewController = AppDelegate.sharedDelegate().getRootViewController() {
//            if let activityIndicator = rootViewController.presentedViewController as? ActivityView {
//                activityIndicator.dismiss(animated: true)
//            }
//        }
    }
}
