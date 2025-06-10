//
//  PopularProductsHGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct PopularProductsHGrid: View {
    
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    private var topProductsVM = TopRatedProductsViewModel(httpClient: HTTPClient())

    private let rowSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
    }
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: rowSpacing, content: {
                ForEach(topProductsVM.topRatedProducts, id:\.self) { product in
                    VStack {
                        ZStack {
                            Color("LightGreenGridBackground")
                            
                            ImageLoader(urlString: product.imageUrl)
                        }//: ZSTACK
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text(product.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .lineLimit(2)
                    }//: VSTACK
                    .frame(maxWidth: 200)
                    .onTapGesture {
                        withAnimation(.linear) {
                            navigationState.path.append(Route.productDetail(product))
                            navigationState.animatingBot = true
                        }
                        withAnimation(nil) {
                            navigationState.animatingTop = true
                        }
                    }
                }
            })
        }//: SCROLL
        .task {
            do {
                try await topProductsVM.loadTopRated()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

 #Preview {
     PopularProductsHGrid()
         .environment(NavigationState())

 }

