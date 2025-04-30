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
    private let cartItem: CartItem
    
    init(cartItem: CartItem) {
        self.cartItem = cartItem
    }
    
    
    var productImage: String {
        cartItem.product.imageUrl
    }
    
}
