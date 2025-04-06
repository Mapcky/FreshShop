//
//  OrderLittleView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct OrderLittleView: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    let order: Order

    // MARK: - BODY
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "shippingbox")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Order N###")
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text("Total $$$$")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            
            Button(action: {
                navigationState.path.append(Route.orderDetail(order))
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.green)
                    .clipShape(Circle())
                    .shadow(radius: 3)
            })//: BUTTON
        }//: HSTACK
        .padding(12)
        .frame(height: 90)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    OrderLittleView(order: orderExample)
        .environment(\.navigationState, NavigationState())
}
