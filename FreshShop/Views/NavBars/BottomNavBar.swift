//
//  BottomNavBar.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct BottomNavBar: View {
    // MARK: - PROPERTIES

    @Environment(\.navigationState) private var navigationState

    // MARK: - BODY
    var body: some View {
        if !navigationState.animatingBot {
            ZStack{
                Rectangle()
                    .fill(Color("DarkGreen"))
                    .clipShape(CustomShape(cutoutRatio: 8, cutoutHeight: 0))
                    .frame(height: 75)
                
                HStack {
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                navigationState.animatingTop = false
                                if !navigationState.path.isEmpty{
                                    navigationState.path.removeLast()
                                }
                                else {
                                    navigationState.showingScreen = .home
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
                                navigationState.animatingTop = true
                                navigationState.showingScreen = .orders
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
                                navigationState.animatingTop = true
                                navigationState.showingScreen = .deals
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
                                navigationState.animatingTop = true
                                navigationState.showingScreen = .more
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
                        Button(action: {
                            withAnimation(.easeInOut) {
                                navigationState.animatingTop = true
                                navigationState.animatingBot = true
                                navigationState.showingScreen = .cart
                            }
                        }, label: {
                            Image(systemName: "cart")
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
    BottomNavBar()
        .environment(\.navigationState, NavigationState())

}

