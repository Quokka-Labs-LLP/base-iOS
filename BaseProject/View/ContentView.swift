//
//  ContentView.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 06/06/23.
//

import SwiftUI
import CocoaDebug
import UIKit

struct ContentView: View {
    // MARK: - Properties
    @EnvironmentObject var settings: UserSettings
  @StateObject var userListViewModel = UserListViewModel(networkManager: NetworkManager())

    // MARK: - Body
    var body: some View {
        VStack {
            NavigationLink {
                ProfileView()
            } label: {
                List {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.brown)
                        Text(LocalizationConstant.Common.johnName.localized(settings.lang))
                            .foregroundColor(.brown)
                        Spacer()
                        Image(systemName: "info.circle")
                    }
                }
            }
            .alert(userListViewModel.errorMeassage ?? "", isPresented: $userListViewModel.showAlert) {
                       Button("OK", role: .cancel) { }
                   }
        }.navigationTitle(LocalizationConstant.Common.users.localized(settings.lang))
            .onAppear {
                print(Localize.currentLanguage())
                getUserList()
            }
    }

    // MARK: - Private Method
    private func getUserList() {
        userListViewModel.getUserList(completionHandler: { result in
            switch result {
            case .success(let response):
                userListViewModel.userData = response
                print(response)
            case .failure(let failure):
                if let failure = failure.errorDescription {
                    print(failure)
                    DispatchQueue.main.async {
                        userListViewModel.errorMeassage = failure
                    }
                    }
            }})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
