//
//  NetworkHandler.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 10/07/23.
//

import Foundation
import UIKit
import SwiftUI

class NetworkHandler {
   // MARK: - Published
    private var networkManager: NetworkManager

        public init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }
    // MARK: - Method
    func getUserList( completionHandler: @escaping((_ data: UserListModel?, _ error: String?) -> Void)) {
        let request = HTTPRequest(get: EndpointProvider.userList.value, headers: [:])
        networkManager.fetchJSON(request, basePath: EndpointProvider.getBaseUrl(), decodableModelType: UserListModel.self) { result in
            debugPrint(result)

            switch result {
            case .success(let response):
                print(response)
                completionHandler(response, nil)
            case .failure(let failure):
                if let failure = failure.errorDescription {
                    print(failure)
                    completionHandler(nil, failure)

                    }
            }
           }
       }
    func postApi( completionHandler: @escaping((_ data: UserListModel?, _ error: String?) -> Void)) {
        let param: [String: String] = ["title": "news"]
        guard let requestBody = HTTPRequestBody(contentDic: param, type: .urlEncoded) else { return  }
        
        let request = HTTPRequest(post: EndpointProvider.addProduct.value, body: requestBody)
        networkManager.fetchJSON(request, basePath: EndpointProvider.getBaseUrl(), decodableModelType: UserListModel.self) { result in
            debugPrint(result)

            switch result {
            case .success(let response):
                print(response)
                completionHandler(response, nil)
            case .failure(let failure):
                if let failure = failure.errorDescription {
                    print(failure)
                    completionHandler(nil, failure)

                    }
            }
           }
       }

}
