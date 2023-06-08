//
//  MediaType.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

struct ContentType {
    let casePreservedFullyType: String
    
    init(type: String, subType: String) {
        casePreservedFullyType = "\(type)/\(subType)"
    }
    
    init(from fullType: String) {
        casePreservedFullyType = fullType
    }
}

extension ContentType: Equatable {
    static func == (lhs: ContentType, rhs: ContentType) -> Bool {
        return lhs.casePreservedFullyType.compare(rhs.casePreservedFullyType, options: .caseInsensitive) == .orderedSame
    }
}

extension ContentType {
    static let urlEncoded = ContentType(type: "application", subType: "x-www-form-urlencoded")
    static let plain = ContentType(type: "text", subType: "plain")
    static let json = ContentType(type: "application", subType: "json")
}
