//
//  DealScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/07/2025.
//

import SwiftUI

struct DealScreen: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    var dealVM: DealViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ForEach(dealVM.deals, id: \.self) { deal in
                DealLittle(dealDetailVM: DealDetailViewModel(deal: deal))
            }//: LOOP
        }//: VSTACK
        .padding(.bottom, 80)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DealScreen(dealVM: DealViewModel(httpClient: .development))
        .environment(NavigationState())
}
