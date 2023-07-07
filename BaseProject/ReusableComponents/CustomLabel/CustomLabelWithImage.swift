//
//  CustomLabelWithImage.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct CustomLabelWithImage: View {
    
    var title: String
    var fontSize: CGFloat = 15
    var weight: FontWeight = .regular
    var imageName: String
    var titleColor: Color = AppColor.primaryAppColor.value
    
    var body: some View {
        Label {
            Text(Localization.string(key: title))
                .font(Font.appFont(size: fontSize, weight: weight))
                .foregroundColor(titleColor)
        } icon: {
            Image(imageName)
        }
    }
}
