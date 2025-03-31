//
//  OrderDetailView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 31/03/2025.
//

import SwiftUI

struct OrderDetailView: View {
    // MARK: - PROPERTIES
    let order: Order
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            Text("Order #1234")
                .font(.title2)
                .fontWeight(.bold)
            
            List {
                Section {
                    ForEach(order.orderItems, id: \.self) { item in
                        OrderItemView(product: item)
                    }//:LOOP
                }//:SECTION
                Section {
                    HStack{
                        Spacer()
                        Text("$$$ Total")
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }//:HSTACK
                }//:SECTION
            }//:LIST
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            

        }//: VSTACK
        .navigationBarBackButtonHidden()
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    OrderDetailView(order: orderExample)
}
