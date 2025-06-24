//
//  PlaceOrderScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import SwiftUI
import StripePaymentSheet


struct PlaceOrderScreen: View {
    // MARK: - PROPERTIES
    
    @Environment(NavigationState.self) private var navigationState
    @Environment(CartViewModel.self) private var cartVM
    @Environment(AddressViewModel.self) private var addressVM
    @Environment(UserViewModel.self) private var userVM
    @Environment(OrderViewModel.self) private var orderVM
    @Environment(PaymentViewModel.self) private var paymentVM
    private let cotizationVM = UsdCotizationViewModel(httpClient: HTTPClient())
    @State private var paymentSheet: PaymentSheet?
    @State private var cotizatioGotten: Bool = false

    // MARK: - FUNCTIONS
    
    private func paymentCompletion(result: PaymentSheetResult) {
        switch result {
        case .completed:
            Task {
                do {

                    guard let order = orderVM.createLocalOrder(from: cartVM) else {
                        return
                    }
                    
                    try await orderVM.generateOrder(order: order)

                    cartVM.emptyLocalCart()

                    navigationState.path.append(Route.purchaseComplete)

                } catch {
                    print(error.localizedDescription)
                }
            }
        case .canceled:
            print("Payment canceled")
        case .failed(error: let error):
            print(error)
        }
    }

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
                    
                    if let paymentSheet {
                        PaymentSheet.PaymentButton(paymentSheet: paymentSheet, onCompletion: paymentCompletion) {
                            HStack {
                                Text("Pay with")
                                Text("stripe")
                                    .fontWeight(.black)
                            }
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("stripeColor"))
                            .cornerRadius(10)
                            .shadow(color:  Color("stripeColor"), radius: 5, x: 0, y: 5)
                            
                        }//: STRIPE BUTTON
                    }
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
        .task {
            do {
                try await cotizationVM.getCotization()
                cotizatioGotten = true
            } catch {
                print(error.localizedDescription)
            }
        }
        .onChange(of: cotizatioGotten) {
            Task {
                do {
                    guard let dolarTarjeta = cotizationVM.cotizationTarjeta?.price else { return }
                    let totalCart = Double(cartVM.total)
                    let totalAmount = (totalCart ?? 0)/dolarTarjeta
                    paymentSheet = try await paymentVM.preparePaymentSheet(totalAmount: totalAmount)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    PlaceOrderScreen()
        .environment(NavigationState())
        .environment(CartViewModel(httpClient: .development))
        .environment(AddressViewModel(httpClient: .development))
        .environment(UserViewModel(httpClient: .development))
        .environment(OrderViewModel(httpClient: .development))
        .environment(PaymentViewModel(httpClient: .development))


}
