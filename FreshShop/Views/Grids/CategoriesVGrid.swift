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
    
    private let columnSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 3)
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridLayout, spacing: columnSpacing, content: {
                ForEach(categoryVM.categories, id:\.self) { category in
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
