//
//  PurchaseCompleteView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 27/03/2025.
//

import SwiftUI

struct PurchaseCompleteView: View {
    // MARK: - PROPERTIES

    @Environment(\.navigationState) private var navigationState

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
                    navigationState.showingScreen = .home
                    navigationState.animatingBot = false
                    navigationState.animatingTop = false
                    navigationState.path.removeLast(navigationState.path.count)
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
    PurchaseCompleteView()
        .environment(\.navigationState, NavigationState())

}
