//
//  OrderItemsView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct OrderItemsView: View {
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "shippingbox")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            VStack {
                Text("Order N###")
                    .font(.subheadline)

                Text("$$$$")
                    .font(.caption)
            }
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    .background(Color.green.opacity(0.8))
                    .clipShape(Circle())
            })//: BUTTON
        }//: HSTACK
        .frame(height: 100)
        .padding(.horizontal, 10)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    OrderItemsView()
}
