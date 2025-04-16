//
//  PopularProductsHGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct PopularProductsHGrid: View {
    
    // MARK: - DEVELOPMENT PRODUCTS
    let productsArray: [Product] = [Product(id: 1, name: "Fresh Orange",price: "100",quantity: 50, imageUrl: "xd",categoryId: 1),
        Product(id: 2, name: "Milk",price: "100",quantity: 50, imageUrl: "xd",categoryId: 1),
        Product(id: 3, name: "Bananas",price: "100",quantity: 50, imageUrl: "xd",categoryId: 1),
        Product(id: 4, name: "Strawberry",price: "100",quantity: 50, imageUrl: "xd",categoryId: 1),
        Product(id: 5, name: "Blueberry",price: "100",quantity: 50, imageUrl: "xd",categoryId: 1),
        Product(id: 6, name: "Lemon",price: "100",quantity: 50, imageUrl: "xd",categoryId: 1)]

    
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState

    private let rowSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
    }
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: rowSpacing, content: {
                ForEach(1...4, id:\.self) { item in
                    VStack {
                        ZStack {
                            Color("LightGreenGridBackground")
                            
                            Image(systemName: "cart.fill")
                        }//: ZSTACK
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text(String(item))
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                    }//: VSTACK
                    .onTapGesture {
                        withAnimation(.linear) {
                            //navigationState.path.append(Route.productDetail(item))
                            navigationState.animatingBot = true
                        }
                        withAnimation(nil) {
                            navigationState.animatingTop = true
                        }
                    }
                }
            })
        }//: SCROLL
    }

}

 #Preview {
     PopularProductsHGrid()
         .environment(\.navigationState, NavigationState())

 }

