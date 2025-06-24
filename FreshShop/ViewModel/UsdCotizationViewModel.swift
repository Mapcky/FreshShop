//
//  UsdCotizationViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/06/2025.
//

import Foundation

@MainActor
@Observable
class UsdCotizationViewModel {
    private(set) var cotizationTarjeta: Cotization?
    private(set) var cotizationOficial: Cotization?
    var httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    func getCotization() async throws {
        
        let resource = Resource(url: Constants.Urls.getUsdCotization, modelType: UsdCotizationResponse.self)
        
        let response = try? await httpClient.load(resource)
        
        guard let response = response else { return }
        
        self.cotizationTarjeta = response.tarjeta
        self.cotizationOficial = response.oficial
        
    }
    
}
