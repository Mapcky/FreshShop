//
//  CartScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 24/03/2025.
//

import SwiftUI

struct CartScreen: View {
    // MARK: - PROPERTIES

    @Environment(NavigationState.self) private var navigationState
    @Environment(CartViewModel.self) private var cartVM

    // MARK: - BODY
    var body: some View {
        VStack{
            ForEach(cartVM.cartItems, id:\.self) { cartItem in
                CartItemView(cartItemVM: CartItemViewModel(cartItem: cartItem))
            }
            
            Spacer()
            
            HStack {
                Text("Total")
                
                Text("$ \(cartVM.total)")
            }
            .font(.title2)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .padding(.top, 10)
            
            Button(action:{
                navigationState.path.append(Route.placeOrder)

            }, label: {
                Text("Proceed to Checkout")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(cartVM.cartItems.isEmpty ? Color.gray : Color.green)
                    .cornerRadius(10)
                    .shadow(color: cartVM.cartItems.isEmpty ? .clear : Color.green.opacity(0.3), radius: 5, x: 0, y: 5)
                    .padding(.horizontal)
            })//: BUTTON
            .disabled(cartVM.cartItems.isEmpty)
        }//: VSTACK
        .task {
            if cartVM.cart == nil {
                try? await cartVM.loadCart()
            }
        }
    }
}

#Preview {
    CartScreen()
        .environment(NavigationState())
        .environment(CartViewModel(httpClient: .development))

}
