//
//  Address.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 30/05/2025.
//

import Foundation

struct Address: Codable {
    var id: Int?
    var street: String
    var city: String
    var state: String
    var country: String
    var zip: String
    var isDefault: Bool
}

struct GetAddressResponse: Codable {
    let success: Bool
    let message: String?
    var userAddresses: [Address]?
}

struct SetAddressResponse: Codable {
    let success: Bool
    let message: String?
    var address: Address?
}
