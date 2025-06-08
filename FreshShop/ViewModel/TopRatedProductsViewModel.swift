//
//  TopRatedProductsViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 08/06/2025.
//

import Foundation

@MainActor
@Observable
class TopRatedProductsViewModel {
    var httpClient: HTTPClient
    private(set) var topRatedProducts: [Product] = []

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    // MARK: - FUNCTIONS
    
    
    func loadTopRated() async throws {
        
        let resource = Resource(url: Constants.Urls.getTopRatedProducts, modelType: ProductResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success, let topProducts = response.products {
            self.topRatedProducts = topProducts
        } else {
            print(response.message ?? "Failed to load top rated products")
        }
    }
}
