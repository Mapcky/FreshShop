//
//  ProductDetailView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/03/2025.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES
    var product: Product
    @State private var count: Int = 0
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    //Color("LightGreen")
                    //Rectangle().fill(Color("LightGray"))
                    Rectangle().fill(Color("LightGreen"))
                        .frame(maxHeight: 450)
                        .clipShape(BottomCircle())
                    
                    //Color("LightGrayBackground")
                    
                    
                    VStack (alignment: .leading) {
                        
                        VStack {
                            
                            Text(product.name)
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .fontDesign(.rounded)
                            
                            
                        }//:VSTACK TITLE
                        .foregroundStyle(.white)
                        .shadow(radius: 5, x: 0, y: 3)
                        .padding()
                        
                        HStack(alignment: .center, spacing: 6) {
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Price")
                                    .fontWeight(.semibold)
                                
                                Text(100, format: .currency(code: "USD"))
                                    .font(.title3)
                                    .fontWeight(.black)
                                    .scaleEffect(1.2, anchor: .leading)
                            }
                            .padding(.trailing, 10)
                            
                            Spacer()
                            
                            Image("ProductPlaceholder")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 5, x: 0, y: 10)
                        }
                        .padding()
                    }
                    .padding(.top, 20)
                    
                    
                }//:ZSTACK
                .ignoresSafeArea()
            }//:VSTACK TOP PART
            .ignoresSafeArea()
            
            
            // MARK: - BOTTOM PART
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 3, content: {
                        Text("Ratings")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("LightGrayBackground"))
                        
                        HStack(alignment: .center, spacing: 3, content: {
                            ForEach(1...5, id: \.self) { item in
                                Button(action: {}, label: {
                                    Image(systemName: "star.fill")
                                        .frame(width: 28, height: 28, alignment: .center)
                                        .background(Color(.gray).clipShape(RoundedRectangle(cornerRadius: 5)))
                                        .foregroundStyle(.white)
                                })
                            }
                        })
                    })//:VSTACK RATING
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Button(action: {
                            if count > 0 {
                                count -= 1
                            }
                        }, label: {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .black, design: .rounded))
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(
                                    Circle().fill(Color("ButtonsDarkGreen"))
                                )
                                .contentShape(Circle())
                        })
                        Button(action: {}, label: {
                            Text("\(String(count))")
                                .font(.system(size: 20, weight: .black, design: .rounded))
                                .foregroundStyle(.black)
                        })
                        Button(action: {
                            count += 1
                        }, label: {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .black, design: .rounded))
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(
                                    Capsule().fill(Color("ButtonsDarkGreen"))
                                )
                                .contentShape(Circle())
                        })
                    }
                }//:HSTACK
                .padding(.horizontal, 30)
                
                VStack (alignment: .leading) {
                    Text("Product Description")
                        .font(.system(.title3, design: .rounded))
                        .foregroundStyle(.gray)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consequat nec felis in accumsan. Aenean euismod lectus eu lorem tristique, non finibus purus porttitor. Sed pulvinar ullamcorper ex, id ultricies ligula tincidunt vel. Donec ut augue vitae diam congue hendrerit. Donec id mi a mauris efficitur interdum. Suspendisse aliquam in odio tempus accumsan. Integer molestie, justo nec posuere porta, nunc erat tristique risus, vitae vestibulum nibh leo vitae ligula. Sed et nunc at risus rhoncus posuere. In in tempus nisi, auctor tristique quam.")
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 25)
                
                Spacer()
                
                Button(action:{
                }, label: {
                    Text("Add to Cart")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Capsule().fill(Color("ButtonsDarkGreen")))
                        .foregroundStyle(.white)
                        .padding()
                        .contentShape(Capsule())
                })
                
            }//:VSTACK
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProductDetailView(product: Product(id: 1, name: "Fresh Oranges"))
}
