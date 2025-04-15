//
//  OrderScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct OrderScreen: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("My Orders")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(1...4, id:\.self) { _ in
                        //OrderLittleView(order: orderExample)
                        Text("order xd")
                    }//:LOOP
                }//:LVSTACK
                .padding(.horizontal)
            }//: Scroll
        }//:VSTACK
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    OrderScreen()
}
