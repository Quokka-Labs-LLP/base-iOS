//
//  MediaHandler.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import UIKit

class MediaHandler {
    
    class func showMediaUploadActionSheet(on viewController: UIViewController) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
            self.openCamera(on: viewController)
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { _ in
            self.openGallery(on: viewController)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    class func openCamera(on viewController: UIViewController) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            // Show an error message that camera is not available
            return
        }
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = viewController as? any UIImagePickerControllerDelegate & UINavigationControllerDelegate
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    class func openGallery(on viewController: UIViewController) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = viewController as? any UIImagePickerControllerDelegate & UINavigationControllerDelegate
        viewController.present(imagePicker, animated: true, completion: nil)
    }
}
