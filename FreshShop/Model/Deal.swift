//
//  Deal.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 10/07/2025.
//

import Foundation

struct Deal: Codable {
    let id: Int
    let name: String
    let startingDate: Date
    let finishDate: Date
    let type: String
    let items: [DealItem]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, type, items
        case startingDate = "starting_date"
        case finishDate = "finish_date"
    }
}

struct DealItem: Codable {
    let id: Int
    let dealId: Int
    let productId: Int
    let value: String
    
    private enum CodingKeys: String, CodingKey {
        case id, value
        case productId = "product_id"
        case dealId = "deal_id"
    }
}

struct DealResponse: Codable {
    let deals: [Deal]?
    let message: String?
    let success: Bool
}



