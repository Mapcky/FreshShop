//
//  DealItemViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 16/07/2025.
//

import Foundation

@MainActor
@Observable
class DealItemViewModel {
    private(set) var dealItems: [DealItem] = []
    
    
    init(dealItems: [DealItem]) {
        self.dealItems = dealItems
    }
    

    
    
}
