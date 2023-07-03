//
//  AppColors.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

// MARK: This enum is used as a common place to maintain all colors used in App.

/*
 STEPS To use:
 1: Add color to AppColors Asset.
 2: Declare a new case in 'AppColor' enum.
 3: Use color where you want to use.
 */

public enum AppColor {
    case primaryAppColor
    case black
    case gray
    case violet
    case red
    case white

    func withOpacity(_ opacity: Double) -> Color {
        return self.value.opacity(opacity)
    }

    var value: Color {
        switch self {
        case .primaryAppColor:
            return Color("PrimaryAppColor")
        case .violet:
            return Color("Violet")
        case .black:
            return Color("Black")
        case .gray:
            return Color("Gray")
        case .red:
            return Color("Red")
        case .white:
            return Color("White")
        }
    }
}
