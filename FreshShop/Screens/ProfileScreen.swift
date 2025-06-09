//
//  ProfileScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/03/2025.
//

import SwiftUI

struct ProfileScreen: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    @Environment(UserViewModel.self) private var userVM
    @Environment(AddressViewModel.self) private var addressVM
    @Environment(CartViewModel.self) private var cartVM
    @Environment(OrderViewModel.self) private var orderVM
    
    //@State private var animatingLogout: Bool = false
    
    // MARK: - FUNCTIONS
    
    func logOut() {
        addressVM.emptyLocalAddresses()
        cartVM.emptyLocalCart()
        orderVM.emptyLocalOrders()
        userVM.logout()
        navigationState.restart()
    }
    
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName:"person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            VStack (spacing: 5){
                Text(userVM.fullName)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
                Text(verbatim: userVM.email)
                    .font(.footnote)
                    .fontDesign(.rounded)
                    .foregroundStyle(.gray)
            }//: VSTACK NAME & EMAIL
            
            ProfileButton(buttonImage: "person.fill", buttonTitle: "Account Information", action: {})
            
            ProfileButton(buttonImage: "map.fill", buttonTitle: "Delivery Adress", action: {
                navigationState.path.append(Route.userAddress)
            })
            
            ProfileButton(buttonImage: "creditcard.fill", buttonTitle: "Payment Method", action: {})
            
            ProfileButton(buttonImage: "person.2.badge.gearshape.fill", buttonTitle: "Support", action: {})
            
            Button(action: {
                withAnimation(.easeOut) {
                    logOut()
                }
            }, label: {
                ZStack {
                    HStack() {
                        Image(systemName: "power")
                            .padding(.horizontal, 15)
                        Spacer()
                    }//HSTACK
                    Text("Log Out")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }//: ZSTACK
                .padding(.horizontal, 10)
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
                .background(Color.red.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal, 5)
                .foregroundStyle(.black)
            })//: BUTTON
            
        }//:VSTACK
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    ProfileScreen()
        .environment(\.navigationState, NavigationState())
        .environment(UserViewModel(httpClient: .development))
        .environment(CartViewModel(httpClient: .development))
        .environment(OrderViewModel(httpClient: .development))
        .environment(AddressViewModel(httpClient: .development))
}
