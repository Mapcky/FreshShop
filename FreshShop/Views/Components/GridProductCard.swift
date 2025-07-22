//
//  GridProductCard.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 22/07/2025.
//

import SwiftUI

struct GridProductCard: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    let productDVM: ProductDetailViewModel
    var isDeal: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                Color("LightGreenGridBackground")
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                ImageLoader(urlString: productDVM.imageUrl)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }//: ZSTACK
            .frame(height: 120)
            
            VStack {
                Text(productDVM.name)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: 120)
                    .frame(maxHeight: .infinity)

                
                Text(Double(productDVM.price) ?? 0, format: .currency(code: "ARS"))
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }//: VSTACK NAME
            .frame(maxHeight: .infinity)
        }//: VSTACK
        .frame(height: 220)
        .onTapGesture {
            navigationState.path.append(Route.productDetail(productDVM.product))
            navigationState.animatingBot = true
        }//: TAP GESTURE
    }
}

#Preview {
    GridProductCard(productDVM: ProductDetailViewModel(product: Product(id: 1, name: "", price: "100", quantity: 120, imageUrl: "", categoryId: 1, description: "", rate: 1)), isDeal: true)
}
