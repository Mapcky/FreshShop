//
//  Order.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 09/05/2025.
//

import Foundation
import SwiftUICore

struct Order: Codable, Hashable {
    let id: Int?
    let userId: Int
    var status: OrderStatus
    var orderItems: [OrderItem]
    let total: String
    let date: Date?
    
    init(from cart: Cart) {
        self.id = nil
        self.userId = cart.userId
        self.status = .pending
        self.orderItems = cart.cartItems.map(OrderItem.init)
        self.date = nil
        let totalValue: Double = cart.cartItems.reduce(0.0) { result, cartItem in
            let price = Double(cartItem.product.price) ?? 0
            let quantity = Double(cartItem.quantity)
            return result + price * quantity
        }
        self.total = String(format: "%.2f", totalValue)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, status, orderItems, total
        case userId = "user_id"
        case date = "createdAt"
    }
    
    
    func toRequestBody() -> [String: Any] {
        return [
            "order_items": orderItems.map { item in
                [
                    "productId": item.product.id,
                    "quantity": item.quantity
                ]
            },
            "total": self.total
        ]
    }
}

enum OrderStatus: String, Codable {
    case pending
    case shipped
    case delivered
    case cancelled
    
    var color: Color {
        switch self {
        case .pending: return .orange
        case .shipped: return .blue
        case .delivered: return .green
        case .cancelled: return .red
        }
    }
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
    
    
    private enum CodingKeys: String, CodingKey {
        case id,quantity
        case product = "Product"
    }
}

struct GetOrdersResponse: Codable {
    var orders: [Order] = []
    let message: String?
    let success: Bool
}

struct CreateOrderResponse: Codable {
    let success: Bool
    let order: Order?
    let message: String?
}
