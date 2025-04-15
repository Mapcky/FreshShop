//
//  ProductsVGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/03/2025.
//

import SwiftUI

struct ProductsVGrid: View {
    // MARK: - PROPERTIES

    @Environment(\.navigationState) private var navigationState
    @Environment(ProductViewModel.self) private var productVM
    var selectedCategoryId: Int
    
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
                            
                            Image(systemName: "cart.fill")
                        }//: ZSTACK
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text(product.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        
                        Text(product.price, format: .currency(code: "ARS"))
                    }//: VSTACK
                    .onTapGesture {
                        navigationState.path.append(Route.productDetail(4))//productId change
                        navigationState.animatingBot = true
                    }
                }
            })
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))

        .onChange(of: products,
                  { for product in products {
                      print(product.name)
                  }
        })
        
    }
}


#Preview {
    ProductsVGrid(selectedCategoryId: 1)
        .environment(\.navigationState, NavigationState())
        .environment(ProductViewModel(httpClient: .development))
}
