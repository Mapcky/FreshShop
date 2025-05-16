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
    @Environment(CartViewModel.self) private var cartVM
    
    
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
                            ProductsVGrid(selectedCategoryId: 1)
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
                        case .productDetail(
                            let product):
                            ProductDetailView(productDetailVM: ProductDetailViewModel(product: product))
                        case .categories(
                            let categoryId,
                            let categoryName):
                            CategoryProductsView(selectedCategoryId: categoryId,selectedCategoryName: categoryName)
                            
                        case .allCategories:
                            CategoriesVGrid()
                        case .purchaseComplete:
                            PurchaseCompleteView()
                        case .orderDetail(
                            let order):
                            //  OrderDetailView(order: order)
                            EmptyView()
                        case .address:
                            DeliveryAdressView()
                        case .placeOrder:
                            PlaceOrderView()
                        case .creditCard:
                            CreditCardView()
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
        .task {
            try? await cartVM.loadCart()
        }
    }
}





#Preview {
    MainScreen()
        .environment(\.navigationState, NavigationState())
        .environment(CategoryViewModel(httpClient: .development))
        .environment(ProductViewModel(httpClient: .development))
        .environment(CartViewModel(httpClient: .development))
}
