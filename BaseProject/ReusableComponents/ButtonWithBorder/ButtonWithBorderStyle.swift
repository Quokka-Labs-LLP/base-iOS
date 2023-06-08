//
//  ButtonWithBorderStyle.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct ButtonWithBorderStyle: ButtonStyle {
    
    var backGroundColor: Color
    var foregroundColor: Color
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var strokeColor : Color
    var lineWidth: CGFloat
    var fontSize: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: fontSize))
            .frame(maxWidth: width, maxHeight: height, alignment: .center)
            .foregroundColor(foregroundColor)
            .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous).fill(backGroundColor))
            .overlay(RoundedRectangle(cornerRadius:cornerRadius).stroke(Color.white, lineWidth: lineWidth))
    }
}
