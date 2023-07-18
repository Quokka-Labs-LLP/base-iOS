//
//  DropdownView.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 05/07/23.
//

import Foundation
import SwiftUI

struct DropdownView: View {
    @EnvironmentObject var settings: UserSettings
    @State var selectedLanguage = ""
    @State var languageOption =  ["English", "Arabic"]
    var body: some View {
        GroupBox {
            DisclosureGroup(selectedLanguage.isEmpty ? "Language" : selectedLanguage) {
                ForEach(0..<languageOption.count, id: \.self) { index in
                    Divider()
                        .padding(.vertical, 2)

                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(languageOption[index])
                        }
                        .foregroundColor(.gray)
                        .font(.system(.body).bold())

                        Spacer(minLength: 25)
                        if selectedLanguage == languageOption[index] {
                            Image(systemName: "checkmark.square")
                        }
                    }
                    .onTapGesture(perform: {
                        changeLanguage(index: index)
                        selectedLanguage = languageOption[index]
                    })

                }
            }
        }.onAppear {
            print("Debug message onAppear")
        }

    }

    func changeLanguage(index: Int) {
        switch languageOption[index] {
        case "English":
            self.settings.lang = LanguageOption.english.rawValue
        case "Arabic":
            self.settings.lang = LanguageOption.arabic.rawValue
        default:
            self.settings.lang = LanguageOption.base.rawValue
        }
     }
}
