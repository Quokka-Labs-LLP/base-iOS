//
//  HTTPServiceProtocol.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

protocol HTTPServiceProtocol {
    var timeout: TimeInterval? { get }
    var httpShouldHandleCookies: Bool { get }
    var host: String { get }
}

struct DefaultHTTPService: HTTPServiceProtocol {
    var timeout: TimeInterval? = 30
    var httpShouldHandleCookies: Bool = false
    var host: String = EndpointProvider.getBaseUrl()
}
