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
    
    @Environment(\.navigationState) private var navigationState
    @State private var categoryVM = CategoryViewModel(httpClient: HTTPClient())

    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environment(\.navigationState, NavigationState())
                .environment(categoryVM)
        }
    }
}
