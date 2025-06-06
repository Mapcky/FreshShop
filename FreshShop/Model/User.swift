//
//  User.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/04/2025.
//

import Foundation

struct User: Codable {
    var id: Int?
    var username: String
    var firstName: String
    var lastName: String
    var imageUrl: String?
    var email: String
    var password: String? //used on register
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case imageUrl = "image_url"
        case username, id, email, password
    }
    
}

struct LoginUserResponse: Codable {
    let success: Bool
    let user: User?
    var message: String?
    var token: String?
}
