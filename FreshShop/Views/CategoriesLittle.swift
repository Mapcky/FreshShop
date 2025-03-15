//
//  CategoriesLittle.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CategoriesLittle: View {
    // MARK: - PROPERTIES
    
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
                    print("Working!")
                }, label: {
                    Text("See All")
                        .foregroundStyle(Color("DarkGreen"))
                        .fontDesign(.rounded)

                })
            }//:HSTACK
            Divider()
            
            CategoriesGridH()
        }//:VSTACK
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        //.frame(height: 400)
    }
}

#Preview {
    CategoriesLittle()
}
