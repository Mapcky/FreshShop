//
//  PurchaseCompleteView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct PurchaseCompleteView: View {
    // MARK: - PROPERTIES
    @Binding var path: NavigationPath
    @Binding var showingScreen: selectedScreen
    @Binding var animatingTop: Bool
    @Binding var animatingBot: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.green)
                    .shadow(radius: 5)
                
                Text("¡Purchase Complete!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                Button(action: {
                    showingScreen = .home
                    animatingBot = false
                    animatingTop = false
                    path.removeLast(path.count)
                },label: {
                    Text("Back to home")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                })//: BUTTON
            }//:VSTACK
            .padding()
        }//:ZSTACK
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PurchaseCompleteView(path: .constant(NavigationPath()), showingScreen: .constant(.home), animatingTop: .constant(true), animatingBot: .constant(false))
}
