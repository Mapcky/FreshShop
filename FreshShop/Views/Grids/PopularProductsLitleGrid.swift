//
//  PopularProductsLitleGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct PopularProductsLitleGrid: View {
    
    @Binding var path: NavigationPath
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Popular Products")
                    .font(.title3)
                    .bold()
                    .fontDesign(.rounded)
                Spacer()
            }//:HSTACK
            Divider()
            
            PopularProductsHGrid(path: $path)
        }//:VSTACK
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

/*
#Preview {
    PopularProductsLitleGrid(path: .constant([]))
}
 */

