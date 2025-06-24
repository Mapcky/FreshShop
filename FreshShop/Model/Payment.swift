//
//  Payment.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 26/05/2025.
//

import Foundation

struct PaymentResponse: Codable {
    let success: Bool
}


struct GeneratePaymentIntentResponse: Codable {
    let paymentIntentClientSecret: String?
    let customerId: String?
    let customerEphemeralKeySecret: String?
    let publishableKey: String?
    
    private enum CodingKeys: String, CodingKey {
        case publishableKey
        case paymentIntentClientSecret = "paymentIntent"
        case customerId = "customer"
        case customerEphemeralKeySecret = "ephemeralKey"
    }
}
