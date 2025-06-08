//
//  UserAddressesScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/06/2025.
//

import SwiftUI

struct UserAddressesScreen: View {
    // MARK: - PROPERTIES
    @Environment(AddressViewModel.self) private var addressVM
    @Environment(\.navigationState) private var navigationState

    // MARK: - BODY
    var body: some View {
        
        VStack(alignment: .center, spacing: 15) {
            if addressVM.addresses.isEmpty {
                    Text("Looks like you haven’t added an address yet")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
            } else {
                ScrollView {
                    Text("User Addresses")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.green)
                    
                    ForEach (addressVM.addresses, id:\.self) { address in
                        AddressItem(addressDVM: AddressDetailViewModel(address: address))
                            .padding(.vertical, 15)
                            .padding(.horizontal)
                    }//: LOOP
                }//: SCROLL
                .padding()
                .padding(.bottom, 80)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            }//: IF ELSE
            GreenButton(title: addressVM.addresses.isEmpty ? "Add One Now" : "Add Another Address", action: {
                navigationState.path.append(Route.setAddress)
            })
        }//: VSTACK
            .frame(maxWidth: 300)
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 80)
    }
}

#Preview {
    UserAddressesScreen()
        .environment(\.navigationState, NavigationState())
        .environment(AddressViewModel(httpClient: .development))
}
