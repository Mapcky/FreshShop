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
        static let loadCart: URL = URL(string: "http://localhost:8080/api/cart/")!
        static let addCartItems: URL = URL(string: "http://localhost:8080/api/cart/addItem")!
        static let createOrder: URL = URL(string: "http://localhost:8080/api/order/create")!
        static let getOrders: URL = URL(string: "http://localhost:8080/api/order/loadOrders")!
        
        static func products(_ categoryId: Int) -> URL {
            return URL(string: "http://localhost:8080/api/product/fromCategory/\(categoryId)")!
        }
        static func removeCartItems(_ cartItemId: Int) -> URL {
            return URL(string: "http://localhost:8080/api/cart/removeItem/\(cartItemId)")!
        }
    }
}
