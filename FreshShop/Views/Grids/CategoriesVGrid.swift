//
//  CategoriesVGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/03/2025.
//

import SwiftUI

struct CategoriesVGrid: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    @Environment(CategoryViewModel.self) private var categoryVM
    
    private let columnSpacing: CGFloat = 12
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 3)
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridLayout, spacing: columnSpacing, content: {
                ForEach(categoryVM.categories, id:\.self) { category in
                    VStack(spacing: 8) {
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
                        navigationState.path.append(Route.categories(category.id, category.name))
                    }
                }
            })//:VGRID
            .padding()
            .padding(.bottom, 80)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
        }//:SCROLL
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CategoriesVGrid()
        .environment(\.navigationState, NavigationState())
        .environment(CategoryViewModel(httpClient: .development))
    
}
