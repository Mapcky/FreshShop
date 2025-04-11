//
//  Category.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 11/04/2025.
//

import Foundation

struct Category: Codable, Hashable {
    let id: Int
    var name: String
    var imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case imageUrl = "image_url"
    }
}
