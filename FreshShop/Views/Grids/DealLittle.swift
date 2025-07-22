//
//  DealLittle.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/07/2025.
//

import SwiftUI

struct DealLittle: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    var dealDetailVM: DealDetailViewModel
    @State private var showingProducts: Bool = false
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            ImageLoader(urlString: dealDetailVM.deal.imageUrl)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            if showingProducts {
                   DealHGrid(dealItemsVM: DealItemViewModel(dealItems: dealDetailVM.deal.items))
            }
        }//:VSTACK
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 10)
        .onTapGesture(perform: {
            withAnimation(.bouncy) {
                showingProducts.toggle()
            }
        })//: GESTURE
    }//: BODY
}


#Preview {
    DealLittle(dealDetailVM: DealDetailViewModel(deal: Deal(id: 1, name: "Spring", startingDate: Calendar.current.date(from: DateComponents(year: 2025, month: 7, day: 16, hour: 10, minute: 30))!, finishDate: Calendar.current.date(from: DateComponents(year: 2025, month: 7, day: 18, hour: 10, minute: 30))!, type: "PERCENT", items: [], imageUrl: "/api/assets/deals/winter2025.png")))
        .environment(NavigationState())
}
