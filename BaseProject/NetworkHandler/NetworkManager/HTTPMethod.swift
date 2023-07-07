//
//  HTTPMethod.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

enum HTTPMethod: String, RawRepresentable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Scheme: String {
    case https
    case http
}
