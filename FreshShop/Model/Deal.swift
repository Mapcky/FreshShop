//
//  Deal.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 10/07/2025.
//

import Foundation

struct Deal: Codable, Hashable {
    let id: Int
    let name: String
    let startingDate: Date
    let finishDate: Date
    let type: String
    var items: [DealItem]
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, type, items
        case startingDate = "starting_date"
        case finishDate = "finish_date"
        case imageUrl = "image_url"
    }
}

struct DealItem: Codable, Hashable {
    let id: Int
    let dealId: Int
    let productId: Int
    let value: String
    var product: Product
    
    private enum CodingKeys: String, CodingKey {
        case id, value
        case productId = "product_id"
        case dealId = "deal_id"
        case product = "Product"
    }
}

struct DealResponse: Codable {
    var deals: [Deal] = []
    var message: String?
    var success: Bool
}



