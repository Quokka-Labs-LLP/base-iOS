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
    private var networkManager: NetworkManager

        public init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }
    // MARK: - Method
    func getUserList( completionHandler: @escaping (Result<UserListModel, NetworkError>) -> Void) {
//        _ = HTTPRequestBody(contentDic: [:], type: .urlEncoded)
        let request = HTTPRequest(get: EndpointProvider.userList.value, headers: [:])
        networkManager.fetchJSON(request, basePath: "dummyjson.com", decodableModelType: UserListModel.self) { result in
               print(result)
             
               completionHandler(result)
           }
       }
    
}
