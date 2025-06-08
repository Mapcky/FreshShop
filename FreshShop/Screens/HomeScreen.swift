//
//  HomeScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 24/03/2025.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    var categoryVM: CategoryViewModel

    // MARK: - BODY
    var body: some View {
        VStack (spacing: 0){
            CategoriesLittle(categoryVM: categoryVM)
                .padding(.horizontal, 15)
                .shadow(radius: 0.5)
                .padding(.top, 30)
            
            BannerView()
                .frame(minHeight: 220)
                .padding(.horizontal, 20)
            
            PopularProductsLitleGrid()
                .padding(.horizontal, 15)
                .shadow(radius: 0.5)
                .padding(.top, 30)
        }//: VSTACK
    }
}

#Preview {
    HomeScreen(categoryVM: CategoryViewModel(httpClient: .development))
        .environment(\.navigationState, NavigationState())
}
