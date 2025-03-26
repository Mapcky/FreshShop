//
//  ProductsVGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/03/2025.
//

import SwiftUI

struct ProductsVGrid: View {
    // MARK: - PROPERTIES
    @Binding var path: NavigationPath
    @Binding var animatingBot: Bool
    
    private let columnSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 2)
    }
    @State private var count: Int = 0
    // MARK: - BODY
    var body: some View {
            LazyVGrid(columns: gridLayout, spacing: columnSpacing, content: {
                ForEach(dairyProducts, id:\.self) { item in
                    VStack {
                        ZStack {
                            Color("LightGreenGridBackground")
                            
                            Image(systemName: "cart.fill")
                        }//: ZSTACK
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text(item.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        
                        Text(20, format: .currency(code: "USD"))
                    }//: VSTACK
                    .onTapGesture {
                        path.append(Route.productDetail(item))
                        animatingBot = true
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
    ProductsVGrid(path: .constant(NavigationPath()), animatingBot: .constant(false))
}
