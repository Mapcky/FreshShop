//
//  OrderDetailView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 31/03/2025.
//

import SwiftUI

struct OrderDetailView: View {
    // MARK: - PROPERTIES
    //let order: Order
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            Text("Order #1234")
                .font(.title2)
                .fontWeight(.bold)
            
            List {
                Section {
                    ForEach(1...4, id: \.self) { item in
                        //OrderItemView(product: item)
                        Text("ordersItems")
                    }//:LOOP
                }//:SECTION
                .listRowSeparator(.hidden)
                
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
                .listRowSeparator(.hidden)
            }//:LIST
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }//: VSTACK
        .navigationBarBackButtonHidden()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    OrderDetailView()//order: orderExample)
}
