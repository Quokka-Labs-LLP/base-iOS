//
//  CustomLabel.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct CustomLabel: View {
    
    var title: String
    var fontSize: CGFloat = 15
    var weight: FontWeight = .regular
    var titleColor: Color = AppColor.primaryAppColor.value
    
    var body: some View {
        
        Text(Localization.string(key: title))
            .font(Font.appFont(size: fontSize, weight: weight))
            .foregroundColor(titleColor)
    }
}
