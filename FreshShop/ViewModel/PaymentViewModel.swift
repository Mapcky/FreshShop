//
//  PaymentViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 26/05/2025.
//

import Foundation
import Stripe
import StripePaymentSheet

enum PaymentServiceError: Error {
    case missingPaymentDetails
}

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
    
    func preparePaymentSheet(totalAmount: Double) async throws -> PaymentSheet {
        
        let body = ["totalAmount": totalAmount]
        let bodyData = try JSONEncoder().encode(body)
        
        let resource = Resource(url: Constants.Urls.generateStripePaymentIntent, method: .post(bodyData), modelType: GeneratePaymentIntentResponse.self)
                
        let response = try await httpClient.load(resource)
        
        guard let customerId = response.customerId,
              let customerEphemeralKeySecret = response.customerEphemeralKeySecret,
              let paymentIntentClientSecret = response.paymentIntentClientSecret else {
            throw PaymentServiceError.missingPaymentDetails
        }

        STPAPIClient.shared.publishableKey = response.publishableKey
                
        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = "FreshShop"
        configuration.customer = .init(id: customerId, ephemeralKeySecret: customerEphemeralKeySecret)

        return PaymentSheet(
            paymentIntentClientSecret: paymentIntentClientSecret, configuration: configuration
        )
        
    }
    
}
