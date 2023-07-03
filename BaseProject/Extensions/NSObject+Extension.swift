//
//  NSObject+Extensions.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import UIKit

extension NSObject {

    /// Returns a Class Name string to be able to use as reuse Identifier for Xib loading
    class var reuseIdentifier: String {
        return String(describing: self)
    }

    /// Returns a Nib of Class to able to register XIBs for tableviews and collectionviews
    class var cellNib: UINib {
        return UINib(nibName: self.reuseIdentifier, bundle: nil)
    }
}
