//
//  MainScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct MainScreen: View {
    // MARK: - ENVIRONMENT PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    @Environment(CartViewModel.self) private var cartVM
    @Environment(AddressViewModel.self) private var addressVM
    @Environment(OrderViewModel.self) private var orderVM
    
    // MARK: - PROPERTIES
    @State private var search: String = ""
    @State private var localPath = NavigationPath()
    private var categoryVM = CategoryViewModel(httpClient: HTTPClient())
    private var dealVM = DealViewModel(httpClient: HTTPClient())
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
                            HomeScreen(categoryVM: categoryVM)
                                .padding(.bottom, 150)
                        case .orders:
                            OrderScreen()
                                .padding(.horizontal, 15)
                                .shadow(radius: 0.5)
                                .padding(.top, 30)
                        case .deals:
                            DealScreen(dealVM: dealVM)
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
                            CartScreen()
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
                            ProductDetailScreen(productDetailVM: ProductDetailViewModel(product: product))
                        case .categories(
                            let categoryId,
                            let categoryName):
                            CategoryProductsView(selectedCategoryId: categoryId,selectedCategoryName: categoryName)
                            
                        case .allCategories:
                            CategoriesVGrid(categoryVM: categoryVM)
                        case .purchaseComplete:
                            PurchaseCompleteView()
                        case .orderDetail(
                            let order):
                            OrderDetailScreen(orderDVM: OrderDetailViewModel(order: order))
                        case .userAddress:
                            UserAddressesScreen()
                        case .setAddress:
                            DeliveryAdressView()
                        case .placeOrder:
                            PlaceOrderScreen()
                        case .creditCard:
                            CreditCardView()
                        case .setDefaultAddress:
                            UserAddressesList()
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
        .task() {
            do {
                try await categoryVM.loadCategories()
            } catch {
                print(error.localizedDescription)
            }
        }
        .task() {
            if cartVM.cart == nil {
                try? await cartVM.loadCart()
            }
        }
        .task() {
            if addressVM.addresses.isEmpty {
                try? await addressVM.getAddresses()
            }
        }
        .task{
            do {
                if orderVM.orders.isEmpty {
                    try await orderVM.loadOrders()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .task{
            do {
                if dealVM.deals.isEmpty {
                    try await dealVM.getActiveDeals()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .requiresAuthentication()
    }
}





#Preview {
    MainScreen()
        .environment(NavigationState())
        .environment(CartViewModel(httpClient: .development))
        .environment(AddressViewModel(httpClient: .development))
        .environment(UserViewModel(httpClient: .development))
        .environment(OrderViewModel(httpClient: .development))
        .environment(PaymentViewModel(httpClient: .development))
        
}
