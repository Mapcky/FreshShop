//
//  ProductDetailView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/03/2025.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES
    
    @State private var count: Int = 0
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                //Color("LightGreen")
                //Rectangle().fill(Color("LightGrayBackground"))
                Rectangle().fill(Color("LightGreen"))
                    .frame(maxHeight: 500)
                    .clipShape(BottomCircle())
                //Color("LightGrayBackground")
                
                
                VStack {
                    Text("dsadsaads")
                }
                .frame(maxHeight: 300)
                
            }//:ZSTACK
            .ignoresSafeArea()
            Spacer()
            
            HStack {
                Text("Product Title")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                
                Spacer()
                
                HStack(spacing: 15) {
                    Button(action: {
                        count -= 1
                    }, label: {
                        Text("-")
                            .bold()
                    })
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Circle().fill(Color("ButtonsDarkGreen"))
                    )
                    Button(action: {}, label: {
                        Text("\(String(count))")
                    })
                    Button(action: {
                        count += 1
                    }, label: {
                        Text("+")
                            .bold()

                    })
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Circle().fill(Color("ButtonsDarkGreen"))
                    )
                }
            }//:VSTACK
            .padding(.horizontal, 30)
            
        }
    }
}

#Preview {
    ProductDetailView()
}
