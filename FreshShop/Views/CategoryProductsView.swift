//
//  CategoryProductsView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 26/03/2025.
//

import SwiftUI

struct CategoryProductsView: View {
    // MARK: - PROPERTIES
    
    private var productVM = ProductViewModel(httpClient: HTTPClient())
    var selectedCategoryId: Int
    var selectedCategoryName: String
    
    init(selectedCategoryId: Int, selectedCategoryName: String) {
        self.selectedCategoryId = selectedCategoryId
        self.selectedCategoryName = selectedCategoryName
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack() {
                Text(selectedCategoryName)
                    .font(.title)
                    .fontDesign(.rounded)
                    .foregroundStyle(.gray.opacity(0.7))
                
                ProductsVGrid(productVM: productVM, selectedCategoryId: selectedCategoryId)
            }//:VSTACK
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
        }//:SCROLL
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
        .task {
            do {
                try await productVM.loadProducts(categoryId: selectedCategoryId)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


#Preview {
    CategoryProductsView(selectedCategoryId: 1, selectedCategoryName: "Dairy")
}

