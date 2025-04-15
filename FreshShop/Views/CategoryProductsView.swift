//
//  CategoryProductsView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 26/03/2025.
//

import SwiftUI

struct CategoryProductsView: View {
    // MARK: - PROPERTIES

    @Environment(ProductViewModel.self) private var productVM
    var selectedCategoryId: Int
    var selectedCategoryName: String

    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                Text(selectedCategoryName)
                    .font(.title3)
                    .fontDesign(.rounded)
                ProductsVGrid(selectedCategoryId: selectedCategoryId)
            }//:VSTACK
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
        }//:SCROLL
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
        .task {
            try? await productVM.loadProducts(categoryId: selectedCategoryId)
        }
    }
}

#Preview {
    CategoryProductsView(selectedCategoryId: 1, selectedCategoryName: "Dairy")
        .environment(ProductViewModel(httpClient: .development))


}
