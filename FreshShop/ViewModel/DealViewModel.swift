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
    
    private var deals: [Deal] = []
    var httpClient = HTTPClient()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    func getActiveDeals() async throws {
        
        let resource = Resource(url: Constants.Urls.activeDeals, modelType: DealResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success, let responseDeals = response.deals {
            self.deals = responseDeals
        } else {
            print(response.message ?? "Error while retriving deals data")
        }
    }
    
}
