//
//  OrderItemViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 21/05/2025.
//

import Foundation
@MainActor
@Observable
class OrderItemViewModel {
    private let orderItem: OrderItem
    
    init(orderItem: OrderItem) {
        self.orderItem = orderItem
    }
    
    
    var productImage: String {
        return orderItem.product.imageUrl
    }
    
    var productName: String {
        return orderItem.product.name
    }
    
    var productUnitPrice: String {
        return orderItem.product.price
    }
    
    var quantity: Int {
        return orderItem.quantity
    }
    
    var productId: Int {
        return orderItem.product.id
    }
    
    var total: String {
        let productPrice = Double(orderItem.product.price) ?? 0
        let total = Double(orderItem.quantity) * productPrice
        return String(total)
    }
    
    var id: Int {
        return orderItem.id ?? 0
    }
    
}
