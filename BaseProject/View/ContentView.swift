//
//  ContentView.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 06/06/23.
//

import SwiftUI
import CocoaDebug

struct ContentView: View {
    let  networkService = UserListViewModel(networkManager: NetworkManager())
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
                        Text("\(LocalizationConstant.Common.johnName)").foregroundColor(.brown)
                        Spacer()
                        Image(systemName: "info.circle")

                    }
                }

            }
        }.navigationTitle(LocalizationConstant.Common.users)
        .onAppear {
            print(Localize.currentLanguage())
           
            networkService.getUserList(completionHandler: { result in
                switch result {
                case .success(let response):
                    networkService.userData = response
                    debugPrint(response)
                case .failure(let failure):
                    if let failure = failure.errorDescription {
                        debugPrint(failure)
                    }

                }

            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
