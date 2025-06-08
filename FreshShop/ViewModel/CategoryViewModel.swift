//
//  CategoryViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 11/04/2025.
//

import Foundation

@MainActor
@Observable
class CategoryViewModel: ObservableObject {
    private(set) var categories: [Category] = []
    let httpClient: HTTPClient
    
    
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    func loadCategories() async throws {
        let resource = Resource(url: Constants.Urls.allCategories, modelType: [Category].self)
        
        categories = try await httpClient.load(resource)
        
    }
    
    func printAllProducts() {
        for category in categories {
            print(category.name)
        }
    }
    

}
