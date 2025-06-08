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
    let categoryVM: CategoryViewModel
    

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
            CategoriesHGrid(categoryVM: categoryVM)
        }//:VSTACK
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    NavigationStack{
        CategoriesLittle(categoryVM: CategoryViewModel(httpClient: .development))
            .environment(\.navigationState, NavigationState())

    }
}
