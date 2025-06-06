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
    
    // MARK: - COMPUTED PROPERTIES
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
    
    var description: String {
        return product.description
    }
    
    var rate: Int {
        return product.rate ?? 0
    }
    
    // MARK: - FUNCTIONS
    func incrementCount() {
        if isInStock {
            count += 1
        }
    }
    
    func decrementCount() {
        if count > 1 {
            count -= 1
        }
    }
    

}
