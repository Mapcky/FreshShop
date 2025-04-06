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

    /*
    @Binding var animatingTop: Bool
    @Binding var animatingBot: Bool
    @Binding var path: NavigationPath
    @Binding var showingScreen: selectedScreen
    */
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 0){
            CategoriesLittle()
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
    HomeScreen()
        .environment(\.navigationState, NavigationState())
}
