//
//  APIEndpoints.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation

enum EndpointProvider {
    case login
    case logout
    
    var value: String {
        switch self {
        case .login:
            return "/login"
        case .logout:
            return "/logout"
        }
    }
    
    // Server Base url
    static func getBaseUrl() -> String {
      if Server.currentBuild == Server.Dev {
        return "https://api-dev.quokkalabs.com"
      } else if Server.currentBuild == Server.Staging {
        return "https://api-stage.quokkalabs.com"
      } else {
        return "https://api.quokkalabs.com"
      }
    }
}

