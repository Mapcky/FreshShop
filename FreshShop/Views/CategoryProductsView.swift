//
//  CategoryProductsView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 26/03/2025.
//

import SwiftUI

struct CategoryProductsView: View {
    // MARK: - PROPERTIES
    /*
    @Binding var path: NavigationPath
    @Binding var animatingBot: Bool
     */
    @State var productCategory: ProductCategory
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                Text(productCategory.name)
                    .font(.title3)
                    .fontDesign(.rounded)
                ProductsVGrid()
            }//:VSTACK
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
        }//:SCROLL
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CategoryProductsView(productCategory: ProductCategory(id: 1, name: "Dairy"))

}
