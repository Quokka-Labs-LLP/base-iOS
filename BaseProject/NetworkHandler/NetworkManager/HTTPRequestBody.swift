//
//  HTTPRequestBody.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

struct HTTPRequestBody {
    var content: Data
    var type: ContentType

    init(content: Data, type: ContentType) {
        self.content = content
        self.type = type
    }

    init?(contentDic: [String: String], type: ContentType) {

        var bodyComponeny = URLComponents()
        bodyComponeny.queryItems = contentDic.map({ key, value in
            var urlHostAllowed: CharacterSet = .urlHostAllowed
            urlHostAllowed.remove(charactersIn: "!*'\"();:@&+$,/?%#[]%=")
            let encodedValue = value.addingPercentEncoding(withAllowedCharacters: urlHostAllowed)
            return URLQueryItem(name: key, value: encodedValue)
        })

        guard let data = bodyComponeny.query?.data(using: .utf8) else {
            return nil
        }
        self.content = data
        self.type = type
    }
}
