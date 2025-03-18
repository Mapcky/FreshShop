//
//  ProductsVGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/03/2025.
//

import SwiftUI

struct ProductsVGrid: View {
    // MARK: - PROPERTIES
    private let columnSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 2)
    }
    @State private var count: Int = 0
    // MARK: - BODY
    var body: some View {
            LazyVGrid(columns: gridLayout, spacing: columnSpacing, content: {
                ForEach(1...20, id:\.self) { item in
                    VStack {
                        ZStack {
                            Color("CategoriesBackground")
                            
                            Image(systemName: "cart.fill")
                            VStack (alignment: .trailing) {
                                Spacer()
                                HStack(spacing: 15) {
                                    Button(action: {
                                        count -= 1
                                    }, label: {
                                        Text("-")
                                    })
                                    Button(action: {}, label: {
                                        Text("\(String(count))")
                                    })
                                    Button(action: {
                                        count += 1
                                    }, label: {
                                        Text("+")
                                    })
                                }
                                .padding()
                                
                            }
                        }//: ZSTACK
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                        
                        Text("Product \(item)")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                    }//: VSTACK
                }
            })
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}


#Preview {
    ProductsVGrid()
}
