//
//  PlaceOrderScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import SwiftUI

struct PlaceOrderScreen: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    @Environment(CartViewModel.self) private var cartVM
    @Environment(AddressViewModel.self) private var addressVM
    @Environment(UserViewModel.self) private var userVM

    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15) {
                Text("Place your order")
                    .font(.title)
                Divider()
                VStack(alignment: .leading, spacing: 20) {
                    if addressVM.addresses.isEmpty {
                        
                        Text("Looks like you haven’t added an address yet")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            
                        GreenButton(title: "Add One Now", action: {
                            navigationState.path.append(Route.setAddress)
                            
                        })
                        .padding(.horizontal)
                        
                    } else {
                        Text("Ship to \(userVM.firstName)")
                            .font(.title2)
                            .bold()
                        AddressItem(addressDVM: AddressDetailViewModel(address: addressVM.defaultAddress!))
                    }//: ELSE
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
                    })//: BUTTON CCARD
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 5)
                    .padding(.vertical)
                    
                    Button(action:{

                    }, label: {
                        Text("Pay with")
                        Text("stripe")
                            .fontWeight(.black)
                    })//: BUTTON STRIPE
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("stripeColor"))
                    .cornerRadius(10)
                    .shadow(color:  Color("stripeColor"), radius: 5, x: 0, y: 5)
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
    PlaceOrderScreen()
        .environment(\.navigationState, NavigationState())
        .environment(CartViewModel(httpClient: .development))
        .environment(AddressViewModel(httpClient: .development))
        .environment(UserViewModel(httpClient: .development))

}
