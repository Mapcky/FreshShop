//
//  DealViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 10/07/2025.
//

import Foundation

@MainActor
@Observable
class DealViewModel {
    
    private(set) var deals: [Deal] = []
    private(set) var productByCategory: [Int : [Product]] = [:]
    var httpClient = HTTPClient()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    func getActiveDeals() async throws {
        
        let resource = Resource(url: Constants.Urls.activeDeals, modelType: DealResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success {
            self.deals = response.deals
        } else {
            print(response.message ?? "Error while retriving deals data")
        }
    }
    
    
    func productsCategoryWDeals() {
        var tempDict: [Int: [Product]] = [:]
        
        for deal in deals {
            for item in deal.items {
                var modifiedProduct = item.product
                
                let newPrice = (Double(item.product.price) ?? 0) * (1 - ((Double(item.value) ?? 0)/100))
                modifiedProduct.price = String(format: "%.2f", newPrice)
                
                let categoryId = modifiedProduct.categoryId
                if tempDict[categoryId] == nil {
                    tempDict[categoryId] = []
                }
                
                tempDict[categoryId]?.append(modifiedProduct)
            }// LOOP ITEMS
        }//: LOOP DEALS
        self.productByCategory = tempDict
    }
}
