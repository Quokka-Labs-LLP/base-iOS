//
//  CustomInviteTextField.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct CustomInviteTextField: View {
    // MARK: - Properties
    var title: String
    var fontSize: CGFloat = 15
    var weight: FontWeight = .regular
    var bindingString: Binding<String>
    var keyBoardType: UIKeyboardType = .default
    @Binding var isErrorBorder: Bool

    // MARK: - Methods
    var body: some View {

        TextField(Localization.string(key: title), text: bindingString, onEditingChanged: { _ in isErrorBorder = false })
        .font(Font.appFont(size: fontSize, weight: weight))
        .keyboardType(keyBoardType)
        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 6))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isErrorBorder ? AppColor.red.value : AppColor.gray.value, lineWidth: 1)
        )
    }
}
