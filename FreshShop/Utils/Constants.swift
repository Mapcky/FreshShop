//
//  Constants.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 11/04/2025.
//

import Foundation

struct Constants {
    
    private static let production: String = "https://feshshopback.onrender.com"
    private static let localUrl: String = "http://localhost:8080"
    
    struct Urls {
        
        static var baseURL: String {
            #if DEBUG
            return production
            #else
            return localUrl
            #endif
        }
        
        // MARK: - AUTH
        static let loginUser: URL = URL(string: baseURL + "/api/auth/login")!
        static let loginById: URL = URL(string: baseURL + "/api/auth/secureLogin")!
        static let register: URL = URL(string: baseURL + "/auth/register")!
        
        // MARK: - CATEGORIES
        static let allCategories: URL = URL(string: baseURL + "/api/category/all")!
        
        // MARK: - PRODUCT
        static func products(_ categoryId: Int) -> URL {
            return URL(string: baseURL + "/api/product/fromCategory/\(categoryId)")!
        }
        static let getTopRatedProducts: URL = URL(string: baseURL + "/api/product/top-rated")!
        
        // MARK: - CART
        static let loadCart: URL = URL(string: baseURL + "/api/cart/")!
        static let addCartItems: URL = URL(string: baseURL + "/api/cart/addItem")!
        static func removeCartItems(_ cartItemId: Int) -> URL {
            return URL(string: baseURL + "/api/cart/removeItem/\(cartItemId)")!
        }
        
        // MARK: - ORDER
        static let createOrder: URL = URL(string: baseURL + "/api/order/create")!
        static let getOrders: URL = URL(string: baseURL + "/api/order/loadOrders")!
        
        // MARK: - PAYMENT
        static let paymentCreditCard: URL = URL(string: baseURL + "/api/pay/simulate")!
        static let generateStripePaymentIntent: URL = URL(string: baseURL + "/api/pay/stripePaymentIntent/")!

        
        // MARK: - ADDRESS
        static let getAddresses: URL = URL(string: baseURL + "/api/address/getAll")!
        static let newAddress: URL = URL(string: baseURL + "/api/address/setNew")!
        static let setAddressDefault: URL = URL(string: baseURL + "/api/address/changeDefault")!
        
        // MARK: - DOLAR COTIZATION
        static let getUsdCotization: URL = URL(string: "https://criptoya.com/api/dolar")!

    }
}
