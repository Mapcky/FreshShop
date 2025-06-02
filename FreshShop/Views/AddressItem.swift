//
//  AddressItem.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 08/05/2025.
//

import SwiftUI

struct AddressItem: View {
    // MARK: - PROPERTIES
    
    var addressDVM: AddressDetailViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(addressDVM.street)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("\(addressDVM.city), \(addressDVM.state) \(addressDVM.zip)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(addressDVM.country)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        //.padding()
        .background(Color("LightGray"))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    AddressItem(addressDVM: AddressDetailViewModel(address: Address(street: "BV San Juan 500", city: "Cordoba", state: "Cordoba", country: "Argentina", zip: "5000", isDefault: false)))
}
