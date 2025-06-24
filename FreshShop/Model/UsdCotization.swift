//
//  UsdCotization.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/06/2025.
//

import Foundation

struct UsdCotizationResponse: Codable {
    let tarjeta: Cotization
    let oficial: Cotization
}

struct Cotization: Codable {
    let price: Double
    let variation: Double
    let timestamp: Int
}
