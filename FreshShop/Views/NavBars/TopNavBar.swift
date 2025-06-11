//
//  TopNavBar.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct TopNavBar: View {
    // MARK: - PROPERTIES
    
    @Environment(NavigationState.self) private var navigationState
    @Environment(UserViewModel.self) private var userVM

    @State private var search: String = ""
    @State private var backToHome: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 5) {
            HStack {
                if(!navigationState.animatingTop) {
                    Text("Let's get some deals")
                }
                else {
                    Button(action: {
                        withAnimation(.easeInOut, {
                            navigationState.animatingBot = false
                            if !navigationState.path.isEmpty {
                                navigationState.path.removeLast()
                            }
                            else if navigationState.path.isEmpty {
                                navigationState.animatingTop = false
                                navigationState.showingScreen = .home
                            }
                        })
                    }, label: {
                        Image(systemName: "chevron.left")
                            .bold()
                    })//: BUTTON BACK
                }
                
                Spacer()
                Button(action:{
                    withAnimation(.linear) {
                        navigationState.animatingTop = true
                        navigationState.showingScreen = .profile
                    }
                }, label: {
                    Text("Hi, \(userVM.user?.firstName ?? "User")")
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                })
                
            }//:HSTACK
            .foregroundStyle(.white)
            .fontDesign(.rounded)
            
            if !navigationState.animatingTop {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search your daily grocery food...", text: $search)
                }//:HSTACK
                .padding(8)
                .foregroundStyle(.gray)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.vertical, 10)
            }
        }
        .padding(.top, 44)
        .padding(.horizontal, 35)
        
        
    }
}

#Preview {
    TopNavBar()
        .environment(NavigationState())
        .environment(UserViewModel(httpClient: .development))
}

