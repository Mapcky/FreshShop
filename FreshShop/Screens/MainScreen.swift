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
                                ProductsVGrid(path: $path, animatingBot: $animatingBot)
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
                                CartView()
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
                //.hidden()
        } //:OVERLAY
        .ignoresSafeArea()
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
    case productDetail(Product)
    case categories(ProductCategory)
    case allCategories
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
}


