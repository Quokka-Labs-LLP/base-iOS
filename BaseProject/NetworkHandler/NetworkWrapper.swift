//
//  NetworkWrapper.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import SystemConfiguration
import UIKit

class NetworkManager: HTTPClient {
    // MARK: - Properties
    private let service: HTTPServiceProtocol
    private let session: URLSessionProtocol

    // MARK: - Initializer
    init(sessionFactory: URLSessionFactoryProtocol = DefaultURLSessionFactory(), service: HTTPServiceProtocol = DefaultHTTPService()) {
        self.session = sessionFactory.session(for: service, delegate: nil)
        self.service = service
    }
    // MARK: - Methods
    func fetchData(_ request: HTTPRequest, basePath: String, success: @escaping NetworkSuccessHandler, failure: @escaping NetworkFailureHandler) {
        
        guard let urlRequest = request.urlRequest(with: basePath ) else {
            failure(nil, nil, .badRequest)
            return
        }

        debugLog(logType: .info, anyObject: urlRequest, text: "Initiating URL Request")
        session.dataTask(with: urlRequest) { data, response, error in


//            if let error = error {
//                failure(nil, nil, .failed(message: error.localizedDescription))
//                return
//            }
//            if let httpResponse = response as? HTTPURLResponse {
//                // if it is between 200..299
//                if (200...299).contains(httpResponse.statusCode) {
//                    if let data = data {
//                        let json = try? JSONSerialization.jsonObject(with: data)
//                        debugLog(logType: .networkResponse, anyObject: json, text: "URL Response")
//                        print("\(data)")
//                        success(data, response)
//                    }
//                } else {
//                    debugLog(logType: .networkResponse, anyObject: httpResponse.statusCode, text: "Unexpected Network response")
//                    failure(nil, httpResponse, .failed(message: "Bad Request"))
//                }
////                Thread 1 Queue : com.apple.main-thread (serial)
//            } else {
//                // debug log response not received
//                debugLog(logType: .error, anyObject: nil, text: "Network response not received.")
            }
        }
    func fetch(_ request: HTTPRequest, basePath: String, success: @escaping NetworkSuccessHandler, failure: @escaping NetworkFailureHandler) {
        guard let urlRequest = request.urlRequest(with: basePath ) else {
            failure(nil, nil, .badRequest)
            return
        }

        debugLog(logType: .info, anyObject: urlRequest, text: "Initiating URL Request")
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                failure(nil, nil, .failed(message: error.localizedDescription))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                // if it is between 200..299
                if (200...299).contains(httpResponse.statusCode) {
                    if let data = data {
                        let json = try? JSONSerialization.jsonObject(with: data)
                        debugLog(logType: .networkResponse, anyObject: json, text: "URL Response")
                        print("\(data)")
                        success(data, response)
                    }
                } else {
                    debugLog(logType: .networkResponse, anyObject: httpResponse.statusCode, text: "Unexpected Network response")
                    failure(nil, httpResponse, .failed(message: "Bad Request"))
                }
//                Thread 1 Queue : com.apple.main-thread (serial)
            } else {
                // debug log response not received
                debugLog(logType: .error, anyObject: nil, text: "Network response not received.")
            }
        }.resume()
    }

    func fetchJSON<T: Decodable>(_ request: HTTPRequest,
                                 basePath: String,
                                 decodableModelType: T.Type,
                                 completion: @escaping ((Result<T, NetworkError>) -> Void)) {
        if Reachability.isConnectedToNetwork() {
            print("Internet Connection Available!")
        } else {
            print("Internet Connection not Available!")
            completion(.failure(.failed(message: "Internet Connection not Available!")))

            return
        }
        self.fetch(request, basePath: basePath) { data, _ in
            do {
                let decodedObject: GeneralNetworkModel<T> = try JSONDecoder().decode(GeneralNetworkModel.self, from: data)
                if decodedObject.isSuccess {
                    if let data = decodedObject.data {
                        completion(.success(data))
                    }
                } else {
                    completion(.failure(.failed(message: decodedObject.message ?? "unknown error")))
                }
            } catch {
                completion(.failure(.unableToDecodeResponseData(errorDescription: error.localizedDescription)))
            }
        } failure: { _, response, _ in
            if let response = response {
                completion(.failure(.statusCode(statusCode: response.statusCode)))
            } else {
                debugLog(logType: .debug, anyObject: nil, text: "Skipped during optional unwraping ")
            }

        }
    }

    // MARK: - Private methods
    private func getParticipantDetils(from data: Data) -> [String: VLParticipantDetails]? {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data) as? NSDictionary

            if let dataInJsonObject = jsonObject?["data"] as? NSDictionary,
               let participantDetails = dataInJsonObject["participantDetails"] as? NSDictionary {

                var foundationParticipantDetails: [String: VLParticipantDetails] = [:]

                for participantDetail in participantDetails.enumerated() {
                    let key = participantDetail.element.key as? String

                    let value = participantDetail.element.value
                    let jsonData = try JSONSerialization.data(withJSONObject: value)

                    let decodedValue = try JSONDecoder().decode(VLParticipantDetails.self, from: jsonData)

                    if let key = key {
                        foundationParticipantDetails[key] = decodedValue
                    }
                }

                return foundationParticipantDetails

            } else {
                debugLog(logType: .optionalUnwrapFail)
            }

        } catch {
            debugLog(logType: .error, anyObject: nil, text: "Unable to extract participant details")
        }

        return nil
    }
}

struct VLParticipantDetails: Decodable {
    var participantEmailId: String
    var participantId: Int
    var participantName: String
    var participantPhoneNo: Int
    var userType: String
}



//class Reachability {
//    var hostname: String?
//    var isRunning = false
//    var isReachableOnWWAN: Bool
//    var reachability: SCNetworkReachability?
//    var reachabilityFlags = SCNetworkReachabilityFlags()
//    let reachabilitySerialQueue = DispatchQueue(label: "ReachabilityQueue")
//    init(hostname: String) throws {
//        guard let reachability = SCNetworkReachabilityCreateWithName(nil, hostname) else {
//            throw Network.Error.failedToCreateWith(hostname)
//        }
//        self.reachability = reachability
//        self.hostname = hostname
//        isReachableOnWWAN = true
//        try start()
//    }
//    init() throws {
//        var zeroAddress = sockaddr_in()
//        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
//        zeroAddress.sin_family = sa_family_t(AF_INET)
//        guard let reachability = withUnsafePointer(to: &zeroAddress, {
//            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
//                SCNetworkReachabilityCreateWithAddress(nil, $0)
//            }
//        }) else {
//            throw Network.Error.failedToInitializeWith(zeroAddress)
//        }
//        self.reachability = reachability
//        isReachableOnWWAN = true
//        try start()
//    }
//    var status: Network.Status {
//        return  !isConnectedToNetwork ? .unreachable :
//                isReachableViaWiFi    ? .wifi :
//                isRunningOnDevice     ? .wwan : .unreachable
//    }
//    var isRunningOnDevice: Bool = {
//        #if targetEnvironment(simulator)
//            return false
//        #else
//            return true
//        #endif
//    }()
//    deinit { stop() }
//}
//struct Network {
//    static var reachability: Reachability!
//    enum Status: String {
//        case unreachable, wifi, wwan
//    }
//    enum Error: Swift.Error {
//        case failedToSetCallout
//        case failedToSetDispatchQueue
//        case failedToCreateWith(String)
//        case failedToInitializeWith(sockaddr_in)
//    }
//}
public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}
