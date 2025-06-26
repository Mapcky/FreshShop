//
//  OrderScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct OrderScreen: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    @Environment(OrderViewModel.self) private var orderVM
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("My Orders")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView {
                OrderLittleView()
            }//: Scroll
            
        }//:VSTACK
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .task() {
            do {
                if orderVM.orders.isEmpty {
                    try await orderVM.loadOrders()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    OrderScreen()
        .environment(NavigationState())
        .environment(OrderViewModel(httpClient: .development))
}
