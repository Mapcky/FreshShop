//
//  ProductsVGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/03/2025.
//

import SwiftUI

struct ProductsVGrid: View {
    // MARK: - PROPERTIES
    
    @Environment(NavigationState.self) private var navigationState
    let productVM: ProductViewModel
    let selectedCategoryId: Int
    
    var products: [Product] {
        productVM.productsByCategory[selectedCategoryId] ?? []
    }
    
    //Grid Variables
    private let columnSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 2)
    }
    
    
    // MARK: - BODY
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: columnSpacing, content: {
            ForEach(products, id:\.self) { product in
                VStack {
                    ZStack {
                        Color("LightGreenGridBackground")
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        
                        ImageLoader(urlString: product.imageUrl)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }//: ZSTACK
                    .frame(height: 120)
                    
                    VStack {
                        Text(product.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .frame(width: 120)
                        
                        Text(Double(product.price) ?? 0, format: .currency(code: "ARS"))
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }//: VSTACK NAME
                }//: VSTACK
                .onTapGesture {
                    navigationState.path.append(Route.productDetail(product))
                    navigationState.animatingBot = true
                }
            }
        })
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}


#Preview {
    ProductsVGrid(productVM: ProductViewModel(httpClient: .development), selectedCategoryId: 1)
        .environment(NavigationState())
}
