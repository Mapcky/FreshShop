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
                Rectangle().fill(Color("LightGray"))
                //Rectangle().fill(Color("LightGreen"))
                    .frame(maxHeight: 450)
                    .clipShape(BottomCircle())
                
                //Color("LightGrayBackground")
                
                
                VStack (alignment: .leading) {
                    
                    VStack {
                        
                        Text("Product Title")
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
            Spacer()
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
                        count -= 1
                    }, label: {
                        Text("-")
                            .font(.system(size: 18, weight: .black, design: .rounded))
                    })
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Circle().fill(Color("ButtonsDarkGreen"))
                    )
                    Button(action: {}, label: {
                        Text("\(String(count))")
                            .font(.system(size: 20, weight: .black, design: .rounded))
                            .foregroundStyle(.black)
                    })
                    Button(action: {
                        count += 1
                    }, label: {
                        Text("+")
                            .font(.system(size: 18, weight: .black, design: .rounded))

                    })
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Circle().fill(Color("ButtonsDarkGreen"))
                    )
                }
            }//:HSTACK
            .padding(.horizontal, 30)
            
            VStack (alignment: .leading) {
                Text("Description Details")
                    .font(.system(.title3, design: .rounded))
                    .foregroundStyle(.gray)
                
                ScrollView {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consequat nec felis in accumsan. Aenean euismod lectus eu lorem tristique, non finibus purus porttitor. Sed pulvinar ullamcorper ex, id ultricies ligula tincidunt vel. Donec ut augue vitae diam congue hendrerit. Donec id mi a mauris efficitur interdum. Suspendisse aliquam in odio tempus accumsan. Integer molestie, justo nec posuere porta, nunc erat tristique risus, vitae vestibulum nibh leo vitae ligula. Sed et nunc at risus rhoncus posuere. In in tempus nisi, auctor tristique quam.")
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal, 25)
            
            Spacer()
            
            Button(action:{}, label: {
                Spacer()
                Text("Add to Cart")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                Spacer()
            })
            .padding()
            .background(Capsule().fill(Color("ButtonsDarkGreen")))
            .foregroundStyle(.white)
            .padding()
            
        }//:VSTACK
    }
}

#Preview {
    ProductDetailView()
}
