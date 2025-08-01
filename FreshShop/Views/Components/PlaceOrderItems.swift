//
//  PlaceOrderItems.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 15/05/2025.
//

import SwiftUI

struct PlaceOrderItems: View {
    // MARK: - PROPERTIES
    @Environment(CartViewModel.self) private var cartVM
    var cartItemVM: CartItemViewModel
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 15) {
            ImageLoader(urlString: cartItemVM.productImage)
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
                .padding(.trailing, 10)
            
            VStack (alignment: .leading, spacing: 5) {
                Text(cartItemVM.productName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Text("\(String(cartItemVM.quantity)) x \(String(cartItemVM.unitPrice))")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("$ \(cartItemVM.total)")
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
    PlaceOrderItems(cartItemVM: CartItemViewModel(cartItem: CartItem(id: 1, product: Product(id: 1, name: "test", price: "30", quantity: 10, imageUrl: "", categoryId: 1, description: ""), unitPrice: "111")))
        .environment(CartViewModel(httpClient: .development))
}
