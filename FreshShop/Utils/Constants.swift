//
//  Constants.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 11/04/2025.
//

import Foundation

struct Constants {
    
    struct Urls {
        // MARK: - AUTH
        static let loginUser: URL = URL(string: "http://localhost:8080/api/auth/login")!
        
        // MARK: - CATEGORIES
        static let allCategories: URL = URL(string: "http://localhost:8080/api/category/all")!
        
        // MARK: - PRODUCT
        static func products(_ categoryId: Int) -> URL {
            return URL(string: "http://localhost:8080/api/product/fromCategory/\(categoryId)")!
        }
        
        // MARK: - CART
        static let loadCart: URL = URL(string: "http://localhost:8080/api/cart/")!
        static let addCartItems: URL = URL(string: "http://localhost:8080/api/cart/addItem")!
        static func removeCartItems(_ cartItemId: Int) -> URL {
            return URL(string: "http://localhost:8080/api/cart/removeItem/\(cartItemId)")!
        }
        
        // MARK: - ORDER
        static let createOrder: URL = URL(string: "http://localhost:8080/api/order/create")!
        static let getOrders: URL = URL(string: "http://localhost:8080/api/order/loadOrders")!
        
        // MARK: - PAYMENT
        static let paymentCreditCard: URL = URL(string: "http://localhost:8080/api/pay/simulate")!
        
        // MARK: - ADDRESS
        static let getAddresses: URL = URL(string: "http://localhost:8080/api/address/getAll")!
        static let newAddress: URL = URL(string: "http://localhost:8080/api/address/setNew")!
        

    }
}
