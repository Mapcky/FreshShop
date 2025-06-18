//
//  UserAddressesList.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/06/2025.
//

import SwiftUI

struct UserAddressesList: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    @Environment(AddressViewModel.self) private var addressVM
    @State private var selectedAddressId: Int? = nil
    @State private var selectedAddressStreet: String = ""
    
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                Text("User Addresses")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.green)
                
                ForEach (addressVM.addresses, id:\.self) { address in
                    AddressItem(addressDVM: AddressDetailViewModel(address: address))
                        .padding(.vertical, 15)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(selectedAddressId == address.id ? .green : .clear, lineWidth: 3)
                        )
                        .onTapGesture {
                            selectedAddressId = address.id
                            selectedAddressStreet = address.street
                        }
                    
                }//: LOOP
            }//: VSTACK
            GreenButton(title: selectedAddressId == nil ? "Choose One Address" : "Set \(selectedAddressStreet) as default", action: {
                Task {
                    do {
                        try await addressVM.newDefaultAddress(addressId: selectedAddressId!)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                navigationState.path.removeLast()
            })
        }//: SCROLL
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    UserAddressesList()
        .environment(AddressViewModel(httpClient: .development))
        .environment(NavigationState())
}
