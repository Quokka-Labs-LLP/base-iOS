//
//  Int+Extension.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 16/06/23.
//

import Foundation

extension Int {

    //MARK: This function is used in Date+Extension
    func of(_ name: String) -> String {
        guard self != 1 else { return "\(self) \(name)" }
        return "\(self) \(name)s"
    }
}
