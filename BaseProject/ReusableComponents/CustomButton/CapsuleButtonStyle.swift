//
//  CapsuleButtonStyle.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    
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
                Capsule()
                    .fill(backgroundColor)
                    .shadow(radius: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
