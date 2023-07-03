//
//  AppEnvironment.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 08/06/23.
//

import Foundation

enum Server {
  static let Dev = -1
  static let Staging = 0
  static let Production = 1

  static var currentBuild: Int = {
    if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
      if configuration.range(of: "Debug") != nil {
        return Server.Dev
      } else if configuration.range(of: "Staging") != nil {
        return Server.Staging
      }
    }
    return Server.Production
  }()
}
