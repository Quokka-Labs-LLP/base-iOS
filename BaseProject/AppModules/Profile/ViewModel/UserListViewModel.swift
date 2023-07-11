//
//  UserListViewModel.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 26/06/23.
//

import Foundation
import SwiftUI
import CocoaDebug

class UserListViewModel: ObservableObject {

    // MARK: - Published
    @Published var userData: UserListModel?
    @Published var showAlert: Bool = false
    @Published var errorMeassage: String?
    private var networkHandler = NetworkHandler(networkManager: NetworkManager())

    // MARK: - Method
    func getUserList() {
        networkHandler.getUserList(completionHandler: { data, error in
            print("")
            if data != nil && error == nil {
                self.userData = data
            } else {
                DispatchQueue.main.async {
                    self.errorMeassage = error
//                    self.showAlert = true
                }
            }
        })
    }
    func postApi() {
        networkHandler.postApi(completionHandler: { data, error in
            print("")
            if data != nil && error == nil {
                self.userData = data
            } else {
                DispatchQueue.main.async {
                    self.errorMeassage = error
//                    self.showAlert = true
                }
            }
        })
    }
    func uploadData() {
        networkHandler.uploadData(completionHandler: { data, error in
            print("")
            if data != nil && error == nil {
                self.userData = data
            } else {
                DispatchQueue.main.async {
                    self.errorMeassage = error
                    self.showAlert = true
                }
            }
        })
    }
}
