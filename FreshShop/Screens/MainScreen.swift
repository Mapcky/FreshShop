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
    @Environment(\.navigationState) private var navigationState
    @State private var localPath = NavigationPath()
    @Environment(CategoryViewModel.self) private var categoryVM

    /*@State private var animatingTop: Bool = false
    @State private var animatingBot: Bool = false
    @State private var path = NavigationPath()
    @State private var showingScreen: selectedScreen = .home
     */
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("DarkGreen")
                .ignoresSafeArea()
            VStack {
                TopNavBar()
                // MARK: - END TOP DESIGN
                NavigationStack(path: $localPath) {
                        ScrollView {
                            switch navigationState.showingScreen {
                            case .home:
                                HomeScreen()
                                .padding(.bottom, 150)
                            case .orders:
                                OrderScreen()
                                    .padding(.horizontal, 15)
                                    .shadow(radius: 0.5)
                                    .padding(.top, 30)
                            case .deals:
                                ProductsVGrid()
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
                                CategoryProductsView( productCategory: category)
                            case .allCategories:
                                CategoriesVGrid()
                            case .purchaseComplete:
                                PurchaseCompleteView()
                            case .orderDetail(let order):
                                OrderDetailView(order: order)
                            }//: SWITCH
                        }//: NAV DESTINATION
                        .onChange(of: navigationState.path, {
                            localPath = navigationState.path
                        })
                        .onChange(of: localPath, {
                            navigationState.path = localPath
                        })
                    }//: NAVSTACK
                    .clipShape(CustomTopShape())
                    .ignoresSafeArea()
            }//: VSTACK
            .navigationBarHidden(true)
        }//: ZSTACK
        // MARK: - ACTION BAR
        .overlay(alignment: .bottom) {
            BottomNavBar()
        } //:OVERLAY
        .ignoresSafeArea()
        .task {
            try? await categoryVM.loadCategories()
        }
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

struct Order: Hashable {
    let id: Int
    var orderItems: [Product] //use order items in future
}


#Preview {
    MainScreen()
        .environment(\.navigationState, NavigationState())
        .environment(CategoryViewModel(httpClient: .development))
}


