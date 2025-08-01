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
    var cartItems: [CartItem] = []
    
    private enum CodingKeys: String, CodingKey {
        case id, cartItems
        case userId = "user_id"
    }
}

struct CartItem: Codable, Hashable {
    var id: Int
    var product: Product
    var quantity: Int = 1
    var unitPrice: String
    
    private enum CodingKeys: String, CodingKey {
        case id, quantity
        case product = "Product"
        case unitPrice = "unit_price"
    }
}

struct encodableCartItem: Encodable {
    var productId: Int
    var quantity: Int
    var unitPrice: String
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

struct CartItemRemoveResponse: Codable {
    let success: Bool
    let message: String?
}
