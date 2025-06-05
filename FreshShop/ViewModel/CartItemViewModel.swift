//
//  CartItemViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 30/04/2025.
//

import Foundation

@MainActor
@Observable
class CartItemViewModel {
    private(set) var cartItem: CartItem
    
    init(cartItem: CartItem) {
        self.cartItem = cartItem
    }
    
    // MARK: - COMPUTED PROPERTIES
    var productImage: String {
        return cartItem.product.imageUrl
    }
    
    var productName: String {
        return cartItem.product.name
    }
    
    var productUnitPrice: String {
        return cartItem.product.price
    }
    
    var quantity: Int {
        return cartItem.quantity
    }
    
    var productId: Int {
        return cartItem.product.id
    }
    
    var total: String {
        let productPrice = Double(cartItem.product.price) ?? 0
        let total = Double(cartItem.quantity) * productPrice
        return String(total)
    }
    
    var id: Int {
        return cartItem.id
    }
    
}
