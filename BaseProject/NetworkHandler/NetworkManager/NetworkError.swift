//
//  NetworkError.swift
//  SILive-iOS
//
//  Created by AM on 10/05/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badRequest
    case failed(message: String)
    case timeout
    case unableToDecodeResponseData(errorDescription: String)
    case other(message: String)
    case statusCode(statusCode: Int)
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .failed(message: let message):
            return message
        case .timeout:
            return "Network Timeout"
        case .unableToDecodeResponseData(errorDescription: let errorDescription):
            return errorDescription
        case .other(message: let message):
            return message
        case .statusCode(statusCode: let statusCode):
            return "\(statusCode)"
        }
    }
}
