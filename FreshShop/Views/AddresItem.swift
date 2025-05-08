//
//  AddresItem.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 08/05/2025.
//

import SwiftUI

struct AddresItem: View {
    // MARK: - PROPERTIES
    
    //Temporal Address struct
    struct Addres {
        let street: String
        let city: String
        let state: String
        let zipCode: Int
        let country: String
    }
    
    private var address = Addres(street: "BV San Juan 500", city: "Cordoba", state: "Cordoba", zipCode: 5000, country: "Argentina")
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(address.street)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("\(address.city), \(address.state) \(address.zipCode)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(address.country)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color("LightGray"))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    AddresItem()
}
