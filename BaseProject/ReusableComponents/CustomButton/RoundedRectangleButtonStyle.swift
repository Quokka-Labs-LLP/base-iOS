//
//  RoundedRectangleButtonStyle.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
    
    var width: CGFloat = 200
    var height: CGFloat = 40
    var backgroundColor: Color = AppColor.primaryAppColor.value
    var font: Font = Font.appFont(size: 16, weight: .semibold)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .font(font)
            .foregroundColor(AppColor.white_FFFFFF.value)
            .background(
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .foregroundColor(backgroundColor)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
