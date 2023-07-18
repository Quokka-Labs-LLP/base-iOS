//
//  Localize.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 30/06/23.
//

import Foundation
import SwiftUI
/// Internal current language key
let LCLCurrentLanguageKey = "LCLCurrentLanguageKey"

/// Default language. English. If English is unavailable defaults to base localization.
let LCLDefaultLanguage = "en"

/// Base bundle as fallback.
let LCLBaseBundle = "Base"

/// Name for language change notification
public let LCLLanguageChangeNotification = "LCLLanguageChangeNotification"

// MARK: Localization Syntax

/**
Swift 1.x friendly localization syntax, replaces NSLocalizedString
- Parameter string: Key to be localized.
- Returns: The localized string.
*/
public func localized(string: String, lang: String) -> String {
    return string.localized(lang)
}

/**
 Swift 1.x friendly localization syntax with format arguments, replaces String(format:NSLocalizedString)
 - Parameter string: Key to be localized.
 - Returns: The formatted localized string with arguments.
 */
public func localized(string: String, arguments: CVarArg...) -> String {
    return String(format: string.localized(), arguments: arguments)
}

/**
 Swift 1.x friendly plural localization syntax with a format argument

 - parameter string:   String to be formatted
 - parameter argument: Argument to determine pluralisation

 - returns: Pluralized localized string.
 */
public func localizedPlural(string: String, argument: CVarArg) -> String {
    return string.localizedPlural(argument: argument)
}

public extension String {
    /**
     Swift 2 friendly localization syntax, replaces NSLocalizedString
     - Returns: The localized string.
     */
    func localized(_ lang: String) -> String {

        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    func localized() -> String {
        if let path = Bundle.main.path(forResource: Localize.currentLanguage(), ofType: "lproj"), let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        } else if let path = Bundle.main.path(forResource: LCLBaseBundle, ofType: "lproj"), let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        }
        return self
    }

    /**
     Swift 2 friendly localization syntax with format arguments, replaces String(format:NSLocalizedString)
     - Returns: The formatted localized string with arguments.
     */
    func localizedFormat(arguments: CVarArg...) -> String {
        return String(format: localized(), arguments: arguments)
    }

    /**
     Swift 2 friendly plural localization syntax with a format argument

     - parameter argument: Argument to determine pluralisation

     - returns: Pluralized localized string.
     */
    func localizedPlural(argument: CVarArg) -> String {
        return NSString.localizedStringWithFormat(localized() as NSString, argument) as String
    }
}
// MARK: Language Setting Functions
public class Localize: NSObject {
    /**
     List available languages
     - Returns: Array of available languages.
     */
    public class func availableLanguages(excludeBase: Bool = false) -> [String] {
        var availableLanguages = Bundle.main.localizations
        // If excludeBase = true, don't include "Base" in available languages
        if let indexOfBase = availableLanguages.firstIndex(of: "Base"), excludeBase == true {
            availableLanguages.remove(at: indexOfBase)
        }
        return availableLanguages
    }
    /**
     Current language
     - Returns: The current language. String.
     */
    public class func currentLanguage() -> String {
        if let currentLanguage = UserDefaults.standard.object(forKey: LCLCurrentLanguageKey) as? String {
            return currentLanguage
        }
        return defaultLanguage()
    }

    /**
     Change the current language
     - Parameter language: Desired language.
     */
    public class func setCurrentLanguage(language: String) {

        let selectedLanguage = availableLanguages().contains(language) ? language : defaultLanguage()
        print(selectedLanguage)
        UserDefaults.standard.removeObject(forKey: LCLCurrentLanguageKey)
        UserDefaults.standard.setValue(selectedLanguage, forKey: "selectedLanguage")

        if selectedLanguage != currentLanguage() {
            UserDefaults.standard.set(selectedLanguage, forKey: LCLCurrentLanguageKey)
            UserDefaults.standard.synchronize()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
        }
    }

    /**
     Default language
     - Returns: The app's default language. String.
     */
    public class func defaultLanguage() -> String {
        var defaultLanguage: String = String()
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
            return LCLDefaultLanguage
        }
        let availableLanguages: [String] = self.availableLanguages()
        if availableLanguages.contains(preferredLanguage) {
            defaultLanguage = preferredLanguage
        } else {
            defaultLanguage = LCLDefaultLanguage
        }
        return defaultLanguage

    }

    /**
     Resets the current language to the default
     */
    public class func resetCurrentLanguageToDefault() {
        setCurrentLanguage(language: self.defaultLanguage())
    }

    /**
     Get the current language's display name for a language.
     - Parameter language: Desired language.
     - Returns: The localized string.
     */
    public class func displayNameForLanguage(language: String) -> String {
        let locale: NSLocale = NSLocale(localeIdentifier: currentLanguage())
        if let displayName = locale.displayName(forKey: NSLocale.Key.languageCode, value: language) {
            return displayName
        }
        return String()
    }
}
class UserSettings: ObservableObject {

    @Published var lang: String = "ar"

}
