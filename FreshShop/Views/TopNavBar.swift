//
//  TopNavBar.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 20/03/2025.
//

import SwiftUI

struct TopNavBar: View {
    // MARK: - PROPERTIES
    @Binding var animatingTop: Bool
    @Binding var animatingBot: Bool
    @Binding var path: NavigationPath
    @Binding var showingScreen: selectedScreen
    @State private var search :String = ""
    
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 5) {
            HStack {
                if(!animatingTop) {
                    Text("Let's get some deals")
                }
                else {
                    Button(action: {
                        withAnimation(.easeInOut, {
                            animatingTop = false
                            animatingBot = false
                            if !path.isEmpty{
                                path.removeLast()
                            }
                            else {
                                showingScreen = .home
                            }
                        })
                    }, label: {
                        Image(systemName: "chevron.left")
                            .bold()
                    })
                }//: BUTTON BACK
                
                Spacer()
                Button(action:{
                    withAnimation(.linear) {
                        animatingTop = true
                        showingScreen = .profile
                    }
                }, label: {
                    Text("Hi, User")
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                })
                
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
                .padding(.vertical, 10)
            }
        }
        //.padding(.top, 60)
        .padding(.horizontal, 35)
        
        
    }
}
/*
#Preview {
    TopNavBar()
}

*/
