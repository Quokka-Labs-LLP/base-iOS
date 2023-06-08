//
//  AppColors.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

/// Contains all the custom colors used in application
public enum AppColor {
    case primaryAppColor
    case gray_5C5B5C
    case gray_494848
    case white_FFFFFF
    case black_000000
    case fontBlack_333333
    case red_CA3832
    case gray_E5E5E5
    case gray_757575
    case darkGunmetal_192532
    case gray_92918D
    case green_66DB85
    case yellow_F6CA4F
    case violet
    case gray_ECEFF0
    case progressBarBase
    case progressBarTop
    case fontGray_969696
    case gray_F2F4F5
    case SkipBackground_E3E5E7
    case SkipBorder_5C5B5C
    
    func withOpacity(_ opacity: Double) -> Color {
        return self.value.opacity(opacity)
    }
    
    var value: Color {
        switch self {
        case .primaryAppColor:
            return Color("PrimaryAppColor")
        case .gray_494848:
            return Color("Gray_494848")
        case .gray_5C5B5C:
            return Color("Gray_5C5B5C")
        case .white_FFFFFF:
            return Color("White_FFFFFF")
        case .black_000000:
            return Color("Black")
        case .fontBlack_333333:
            return Color("fontBlack_333333")
        case .red_CA3832:
            return Color("Red_CA3832")
        case .gray_E5E5E5:
            return Color("Gray_E5E5E5")
        case .gray_757575:
            return Color("Gray_757575")
        case .darkGunmetal_192532:
            return Color("DarkGunmetal_192532")
        case .gray_92918D:
            return Color("Gray_92918D")
        case .green_66DB85:
            return Color("Green_66DB85")
        case .yellow_F6CA4F:
            return Color("Yellow_F6CA4F")
        case .gray_ECEFF0:
            return Color("Gray_ECEFF0")
        case .violet:
            return Color("Violet")
        case .progressBarBase:
            return Color("ProgressBarBase")
        case .progressBarTop:
            return Color("ProgressBarTop")
        case .fontGray_969696:
            return Color("fontGray_969696")
        case .gray_F2F4F5:
            return Color("Gray_F2F4F5")
        case .SkipBackground_E3E5E7:
            return Color("SkipBackground_E3E5E7")
        case .SkipBorder_5C5B5C:
            return Color("SkipBorder_5C5B5C")
        }
    }
}

