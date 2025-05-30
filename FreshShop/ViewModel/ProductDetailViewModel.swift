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
    private let product: Product
    var count: Int = 1
    
    init(product: Product) {
        self.product = product
    }
    
    var isInStock: Bool {
        count < product.quantity
    }
    
    var name: String {
        return product.name
    }
    
    var id: Int {
        return product.id
    }
    
    var price: String {
        return product.price
    }
    
    var imageUrl: String {
        return product.imageUrl
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
