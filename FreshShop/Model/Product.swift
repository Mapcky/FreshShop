//
//  Product.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 11/04/2025.
//

import Foundation

struct Product: Codable, Equatable, Hashable {
    let id: Int
    var name: String
    var price: String
    var quantity: Int
    var imageUrl: String
    let categoryId: Int
    
    private enum CodingKeys: String, CodingKey {
        case id, name, price, quantity
        case imageUrl = "image_url"
        case categoryId = "category_id"
    }
}


struct ProductResponse: Codable {
    var success: Bool
    var message: String?
    var products: [Product]?
}
