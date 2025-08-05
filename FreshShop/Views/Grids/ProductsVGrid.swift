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
    let dealVM: DealViewModel
    let selectedCategoryId: Int
    
    var products: [Product] {
        productVM.productsByCategory[selectedCategoryId] ?? []
    }
    
    var dealProducts: [ProductWithDeal] {
        dealVM.productByCategory[selectedCategoryId] ?? []
    }
    
    var regularProducts: [Product] {
        let dealProductIds = Set(dealProducts.map { $0.product.id })
        let allProducts = productVM.productsByCategory[selectedCategoryId] ?? []
        return allProducts.filter { !dealProductIds.contains($0.id) }
    }
    
    //Grid Variables
    private let columnSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 2)
    }
    
    
    // MARK: - BODY
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: columnSpacing, content: {
            ForEach(dealProducts, id: \.self) { dealProduct in
                GridProductCard(productDVM: ProductDetailViewModel(product: dealProduct.product), dealValue: dealProduct.dealValue, dealNewPrice: dealProduct.dealNewPrice)
            }//: LOOP DEALS
            ForEach(regularProducts, id: \.self) { product in
                GridProductCard(productDVM: ProductDetailViewModel(product: product), dealValue: nil, dealNewPrice: nil)
            }
        })//: VGRID
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}


#Preview {
    ProductsVGrid(productVM: ProductViewModel(httpClient: .development), dealVM: DealViewModel(httpClient: .development), selectedCategoryId: 1)
        .environment(NavigationState())
}
