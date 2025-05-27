//
//  OrderDetailView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 31/03/2025.
//

import SwiftUI

struct OrderDetailView: View {
    // MARK: - PROPERTIES
    let orderDVM: OrderDetailViewModel
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Order #\(orderDVM.id)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                List {
                    Section {
                        ForEach(orderDVM.orderItems, id: \.self) { item in
                            OrderItemView(orderItemVM: OrderItemViewModel(orderItem: item))
                        }//:LOOP
                    }//:SECTION
                    .listRowSeparator(.hidden)
                    
                    Section {
                        HStack{
                            Spacer()
                            Text("$\(orderDVM.total)")
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
            .padding()
            .padding(.bottom, 80)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
        }//: Vstack
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
    }
}

#Preview {

    OrderDetailView(orderDVM: OrderDetailViewModel(
        order: Order(from: Cart(id: 1, userId: 1, cartItems: []))
    ))
}
