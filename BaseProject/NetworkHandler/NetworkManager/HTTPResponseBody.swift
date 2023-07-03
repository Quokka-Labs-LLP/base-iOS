//
//  HTTPResponseBody.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

struct HTTPResponseBody {

    var content: Data
    var type: ContentType?

    init(content: Data, type: ContentType?) {
        self.content = content
        self.type = type
    }
}
