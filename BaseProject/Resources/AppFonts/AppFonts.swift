//
//  AppFonts.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

extension Font {

    private static func fontWeight(_ weight: FontWeight) -> String {
        switch weight {
        case .regular:
            return "Regular"
        case .medium:
            return "Medium"
        case .semibold:
            return "Semibold"
        case .bold:
            return "Bold"
        case .light:
            return "Light"
        case .extrabold:
            return "Extrabold"
        }
    }

    private static func name(fontName: String, weight: FontWeight) -> String {
        let weight = fontWeight(weight)
        return "\(fontName)-\(weight)"
    }

    static func appFont(size: CGFloat = 16, weight: FontWeight = .regular) -> Font {
        // MARK: App font name
        let appFont = "OpenSans"
        let fontName = name(fontName: appFont, weight: weight)
        return Font.custom(fontName, size: size)
    }
}
