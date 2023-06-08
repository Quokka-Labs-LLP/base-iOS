//
//  HTTPResponse.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

struct HTTPResponse {
    
    let code: Int
    let body: HTTPResponseBody
    let headers: [String: String]
    
    init(code: Int, body: HTTPResponseBody, headers: [String: String] = [:]) {
        self.code = code
        self.body = body
        self.headers = headers
    }
}

extension HTTPResponse {
    
    init(from response: HTTPURLResponse, bodyConent: Data) {
        let body = HTTPResponseBody(content: bodyConent, type: response.contentType)
        let headers = Dictionary(response.allHeaderFields.lazy.map { key, value in
            return (key.description, value as? String ?? "")
        }, uniquingKeysWith: {$1})
        self.init(code: response.statusCode, body: body, headers: headers)
    }
}

private extension HTTPURLResponse {
    var contentType: ContentType? {
        guard let stringConentType = allHeaderFields["Content-Type"] as? String else {
            return nil
        }
        
        return ContentType(from: stringConentType)
    }
}
