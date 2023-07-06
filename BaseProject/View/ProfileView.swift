//
//  ProfileView.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 23/06/23.
//

import SwiftUI
import CocoaDebug

struct ProfileView: View {
    // MARK: - Properties
    @EnvironmentObject var settings: UserSettings

    @State var isPresented: Bool = false

    // MARK: - Body
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            .shadow(radius: 5)
        Spacer()
            .frame(height: 20)

        Text(LocalizationConstant.Common.helloText.localized(settings.lang))
            .foregroundColor(.gray)
        Text("john@gmail.com")
            .foregroundColor(.black)
        List {
            Text(LocalizationConstant.Common.apiLogs.localized(settings.lang))
                .foregroundColor(.black)
                .onTapGesture(perform: {
                    isPresented = true
                })
            DropdownView()
        }.shadow(radius: 10)

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
