//
//  AddressViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 30/05/2025.
//

import Foundation

@MainActor
@Observable
class AddressViewModel {
    
    private(set) var addresses: [Address] = []
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getAddresses() async throws {
        let resource = Resource(url: Constants.Urls.getAddresses, modelType: GetAddressResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success {
            self.addresses = response.addresses
        } else {
            print(response.message ?? "An error occurred while retrieving the address information from the server")
        }
    }
    
    
    func newAddress(newAddress :Address) async throws {

        let bodyData = try JSONEncoder().encode(newAddress)
        
        let resource = Resource(url: Constants.Urls.newAddress, method: .post(bodyData), modelType: SetAddressResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success, let address = response.address {
            self.addresses.append(address)
        } else {
            print(response.message ?? "An error occurred while setting a new address")
        }
    }
    
    var defaultAddress: Address? {
        return addresses.first { $0.isDefault }
    }
    
}
