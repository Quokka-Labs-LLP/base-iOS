//
//  ProfileView.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 23/06/23.
//

import SwiftUI

struct ProfileView: View {
    let  networkService = UserListViewModel(networkManager: NetworkManager())
    @State var isPresented: Bool = false
    var body: some View {

        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            .shadow(radius: 5)
        Spacer()
            .frame(height: 20)
        Text("\(LocalizationConstant.Common.helloText)")
            .foregroundColor(.gray)

        Text("john@gmail.com")
            .foregroundColor(.black)

        List {
            Text("\(LocalizationConstant.Common.apiLogs)")
                .foregroundColor(.black).onTapGesture(perform: {
                    isPresented = true
                })

                Dropdown()

        }.shadow(radius: 10)
        .fullScreenCover(isPresented: $isPresented, content: ApiLogsView.init)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct Dropdown: View {

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
                        }//: GROUP
                        .foregroundColor(.gray)
                        .font(.system(.body).bold())

                        Spacer(minLength: 25)
                        if selectedLanguage == languageOption[index] {
                            Image(systemName: "checkmark.square")
                        }
                    }
                    .onTapGesture(perform: {
                        if Localize.currentLanguage() == "ar" {
                            Localize.setCurrentLanguage(language: "en")
                        } else {
                            Localize.setCurrentLanguage(language: "ar")
                        }
                        selectedLanguage = languageOption[index]
                    })
                }
            }
        }
    }
}
