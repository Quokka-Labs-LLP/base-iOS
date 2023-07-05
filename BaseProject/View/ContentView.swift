//
//  ContentView.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 06/06/23.
//

import SwiftUI
import CocoaDebug

struct ContentView: View {
    // MARK: - Properties
    @EnvironmentObject var settings: UserSettings
    let  userListViewModel = UserListViewModel(networkManager: NetworkManager())

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
                        Text(",\(settings.lang)").foregroundColor(.brown)
                        Spacer()
                        Image(systemName: "info.circle")
                    }
                }
            }
        }.navigationTitle("")
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
                }

            }

        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
