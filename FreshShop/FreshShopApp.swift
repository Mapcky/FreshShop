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
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environment(navigationState)
        }
    }
}
