//
//  CartItemView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 24/03/2025.
//

import SwiftUI

struct CartItemView: View {
    // MARK: - PROPERTIES
    @State private var count: Int = 0
    /*
    var product: Product
    var quantity: Int
    var total: Float
    */
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "shippingbox")
                .resizable()
                .scaledToFit()
            
            Spacer()
            VStack {
                //Cart item properties
                //Item Name
                Text("Item Name")
                //Quantity
                Text("Quntity")
                    .font(.footnote)
                //Total
                Text("Total")
            }
            Spacer()

            HStack(spacing: 10) {
                Button(action: {
                    if count > 0 {
                        count -= 1
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
                })
                Button(action: {}, label: {
                    Text("\(String(count))")
                        .font(.system(size: 16, weight: .black, design: .rounded))
                        .foregroundStyle(.black)
                })
                Button(action: {
                    count += 1
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
                })
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
    CartItemView()
}
