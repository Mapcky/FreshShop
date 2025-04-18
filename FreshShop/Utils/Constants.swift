//
//  Constants.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 11/04/2025.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let allCategories: URL = URL(string: "http://localhost:8080/api/category/all")!
        
        
        static func products(_ categoryId: Int) -> URL {
            return URL(string: "http://localhost:8080/api/product/fromCategory/\(categoryId)")!
        }
    }
}
