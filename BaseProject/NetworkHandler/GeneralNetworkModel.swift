//
//  GenericResponse.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 08/06/23.
//

import Foundation


struct GeneralNetworkModel<T: Decodable>: Decodable {
    var code: Int?
    var message: String?
    var status: String?
    var data: T?

    var isSuccess: Bool {
        if code == 200 && status == "success" {
            return true
        } else {
            return false
        }
    }
}
