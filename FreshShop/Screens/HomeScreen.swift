//
//  HomeScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 24/03/2025.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - PROPERTIES
    @Binding var animatingTop: Bool
    @Binding var animatingBot: Bool
    @Binding var path: NavigationPath
    @Binding var showingScreen: selectedScreen
    
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 0){
            CategoriesLittle(path: $path, selectedScreen: $showingScreen, animatingTop: $animatingTop)
                .padding(.horizontal, 15)
                .shadow(radius: 0.5)
                .padding(.top, 30)
            
            BannerView()
                .frame(minHeight: 220)
                .padding(.horizontal, 20)
            
            PopularProductsLitleGrid(path: $path, animatingTop: $animatingTop, animatingBot: $animatingBot)
                .padding(.horizontal, 15)
                .shadow(radius: 0.5)
                .padding(.top, 30)
        }
    }
}

#Preview {
    HomeScreen(animatingTop: .constant(false), animatingBot: .constant(false), path: .constant(NavigationPath()), showingScreen: .constant(.home))
}
