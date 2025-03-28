//
//  CategoriesHGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CategoriesHGrid: View {
    // MARK: - DEVELOPMENT CATEGORIES
    
    private let popularCategories = Array(productCategoriesArray.prefix(8))
    
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
/*
    @Binding var animatingTop: Bool
    @Binding var path: NavigationPath
  */
    
    private let rowSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
    }
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: rowSpacing, content: {
                ForEach(popularCategories, id:\.self) { item in
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
                        withAnimation(nil){
                            navigationState.animatingTop = true
                        }
                        withAnimation(){
                            navigationState.path.append(Route.categories(item))
                        }
                    }
                }//LOOP
            })//HGRID
        }//: SCROLL
    }
}

#Preview {
    CategoriesHGrid()
        .environment(\.navigationState, NavigationState())
}
