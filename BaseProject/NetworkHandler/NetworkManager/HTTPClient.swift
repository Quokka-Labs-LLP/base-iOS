//
//  HTTPClient.swift
//  SILive-iOS
//
//  Created by Arvind on 16/03/22.
//

import Foundation

typealias NetworkSuccessHandler = (Data, URLResponse?) -> Void
typealias NetworkFailureHandler = (Data?, HTTPURLResponse?, NetworkError) -> Void

protocol HTTPClient {

//    func fetch(_ request: HTTPRequest, basePath: String, success: @escaping NetworkSuccessHandler, failure: @escaping NetworkFailureHandler, )
    func fetch(_ request: HTTPRequest, basePath: String, success: @escaping NetworkSuccessHandler, failure: @escaping NetworkFailureHandler)

//    func fetchJSON<T: Decodable>(_ request: HTTPRequest, basePath: String, decodableModelType: T.Type, completion: @escaping ((Result<T, NetworkError>) -> Void))
    func fetchJSON<T: Decodable>(_ request: HTTPRequest, basePath: String, decodableModelType: T.Type, completion: @escaping ((Result<T, NetworkError>) -> Void))
}


protocol HTTPClientNormal {
    func fetch(_ request: HTTPRequest, basePath: String, success: @escaping NetworkSuccessHandler, failure: @escaping NetworkFailureHandler) -> HTTPClientNormal
}
