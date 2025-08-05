//
//  NavigationState.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 28/03/2025.
//

import SwiftUI
import Observation

@MainActor
@Observable
class NavigationState: ObservableObject {
    var path = NavigationPath()
    var animatingTop: Bool = false
    var animatingBot: Bool = false
    var showingScreen: selectedScreen = .home
    
    init() {
        
    }
    
    func restart() {
        self.path = NavigationPath()
        self.animatingTop = false
        self.animatingBot = false
        self.showingScreen = .home
    }
    
    func goBack() {
        animatingBot = false

        if !path.isEmpty {
            path.removeLast()

            if path.isEmpty && showingScreen == .home {
                animatingTop = false
            }
        } else {
            animatingTop = false
            showingScreen = .home
        }
    }
    
}

enum selectedScreen {
    case home
    case orders
    case deals
    case more
    case profile
    case cart
}

// MARK: - Route Working on
enum Route: Hashable {
    case productDetail(Product, String?, String?)
    case categories(Int, String)
    case allCategories
    case purchaseComplete
    case orderDetail(Order)
    case userAddress
    case setAddress
    case setDefaultAddress
    case placeOrder
    case creditCard
    
}

