//
//  CustomImage.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct CustomImage: View {

    var imageName: String
    var width: CGFloat = 30
    var height: CGFloat = 30

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .imageScale(.large)
    }
}
