//
//  CartViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/04/2025.
//

import Foundation
import SwiftUI

@MainActor
@Observable
class CartViewModel {
    var cart: Cart?
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadCart() async throws {
        let resource = Resource(url: Constants.Urls.loadCart, modelType: CartResponse.self)
        let response = try await httpClient.load(resource)
        
        if response.success, let cart = response.cart {
            self.cart = cart
        } else {
            print(response.message ?? "Fail during loading cart")
        }
        
    }
    
    
    func addItemToCart(productId: Int, quantity: Int) async throws {
        let body = ["productId" : productId, "quantity" : quantity]
        
        let bodyData = try JSONEncoder().encode(body)
        
        let resouce = Resource(url: Constants.Urls.addCartItems, method: .post(bodyData), modelType: AddCartItemResponse.self)
        
        let response = try await httpClient.load(resouce)
        
        if let cartItem = response.cartItem, response.success {
            if let index = cart?.cartItems.firstIndex(where: { $0.id == cartItem.id }) {
                cart?.cartItems[index] = cartItem
            } else {
                cart?.cartItems.append(cartItem)
            }
        }
        else {
            print(response.message ?? "Fail adding an item to the cart")
        }
    }
    
    func removeItemFromCart(cartItemId: Int) async throws {
        
        let resouce = Resource(url: Constants.Urls.removeCartItems(cartItemId), method: .delete, modelType: CartItemRemoveResponse.self)
        
        let response = try await httpClient.load(resouce)
        
        if  response.success {
            if let index = cart?.cartItems.firstIndex(where: { $0.id == cartItemId }) {
                cart?.cartItems.remove(at: index)
            }
        }
        else {
            print(response.message ?? "Fail removing an item from the cart")
        }
    }
    
    // MARK: - COMPUTED PROPERTIES
    var cartItems: [CartItem] {
        return cart?.cartItems ?? []
    }
    
    var total: String {
        guard let items = cart?.cartItems else { return "0" }
        
        let totalValue: Double = items.reduce(0.0) { result, cartItem in
            let price = Double(cartItem.product.price) ?? 0
            let quantity = Double(cartItem.quantity)
            return result + price * quantity
        }
        
        return String(format: "%.2f", totalValue)
    }
    
    var cartItemsQuantity: Int {
        cart?.cartItems.reduce(0, { total, item in
            total + item.quantity
        }) ?? 0
    }
    
}
