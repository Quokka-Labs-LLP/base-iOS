//
//  View+Extension.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 08/06/23.
//

import Foundation
import SwiftUI

extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
