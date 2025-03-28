//
//  MainScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct MainScreen: View {
    // MARK: - PROPERTIES
    
    @State private var search: String = ""
    //@Environment(navigationState.self) private var navigationState
    
    @State private var animatingTop: Bool = false
    @State private var animatingBot: Bool = false
    @State private var path = NavigationPath()
    @State private var showingScreen: selectedScreen = .home
     
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("DarkGreen")
                .ignoresSafeArea()
            VStack {
                TopNavBar(animatingTop: $animatingTop, animatingBot: $animatingBot, path: $path, showingScreen: $showingScreen)
                // MARK: - END TOP DESIGN
                    NavigationStack(path: $path) {
                        ScrollView {
                            switch showingScreen {
                            case .home:
                                HomeScreen(animatingTop: $animatingTop, animatingBot: $animatingBot, path: $path, showingScreen: $showingScreen)
                                .padding(.bottom, 150)
                            case .orders:
                                OrderScreen()
                                    .padding(.horizontal, 15)
                                    .shadow(radius: 0.5)
                                    .padding(.top, 30)
                            case .deals:
                                ProductsVGrid(path: $path, animatingBot: $animatingBot)
                                    .padding(.horizontal, 15)
                                    .shadow(radius: 0.5)
                                    .padding(.top, 30)
                            case .more:
                                EmptyView()
                            case .profile:
                                ProfileScreen()
                                    .padding(.horizontal, 15)
                                    .shadow(radius: 0.5)
                                    .padding(.top, 30)
                                
                            case .cart:
                                CartView(path: $path, animatingTop: $animatingTop)
                                    .padding(.horizontal, 15)
                                    .shadow(radius: 0.5)
                                    .padding(.top, 30)
                            }//: SWITCH SCREENS
                        }//: SCROLL
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("LightGrayBackground"))
                        .clipShape(CustomTopShape())
                        .ignoresSafeArea()
                        .navigationDestination(for: Route.self) { route in
                            switch route {
                            case .productDetail(let product):
                                ProductDetailView(product: product)
                            case .categories(let category):
                                CategoryProductsView(path: $path, animatingBot: $animatingBot, productCategory: category)
                            case .allCategories:
                                CategoriesVGrid(path: $path, animatingTop: $animatingTop)
                            case .purchaseComplete:
                                PurchaseCompleteView(path: $path, showingScreen: $showingScreen, animatingTop: $animatingTop, animatingBot: $animatingBot)
                            }//: SWITCH
                        }//: NAV DESTINATION
                    }//: NAVSTACK
                    .clipShape(CustomTopShape())
                    .ignoresSafeArea()
            }//: VSTACK
            .navigationBarHidden(true)
        }//: ZSTACK
        // MARK: - ACTION BAR
        .overlay(alignment: .bottom) {
            BottomNavBar(animatingTop: $animatingTop, animatingBot: $animatingBot, path: $path, showingScreen: $showingScreen)
        } //:OVERLAY
        .ignoresSafeArea()
    }
    
}


struct Product: Hashable {
    let id: Int
    let name: String
}

struct ProductCategory: Hashable {
    let id: Int
    let name: String
}


#Preview {
    MainScreen()
        .environment(NavigationState())
}


