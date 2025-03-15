//
//  MainScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct MainScreen: View {
    // MARK: - PROPERTIES
    
    @State private var search: String = ""
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("DarkGreen")
                .ignoresSafeArea()
            VStack {
                VStack {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Welcome back User!")
                            Text("Hi, ready to get some deals!")
                        }//: VSTACK
                        
                        Spacer()
                        
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                                                
                    }//:HSTACK
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search your daily grocery food...", text: $search)
                    }//:HSTACK
                    .padding(8)
                    .foregroundStyle(.gray)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.vertical, 20)
                }
                .padding(.top, 60)
                .padding(.horizontal, 35)

                
                // MARK: - END TOP DESIGN
                
                ScrollView {
                    CategoriesLittle()
                        .padding(.horizontal, 15)
                        .shadow(radius: 0.5)
                        .padding(.top, 30)
                    
                }//: SCROLL
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("LightGrayBackground"))
                .clipShape(CustomTopShape())
            }//: VSTACK
            
        }//: ZSTACK
        
        .overlay(alignment: .bottom) {
            ZStack{
                Rectangle()
                    .fill(Color("DarkGreen"))
                    .clipShape(CustomShape(cutoutRatio: 8, cutoutHeight: 0))
                    .frame(height: 80)
            
                HStack {
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "square.grid.2x2")
                                    .imageScale(.large)
                                Text("Home")
                                
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "storefront")
                                    .imageScale(.large)
                                Text("Orders")
                            }                })
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "ticket")
                                    .imageScale(.large)
                                Text("Deals")
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "slider.horizontal.3")
                                    .imageScale(.large)

                                Text("More")
                            }                    })
                    }
                }//:HSTACK
                .font(.headline)
                .bold()
                .foregroundStyle(.white)
                .padding(.horizontal, 30)
                .offset(y: -10)
                .ignoresSafeArea()
                
                VStack {
                    
                    ZStack {
                        Circle().stroke(lineWidth: 8)
                        Button(action: {}, label: {           Image(systemName: "cart")
                                .imageScale(.large)
                                .bold()
                        })
                    }//:ZSTACK
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color("DarkGreen"))
                }
                .offset(y: -40)

            }//:ZSTACK
        } //:OVERLAY
        .ignoresSafeArea()
    }
    
}

#Preview {
    MainScreen()
}
