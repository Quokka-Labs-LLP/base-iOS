//
//  HapticsGenerator.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import UIKit

class HapticsGenerator {
    class func lightImpact() {
        let lightImpactGenerator = UIImpactFeedbackGenerator(style: .light)
        lightImpactGenerator.impactOccurred()
    }
    
    class func mediumImpact() {
        let mediumImpactGenerator = UIImpactFeedbackGenerator(style: .medium)
        mediumImpactGenerator.impactOccurred()
    }
    
    class func heavyImpact() {
        let heavyImpactGenerator = UIImpactFeedbackGenerator(style: .heavy)
        heavyImpactGenerator.impactOccurred()
    }
    
    class func dislikeImpact() {
        let dislikeFeedbackGenerator = UINotificationFeedbackGenerator()
        dislikeFeedbackGenerator.notificationOccurred(.error)
    }
}
