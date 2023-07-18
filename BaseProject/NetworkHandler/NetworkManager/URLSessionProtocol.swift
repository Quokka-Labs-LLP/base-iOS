//
//  URLSessionProtocol.swift
//  SILive-iOS
//
//  Created by AM on 10/05/22.
//

import Foundation

protocol URLSessionProtocol {
    typealias DataTaskResult = @Sendable (Data?, URLResponse?, Error?) -> Void

    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionProtocol {}
