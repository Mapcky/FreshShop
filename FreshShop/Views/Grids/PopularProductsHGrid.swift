//
//  PopularProductsHGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct PopularProductsHGrid: View {
    
    // MARK: - DEVELOPMENT PRODUCTS
    let productsArray: [Product] = [Product(id: 1, name: "Fresh Orange"), Product(id: 2, name: "Milk"), Product(id: 3, name: "Bananas"), Product(id: 4, name: "Strawberry"), Product(id: 5, name: "Blueberry"), Product(id: 6, name: "Lemon")]
    
    // MARK: - PROPERTIES
    @Binding var path: NavigationPath
    private let rowSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
    }
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: rowSpacing, content: {
                ForEach(productsArray, id:\.self) { item in
                    VStack {
                        ZStack {
                            Color("LightGreenGridBackground")
                            
                            Image(systemName: "cart.fill")
                        }//: ZSTACK
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text(item.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                    }//: VSTACK
                    .onTapGesture {
                        path.append(Route.productDetail(item))
                    }
                }
            })
        }//: SCROLL
    }

}
/*
 #Preview {
 PopularProductsHGrid()
 }
 */
