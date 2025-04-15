//
//  ProductViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 13/04/2025.
//

import Foundation
import SwiftUI

@MainActor
@Observable
class ProductViewModel {
    private(set) var productsByCategory: [Int: [Product]] = [:]
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    func loadProducts(categoryId: Int) async throws {
        if productsByCategory[categoryId] != nil {
            return
        }//Products already loaded
        
        let resource = Resource(url: Constants.Urls.products(categoryId), modelType: ProductResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if let products = response.products, response.success {
            productsByCategory[categoryId] = products
        } else {
            print(response.message ?? "Failed fetching products")
        }
    }
    
    func productsLocalByCategoryId(categoryId: Int) -> [Product] {
        return productsByCategory[categoryId] ?? []
    }
    
    
}
