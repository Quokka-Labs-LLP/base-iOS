//
//  Checkbox.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct Checkbox: View {
    @Binding public var toggle: Bool

    var body: some View {
        Button(action: {
            self.toggle.toggle()
        }, label: {
            Image(self.toggle ? "checkbox_checked" : "checkbox_unchecked")
                .renderingMode(.original)
                .resizable()
        })
        .frame(width: 20, height: 20)
        .buttonStyle(PlainButtonStyle())
    }

}
