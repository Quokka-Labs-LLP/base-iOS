//
//  DateHelper.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import UIKit

class DateHelper {
    
    enum TimeFormat : String {
        case full = "hh:mm:ss aa"
    }
    
    /// Returns time extracted from date in `HH:mm:ss` format.
    class func getCurrentTime() -> String {
        let currentDate = Date()
        
        let formattedDate = DateFormatter()
        formattedDate.dateFormat = "hh:mm:ss aa"
        
        return formattedDate.string(from: currentDate)
    }
}
