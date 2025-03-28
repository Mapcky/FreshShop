//
//  CartView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 24/03/2025.
//

import SwiftUI

struct CartView: View {
    // MARK: - PROPERTIES
    /*
    @Binding var path: NavigationPath
    @Binding var animatingTop: Bool
     */
    
    @Environment(\.navigationState) private var navigationState

    // MARK: - BODY
    var body: some View {
        VStack{
            ForEach(1...4, id:\.self) { item in
                CartItemView()
            }
            
            Spacer()
            
            Button(action:{
                navigationState.animatingTop = false
                navigationState.path.append(Route.purchaseComplete)
            }, label: {
                Text("Proceed to Checkout")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Capsule().fill(Color("ButtonsDarkGreen")))
                    .foregroundStyle(.white)
                    .padding()
                    .contentShape(Capsule())
            })
        }
    }
}

#Preview {
    CartView()
        .environment(\.navigationState, NavigationState())

}
