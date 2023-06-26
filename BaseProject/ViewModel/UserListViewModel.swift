//
//  UserListViewModel.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 26/06/23.
//

import Foundation
import SwiftUI

class UserListViewModel: ObservableObject {
    @Published var userData: UserListModel?
    private var networkManager: NetworkManager

        public init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }

    func getUserList( completionHandler: @escaping (Result<UserListModel, NetworkError>) -> Void) {
        let requestBody = HTTPRequestBody(contentDic: [:], type: .urlEncoded)!
        let request = HTTPRequest(get: EndpointProvider.userList.value, headers: [:])
//        jsonplaceholder.typicode.com
        networkManager.fetchJSON(request, basePath: "dummyjson.com", decodableModelType: UserListModel.self) { result in
       
               completionHandler(result)
           }
       }
}

