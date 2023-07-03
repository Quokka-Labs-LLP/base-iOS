//
//  URLSessionFactory.swift
//  SILive-iOS
//
//  Created by AM on 10/05/22.
//

import Foundation

protocol URLSessionFactoryProtocol {
    func session(for service: HTTPServiceProtocol, delegate: URLSessionDelegate?) -> URLSessionProtocol
}

final class DefaultURLSessionFactory: URLSessionFactoryProtocol {
    
    func session(for service: HTTPServiceProtocol, delegate: URLSessionDelegate?) -> URLSessionProtocol {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = service.httpShouldHandleCookies
        configuration.httpCookieAcceptPolicy =  service.httpShouldHandleCookies ? .always : .never
        let timeout = service.timeout ?? 30
        configuration.timeoutIntervalForRequest = timeout
        configuration.timeoutIntervalForResource = timeout
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        
        return session
    }
}
