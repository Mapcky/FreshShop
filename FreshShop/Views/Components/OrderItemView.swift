//
//  OrderItemView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct OrderItemView: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    var orderItemVM: OrderItemViewModel
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 15) {
            ImageLoader(urlString: orderItemVM.productImage)
                .frame(width: 80, height: 80)
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .clear, .black, .black, .black, .black, .clear
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.trailing, 10)
            
            VStack (alignment: .leading, spacing: 5) {
                Text(orderItemVM.productName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Text("x \(String(orderItemVM.quantity))")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("$ \(String(orderItemVM.total))")
                .font(.headline)
                .fontDesign(.rounded)
        }//: HSTACK
        .padding(.horizontal, 10)
        .frame(height: 90)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    OrderItemView(orderItemVM: OrderItemViewModel(orderItem: OrderItem(from: CartItem(id: 1, product: Product(id: 3, name: "Bananas",price: "100",quantity: 50, imageUrl: "http://localhost:8080/api/assets/products/bakery/2.png",categoryId: 1, description: ""), quantity: 30))))
        .environment(NavigationState())
    
}
