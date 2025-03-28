//
//  OrderScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct OrderScreen: View {
    var body: some View {
        ScrollView {
            ForEach(1...4, id:\.self) { item in
                OrderItemsView()
            }
            
        }//: Scroll
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    OrderScreen()
}
