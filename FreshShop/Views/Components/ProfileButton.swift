//
//  ProfileButton.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/03/2025.
//

import SwiftUI

struct ProfileButton: View {
    // MARK: - PROPERTIES
    let buttonImage: String
    let buttonTitle: String
    let action: () -> Void
    // MARK: - BODY
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: buttonImage)
                
                    .padding(.horizontal, 15)
                Text(buttonTitle)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                Image(systemName: "chevron.right")
                    .bold()
                    .padding(.trailing, 10)
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 18)
            .frame(maxWidth: .infinity)
            .background(Color("LightGrayBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.horizontal, 5)
            .foregroundStyle(.black)
        })//: BUTTON
    }
}

#Preview {
    ProfileButton(buttonImage: "person.fill", buttonTitle: "Account information", action: {})
    
}
