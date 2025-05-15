//
//  Order.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 09/05/2025.
//

import Foundation

struct Order: Codable, Hashable {
    let id: Int?
    let userId: Int
    var status: OrderStatus
    var orderItems: [OrderItem]
    
    init(from cart: Cart) {
        self.id = nil
        self.userId = cart.userId
        self.status = .pending
        self.orderItems = cart.cartItems.map(OrderItem.init)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, status, orderItems
        case userId = "user_id"
    }
    
    
    func toRequestBody() -> [String: Any] {
        return [
            "order_items": orderItems.map { item in
                [
                    "productId": item.product.id,
                    "quantity": item.quantity
                ]
            }
        ]
    }
}

enum OrderStatus: String, Codable {
    case pending
    case shipped
    case delivered
    case cancelled
}

struct OrderItem: Codable, Hashable {
    let id: Int?
    let product: Product
    let quantity: Int
    
    init(from cartItem: CartItem){
        self.id = nil
        self.product = cartItem.product
        self.quantity = cartItem.quantity
    }
}
