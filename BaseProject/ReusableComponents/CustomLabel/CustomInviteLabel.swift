//
//  CustomInviteLabel.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct CustomInviteLabel: View {
    
    var title: String
    var fontSize: CGFloat = 15
    var weight: FontWeight = .regular
    
    var body: some View {
        Text(title)
            .font(Font.appFont(size: fontSize, weight: weight))
            .padding(EdgeInsets(top: 15, leading: 0, bottom: -5, trailing: 0))
    }
}
