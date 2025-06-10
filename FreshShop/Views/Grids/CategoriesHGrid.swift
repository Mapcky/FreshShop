//
//  CategoriesHGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CategoriesHGrid: View {
    
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    let categoryVM: CategoryViewModel
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
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                            
                            ImageLoader(urlString: category.imageUrl)
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                        }//: ZSTACK
                        .frame(width: 100, height: 100)
                        
                        Text(category.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .frame(width: 100)
                    }//: VSTACK
                    .onTapGesture {
                        withAnimation(nil){
                            navigationState.animatingTop = true
                        }
                        withAnimation(){
                            navigationState.path.append(Route.categories(category.id, category.name))
                        }
                    }
                }//LOOP
            })//HGRID
        }//: SCROLL
    }
}

#Preview {
    CategoriesHGrid(categoryVM: CategoryViewModel(httpClient: .development))
        .environment(NavigationState())
}
