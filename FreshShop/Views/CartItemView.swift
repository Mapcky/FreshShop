//
//  CartItemView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 24/03/2025.
//

import SwiftUI

struct CartItemView: View {
    // MARK: - PROPERTIES
    @Environment(CartViewModel.self) private var cartVM
    var cartItemVM: CartItemViewModel
    
    // MARK: - FUNCTIONS
    
    func modifyQuantity(modifier: Int) {
        Task {
            try await cartVM.addItemToCart(productId: cartItemVM.productId, quantity: modifier)
        }
    }
    
    func removeCartItem(){
        Task {
            try await cartVM.removeItemFromCart(cartItemId: cartItemVM.id)
        }
    }
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ImageLoader(urlString: cartItemVM.productImage)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(cartItemVM.productName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Text(cartItemVM.total)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkGreen"))
            }//:VSTACK LEFT PART
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(spacing: 12) {
                Button(action: {
                    if cartItemVM.quantity > 1 {
                        modifyQuantity(modifier: -1)
                    } else {
                        removeCartItem()
                    }
                }, label: {
                    Image(systemName: "minus")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                        .background(Circle().fill(Color("ButtonsDarkGreen")))
                })//:MINUS BUTTON
                
                Text(String(cartItemVM.quantity))
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .frame(width: 28, alignment: .center)
                
                Button(action: {
                    modifyQuantity(modifier: 1)
                }, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                        .background(Circle().fill(Color("ButtonsDarkGreen")))
                })//: PLUS BUTTON
            }//: BUTTON HSTACK
        }//: HSTACK
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    CartItemView(cartItemVM: CartItemViewModel(cartItem: CartItem(id: 1, product: Product(id: 1, name: "test", price: "30", quantity: 10, imageUrl: "", categoryId: 1, description: ""))))
        .environment(CartViewModel(httpClient: .development))
}
