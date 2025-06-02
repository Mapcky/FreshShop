//
//  AddressDetailViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 02/06/2025.
//

import Foundation

@MainActor
@Observable
class AddressDetailViewModel {
    private let address: Address
    
    init(address: Address) {
        self.address = address
    }
    
    // MARK: - COMPUTED PROPERTIES
    var street: String {
        return address.street
    }
    
    var city: String {
        return address.city
    }
    
    var state: String {
        return address.state
    }
    
    var country: String {
        return address.country
    }
    
    var zip: String {
        return address.zip
    }
    
    var isDefault: Bool {
        return address.isDefault
    }
}
