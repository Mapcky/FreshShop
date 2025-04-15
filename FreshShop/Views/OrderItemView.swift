//
//  OrderItemView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct OrderItemView: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    let product: Product
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 12) {
            Image("ProductPlaceholder")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
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
            
            VStack (alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.subheadline)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text("Quantity number")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("$ Total Price")
                .font(.headline)
                .fontDesign(.rounded)
                .frame(width: 80, alignment: .trailing)
        }//: HSTACK
        .padding(.horizontal, 10)
        .frame(height: 90)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    OrderItemView(product: Product(id: 3, name: "Bananas",price: 100,quantity: 50, imageUrl: "xd",categoryId: 1))
        .environment(\.navigationState, NavigationState())
}
