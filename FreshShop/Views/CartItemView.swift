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
            
            Spacer()
            VStack {
                Text(cartItemVM.productName)
                
                Text(cartItemVM.total)
            }
            Spacer()

            HStack(spacing: 10) {
                Button(action: {
                    if cartItemVM.quantity > 1 {
                        modifyQuantity(modifier: -1)
                    } else {
                        removeCartItem()
                    }
                }, label: {
                    Image(systemName: "minus")
                        .font(.system(size: 12, weight: .black, design: .rounded))
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Circle().fill(Color("ButtonsDarkGreen"))
                        )
                        .contentShape(Circle())
                })//: MINUS BUTTON
                
                Text(String(cartItemVM.quantity))
                        .font(.system(size: 16, weight: .black, design: .rounded))
                        .foregroundStyle(.black)
                
                Button(action: {
                    modifyQuantity(modifier: 1)
                }, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 12, weight: .black, design: .rounded))
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Capsule().fill(Color("ButtonsDarkGreen"))
                        )
                        .contentShape(Circle())
                })//: PLUS BUTTON
            }//BUTTON HSTACK
        }//:HSTACK
        .frame(height: 100)
        .padding(.horizontal, 10)
        .fontDesign(.rounded)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    CartItemView(cartItemVM: CartItemViewModel(cartItem: CartItem(id: 1, product: Product(id: 1, name: "test", price: "30", quantity: 10, imageUrl: "", categoryId: 1))))
        .environment(CartViewModel(httpClient: .development))
}
