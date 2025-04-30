//
//  Cart.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/04/2025.
//

import Foundation

struct Cart: Codable {
    var id: Int
    let userId: Int
    var cartItems: [CartItem]?
    
    private enum CodingKeys: String, CodingKey {
        case id, cartItems
        case userId = "user_id"
    }
}

struct CartItem: Codable, Hashable {
    var id: Int
    var product: Product
    var quantity: Int = 1
    
    private enum CodingKeys: String, CodingKey {
        case id, quantity
        case product = "Product"
    }
}

struct CartResponse: Codable {
    let success: Bool
    let message: String?
    let cart: Cart?
}

struct AddCartItemResponse: Codable {
    let success: Bool
    let message: String?
    let cartItem: CartItem?
}
