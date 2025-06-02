//
//  PlaceOrderView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import SwiftUI

struct PlaceOrderView: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    @Environment(CartViewModel.self) private var cartVM
    @Environment(AddressViewModel.self) private var addressVM

    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15) {
                Text("Place your order")
                    .font(.title)
                Divider()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Ship to |User name|")
                        .font(.title2)
                        .bold()
                    
                    AddressItem(addressDVM: AddressDetailViewModel(address: addressVM.defaultAddress!))
                }//: VSTACK
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                
                Text("Your order content")
                    .font(.title2)
                    Divider()
                ForEach(cartVM.cartItems, id: \.self) { cartItem in
                    PlaceOrderItems(cartItemVM: CartItemViewModel(cartItem: cartItem))
                    
                }//: LOOP
                HStack {
                    Text("Total")
                    
                    Text("$ \(cartVM.total)")
                }
                .bold()
                
                VStack(spacing: 5) {
                    Button(action:{
                        navigationState.path.append(Route.creditCard)
                    }, label: {
                        Image(systemName: "creditcard")
                        Text("Pay with credit card")
                    })//: BUTTON
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Capsule().fill(Color("ButtonsDarkGreen")))
                    .foregroundStyle(.white)
                    .padding()
                    .contentShape(Capsule())
                    
                    Button(action:{

                    }, label: {
                        Text("Pay with")
                        Text("stripe")
                            .fontWeight(.black)
                    })//: BUTTON
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Capsule().fill(Color("stripeColor")))
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .contentShape(Capsule())
                }//:VSTACK
                
            }//: VSTACK
            .padding()
            .padding(.bottom, 80)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
        }//: SCROLL
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    PlaceOrderView()
        .environment(\.navigationState, NavigationState())
        .environment(CartViewModel(httpClient: .development))
        .environment(AddressViewModel(httpClient: .development))
}
