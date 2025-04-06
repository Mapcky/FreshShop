//
//  User.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/04/2025.
//

import Foundation

struct User {
    var id: Int
    var username: String
    var firstName: String
    
    
    enum codingKeys: String, CodingKey {
        case firstName = "first_name"
        case username, id
    }
}
