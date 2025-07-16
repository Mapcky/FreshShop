//
//  DealDetailViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 16/07/2025.
//

import Foundation

@MainActor
@Observable
class DealDetailViewModel {
    private(set) var deal: Deal
    
    init(deal: Deal) {
        self.deal = deal
    }
}
