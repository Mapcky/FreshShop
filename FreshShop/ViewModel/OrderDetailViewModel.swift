//
//  OrderDetailViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/05/2025.
//

import Foundation

@MainActor
@Observable
class OrderDetailViewModel {
    private let order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    
    var id : Int {
        guard let id = order.id else { return 0 }
        return id
    }
    
    var total: String {
        return order.total
    }
    
    var orderItems: [OrderItem] {
        return order.orderItems
    }
    
}
