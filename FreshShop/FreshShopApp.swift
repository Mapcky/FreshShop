//
//  FreshShopApp.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

@main
struct FreshShopApp: App {
    // MARK: - PROPERTIES
    
    @State private var navigationState = NavigationState()
    @State private var cartVM = CartViewModel(httpClient: HTTPClient())
    @State private var orderVM = OrderViewModel(httpClient: HTTPClient())
    @State private var addressVM = AddressViewModel(httpClient: HTTPClient())
    @State private var userVM = UserViewModel(httpClient: HTTPClient())
    
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environment(navigationState)
                .environment(cartVM)
                .environment(orderVM)
                .environment(addressVM)
                .environment(userVM)
        }
    }
}
