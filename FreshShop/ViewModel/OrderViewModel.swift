//
//  OrderViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/05/2025.
//

import Foundation

@MainActor
@Observable
class OrderViewModel {
    var orders: [Order] = []
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadOrders() async throws {
        let resource = Resource(url: Constants.Urls.getOrders, modelType: GetOrdersResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success {
            self.orders = response.orders
        } else {
            print(response.message ?? "An error ocurred when loading orders")
        }
    }
    
    
    func generateOrder() async throws {
        
    }
    
}
