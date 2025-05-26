//
//  OrderViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/05/2025.
//

import Foundation

enum OrderError: Error {
    case creationFailed(String)
}

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
    
    
    func generateOrder(order: Order) async throws {
        
        let body = try JSONSerialization.data(withJSONObject: order.toRequestBody(), options: [])
        
        let resource = Resource(url: Constants.Urls.createOrder, method: .post(body), modelType: CreateOrderResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if !response.success {
            throw OrderError.creationFailed(response.message ?? "Error creating the order")
        }
    }
    
}
