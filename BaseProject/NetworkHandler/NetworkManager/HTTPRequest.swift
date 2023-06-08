//
//  HTTPRequest.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

struct HTTPRequest {
    
    let method: HTTPMethod
    let path: String
    let body: HTTPRequestBody?
    let queryItems: [String: String]
    let headers: [String: String]
    let scheme: Scheme
    
    private init(
        method: HTTPMethod,
        path: String,
        body: HTTPRequestBody? = nil,
        queryItems: [String: String] = [:],
        headers: [String: String] = [:],
        scheme: Scheme = .https) {
            self.method = method
            self.path = path
            self.body = body
            self.queryItems = queryItems
            self.headers = headers
            self.scheme = scheme
        }
    
    func urlRequest(with host: String) -> URLRequest? {
        guard let url = self.createUrl(with: host) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        request.allHTTPHeaderFields = self.headers
        
        if let body = self.body {
            request.httpBody = body.content
            request.addValue(body.type.casePreservedFullyType, forHTTPHeaderField: "Content-Type")
        }
        return request
    }
    
    private func createUrl(with host: String) -> URL? {
        var components = URLComponents()
        components.path = self.path
        components.scheme = scheme.rawValue
        components.host = host
        if !queryItems.isEmpty {
            components.queryItems = self.queryItems.map({ key, value in
                URLQueryItem(name: key, value: value)
            })
        }
        if let url = components.url {
            return url
        }
        return nil
    }
}

extension HTTPRequest {
    init(get path: String,
         queryItmes: [String: String] = [:],
         headers: [String: String] = [:]) {
        self.init(method: .get, path: path, body: nil, queryItems: queryItmes, headers: headers)
    }
    
    init(post path: String,
         body: HTTPRequestBody,
         queryItmes: [String: String] = [:],
         headers: [String: String] = [:]) {
        self.init(method: .post, path: path, body: body, queryItems: queryItmes, headers: headers)
    }
}
