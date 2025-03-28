//
//  CategoriesVGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/03/2025.
//

import SwiftUI

struct CategoriesVGrid: View {
    // MARK: - PROPERTIES
    /*
    @Binding var path: NavigationPath
    @Binding var animatingTop: Bool
    */
    @Environment(\.navigationState) private var navigationState

    private let columnSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 3)
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridLayout, spacing: columnSpacing, content: {
                ForEach(productCategoriesArray, id:\.self) { item in
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
                        navigationState.path.append(Route.categories(item))
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

}
