//
//  GreenButton.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 04/06/2025.
//

import SwiftUI

struct GreenButton: View {
    var title: String
    var enabled: Bool = true
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(enabled ? Color.green : Color.gray)
                .cornerRadius(10)
                .shadow(color: enabled ? Color.green.opacity(0.3) : .clear, radius: 5, x: 0, y: 5)
        }
        .disabled(!enabled)
    }
}


#Preview {
    GreenButton(title: "Place Order", action: {})
}
