//
//  BottomNavBar.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct BottomNavBar: View {
    // MARK: - PROPERTIES
    @Binding var animatingTop: Bool
    @Binding var animatingBot: Bool
    @Binding var path: NavigationPath
    @Binding var showingScreen: selectedScreen
    
    // MARK: - BODY
    var body: some View {
        if !animatingBot {
            ZStack{
                Rectangle()
                    .fill(Color("DarkGreen"))
                    .clipShape(CustomShape(cutoutRatio: 8, cutoutHeight: 0))
                    .frame(height: 75)
                
                HStack {
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                animatingTop = false
                                animatingBot = false
                                if !path.isEmpty{
                                    path.removeLast()
                                }
                                else {
                                    showingScreen = .home
                                }
                            }
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "square.grid.2x2")
                                    .imageScale(.large)
                                Text("Home")
                                
                            }
                        })
                        
                        Button(action: {
                            withAnimation(.easeInOut) {
                                animatingTop = false
                                animatingBot = false
                                showingScreen = .orders
                            }
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
                            withAnimation(.easeInOut) {
                                animatingTop = false
                                animatingBot = false
                                showingScreen = .deals
                            }
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "ticket")
                                    .imageScale(.large)
                                Text("Deals")
                            }
                        })
                        
                        Button(action: {
                            withAnimation(.easeInOut) {
                                animatingTop = true
                                animatingBot = true
                                showingScreen = .more
                            }
                        }, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "slider.horizontal.3")
                                    .imageScale(.large)
                                Text("More")
                            }
                        })
                    }
                }//:HSTACK
                .font(.subheadline)
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
                                .fontWeight(.bold)
                        })
                    }//:ZSTACK
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color("DarkGreen"))
                }
                .offset(y: -40)
                
            }//:ZSTACK
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }//:Hide actionsBar
    }
}

#Preview {
    BottomNavBar(animatingTop: .constant(false), animatingBot: .constant(false), path: .constant(NavigationPath()), showingScreen: .constant(.home))
}

