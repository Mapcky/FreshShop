//
//  NavigationState.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 28/03/2025.
//

import SwiftUI
import Observation

@Observable
class NavigationState: ObservableObject {
    var path = NavigationPath()
    var animatingTop: Bool = false
    var animatingBot: Bool = false
    var showingScreen: selectedScreen = .home
    
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
    case productDetail(Product)
    case categories(Int, String)
    case allCategories
    case purchaseComplete
    case orderDetail(Int)
    case adress
}

extension EnvironmentValues {
    @Entry var navigationState = NavigationState()
}
