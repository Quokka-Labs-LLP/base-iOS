//
//  Localization.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 08/06/23.
//

import Foundation

class Localization {
    static func string(key: String) -> String {
        print( NSLocalizedString(key, tableName: "Localizable", bundle: Bundle(for: self), value: "", comment: ""))
        return key.localized()
    }
}

enum LocalizationConstant {

    // Common String
    enum Common {

        static let users = Localization.string(key: "users")
        static let helloText = Localization.string(key: "helloJohn")
        static let johnName = Localization.string(key: "john")
        static let apiLogs = Localization.string(key: "apiLogs")
        static let close = Localization.string(key: "close")
        static let facebookText = Localization.string(key: "facebook")
        static let instaText = Localization.string(key: "instagram")
        static let aboutUs = Localization.string(key: "about_us")
    }

    // Screen-feature wise screens text.
    enum HomeScreen {
        static let navigationTitle = "homeview"
    }
}
