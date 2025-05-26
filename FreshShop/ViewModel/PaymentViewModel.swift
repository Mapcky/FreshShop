//
//  PaymentViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 26/05/2025.
//

import Foundation

@MainActor
@Observable
class PaymentViewModel {
    var paymentStatus: Bool?
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    func creditCardPayment(totalAmount: String) async throws {
        let body = ["totalAmount" : totalAmount]
        
        let bodyData = try JSONEncoder().encode(body)
        
        let resource = Resource(url: Constants.Urls.paymentCreditCard, method: .post(bodyData), modelType: PaymentResponse.self)
        
        let response = try await httpClient.load(resource)
        
        paymentStatus = response.success
            
    }
    
}
