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
    @State private var animatingTop: Bool = false
    @State private var showing: selectedScreen = .home
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                Color("DarkGreen")
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        HStack {
                            if(!animatingTop) {
                                Text("Let's get some deals")
                            }
                            else {
                                Button(action: {
                                    withAnimation(.linear, {
                                        animatingTop = false
                                        showing = .home
                                    })
                                }, label: {
                                    Image(systemName: "chevron.left")
                                        .bold()
                                })
                            }
                            
                            Spacer()
                            Text("Hi, User")
                            Image(systemName: "person.crop.circle.fill")
                                .font(.largeTitle)
                            
                        }//:HSTACK
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        
                        if !animatingTop {
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
                    }
                    .padding(.top, animatingTop ? 0 : 30)
                    .padding(.horizontal, 35)
                    
                    
                    // MARK: - END TOP DESIGN
                    
                    ScrollView {
                        switch showing {
                        case .home:
                            CategoriesLittle(selectedScreen: $showing, animatingTop: $animatingTop)
                                .padding(.horizontal, 15)
                                .shadow(radius: 0.5)
                                .padding(.top, 30)
                        case .categories:
                            CategoriesVGrid()
                                .padding(.horizontal, 15)
                                .shadow(radius: 0.5)
                                .padding(.top, 30)
                        case .orders:
                            EmptyView()
                        case .deals:
                            EmptyView()
                        case .more:
                            EmptyView()
                        case .profile:
                            EmptyView()
                        }
                        
                    }//: SCROLL
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("LightGrayBackground"))
                    .clipShape(CustomTopShape())
                }//: VSTACK
                
            }//: ZSTACK
        }
        // MARK: - ACTION BAR
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
                                }
                            })
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
                            Circle().fill(.white)
                            Circle().stroke(lineWidth: 8)
                            Button(action: {}, label: {           Image(systemName: "cart")
                                    .imageScale(.large)
                                    .fontWeight(.black)
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

enum selectedScreen {
    case home
    case categories
    case orders
    case deals
    case more
    case profile
}

#Preview {
    MainScreen()
}


