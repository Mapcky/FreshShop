//
//  SplashScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 05/06/2025.
//

import SwiftUI

struct SplashScreen: View {
    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0.0

    var body: some View {
        ZStack {
            Color.green.opacity(0.6).ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "cart.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.white)
                    .shadow(radius: 10)

                Text("FreshShop")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .shadow(radius: 8)
            }
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeOut(duration: 0.8)) {
                    self.scale = 1.0
                    self.opacity = 1.0
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
