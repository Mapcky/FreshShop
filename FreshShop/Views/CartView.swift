//
//  CartView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 24/03/2025.
//

import SwiftUI

struct CartView: View {
    // MARK: - PROPERTIES

    @Environment(\.navigationState) private var navigationState
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
                navigationState.animatingTop = false
                navigationState.path.append(Route.purchaseComplete)
            }, label: {
                Text("Proceed to Checkout")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Capsule().fill(Color("ButtonsDarkGreen")))
                    .foregroundStyle(.white)
                    .padding()
                    .contentShape(Capsule())
            })//: BUTTON
        }//: VSTACK
        .task {
            try? await cartVM.loadCart()
        }
    }
}

#Preview {
    CartView()
        .environment(\.navigationState, NavigationState())
        .environment(CartViewModel(httpClient: .development))

}
