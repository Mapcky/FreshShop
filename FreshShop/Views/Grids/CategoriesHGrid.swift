//
//  CategoriesHGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CategoriesHGrid: View {
    // MARK: - DEVELOPMENT CATEGORIES
        
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    @Environment(CategoryViewModel.self) private var categoryVM
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
                ForEach(categoryVM.categories.prefix(6), id:\.self) { category in
                    VStack {
                        ZStack {
                            Color("LightGreenGridBackground")
                            
                            AsyncImage(url: URL(string: category.imageUrl)) { img in
                                img.resizable()
                                    .scaledToFit()
                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 6, y: 8)
                            } placeholder: {
                                Image(systemName: "cart")
                            }
                            
                            
                        }//: ZSTACK
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text(category.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                    }//: VSTACK
                    .onTapGesture {
                        withAnimation(nil){
                            navigationState.animatingTop = true
                        }
                        withAnimation(){
                            //navigationState.path.append(Route.categories(category.name))
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
        .environment(CategoryViewModel(httpClient: .development))
}
