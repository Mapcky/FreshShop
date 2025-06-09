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
    private(set) var orders: [Order] = []
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadOrders() async throws {
        let resource = Resource(url: Constants.Urls.getOrders, modelType: GetOrdersResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success {
            self.orders = response.orders.sorted { $0.date! > $1.date! }
        } else {
            print(response.message ?? "An error ocurred when loading orders")
        }
    }
    
    func createLocalOrder(from cartVM: CartViewModel) -> Order? {
        guard let cart = cartVM.cart else { return nil }
        return Order(from: cart)
    }
    
    
    func generateOrder(order: Order) async throws {
        
        let body = try JSONSerialization.data(withJSONObject: order.toRequestBody(), options: [])
        
        let resource = Resource(url: Constants.Urls.createOrder, method: .post(body), modelType: CreateOrderResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success, let newOrder = response.order {
            orders.insert(newOrder, at: 0)
        } else {
            throw OrderError.creationFailed(response.message ?? "Error creating the order")
        }
    }
    
    func emptyLocalOrders() {
        self.orders = []
    }
    
    
}
