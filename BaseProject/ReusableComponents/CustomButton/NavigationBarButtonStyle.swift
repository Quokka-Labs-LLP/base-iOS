//
//  NavigationBarButtonStyle.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct NavigationBarButtonStyle: ButtonStyle {
    
    var imageName: String
    var width: CGFloat = 20
    var height: CGFloat = 20
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
        }
    }
}
