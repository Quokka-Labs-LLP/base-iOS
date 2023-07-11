//
//  UserListModal.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 26/06/23.
//

import Foundation

// MARK: - UserListModel
struct UserListModel: Codable {
    let id: String
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let address: Address
    let department, name, title: String
}
