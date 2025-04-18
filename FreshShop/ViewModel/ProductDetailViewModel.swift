//
//  ProductDetailViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 16/04/2025.
//

import Foundation
@MainActor
@Observable
class ProductDetailViewModel {
    let product: Product
    var count: Int = 1
    
    init(product: Product) {
        self.product = product
    }
    
    var isInStock: Bool {
        count < product.quantity
    }
    
    func incrementCount() {
        if isInStock {
            count += 1
        }
    }
    
    func decrementCount() {
        if count > 0 {
            count -= 1
        }
    }
    
}
