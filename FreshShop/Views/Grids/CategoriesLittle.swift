//
//  CategoriesLittle.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CategoriesLittle: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    @Environment(CategoryViewModel.self) private var categoryVM
    

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Categories")
                    .font(.title3)
                    .bold()
                    .fontDesign(.rounded)
                
                Spacer()

                Button(action: {
                    navigationState.path.append(Route.allCategories)
                    withAnimation(nil) {
                        navigationState.animatingTop = true
                    }
                }, label: {
                    Text("See All")
                        .foregroundStyle(Color("DarkGreen"))
                        .fontDesign(.rounded)
                })
            }//:HSTACK
            Divider()
            CategoriesHGrid()
        }//:VSTACK
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    NavigationStack{
        CategoriesLittle()
            .environment(\.navigationState, NavigationState())
            .environment(CategoryViewModel(httpClient: .development))

    }
}
