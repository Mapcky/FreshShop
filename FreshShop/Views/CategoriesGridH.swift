//
//  CategoriesGridH.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CategoriesGridH: View {
    // MARK: - PROPERTIES
    private let rowSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
    }
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: rowSpacing, content: {
                ForEach(1...8, id:\.self) { item in
                    VStack {
                        ZStack {
                            Color("CategoriesBackground")
                            
                            Image(systemName: "cart.fill")
                        }//: ZSTACK
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text("Product \(item)")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                    }//: VSTACK
                }
            })
        }
    }
}

#Preview {
    CategoriesGridH()
}
