//
//  ContentView.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 06/06/23.
//

import SwiftUI
//import CocoaDebug
import UIKit

struct UserListView: View {
    // MARK: - Properties
    let url = URL(string: "https://picsum.photos/200/300")

    let columns: [GridItem] = [.init(.fixed(110)), .init(.fixed(110)), .init(.fixed(110))]
    @EnvironmentObject var settings: UserSettings
    @StateObject var userListViewModel = UserListViewModel()
    @State var moveToProfileView: Bool = false
    @State private var currentScale: CGFloat = 1.0
    @State private var urlString: URL = URL(string: "https://picsum.photos/200/300")!
    @GestureState private var zoomFactor: CGFloat = 2.0

    // MARK: - Body
    var body: some View {
        VStack {

            ScrollView {
                List {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.brown)
                        Text(LocalizationConstant.Common.johnName.localized(settings.lang))
                            .foregroundColor(.brown)
                        Spacer()
                        Image(systemName: "info.circle")
                    }.onTapGesture(perform: {
                        moveToProfileView = true
                    })
                }.frame(height: 100)
                LazyVGrid(columns: columns) {
                    ForEach(0..<20) { _ in
                        // VStack here causes to images to reload on scrolling
                        VStack {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)

                            } placeholder: {
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                    .frame(width: 110, height: 110)

                            }
                        }.onTapGesture(perform: {
                            urlString = url ?? URL(string: "https://picsum.photos/200/300")!
                            moveToProfileView = true

                        })
                    }
                }
            }

            .alert(userListViewModel.errorMeassage ?? "", isPresented: $userListViewModel.showAlert) {
                Button("OK", role: .cancel) { }
            }
            .navigationDestination(isPresented: $moveToProfileView) {
                ProfileView(urlString: $urlString)
            }

        }.navigationTitle(LocalizationConstant.Common.users.localized(settings.lang))
            .onAppear {
                apiRun()
//                fatalError("Crash was triggered")
            }
    }
    // MARK: - Private Method
    private func apiRun() {
        userListViewModel.getUserList()
        userListViewModel.postApi()
        userListViewModel.uploadData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
