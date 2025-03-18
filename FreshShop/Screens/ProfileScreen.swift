//
//  ProfileScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/03/2025.
//

import SwiftUI

struct ProfileScreen: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName:"person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            VStack (spacing: 5){
                Text("User Name")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
                Text(verbatim: "email@placeholder.com")
                    .font(.footnote)
                    .fontDesign(.rounded)
                    .foregroundStyle(.gray)
            }//: VSTACK NAME & EMAIL
            
            ProfileButton(buttonImage: "person.fill", buttonTitle: "Account Information")
            
            ProfileButton(buttonImage: "map.fill", buttonTitle: "Delivery Adress")
            
            ProfileButton(buttonImage: "creditcard.fill", buttonTitle: "Payment Method")
            
            ProfileButton(buttonImage: "person.2.badge.gearshape.fill", buttonTitle: "Support")
            
        }//:VSTACK
        .padding()
        .padding(.bottom, 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    ProfileScreen()
}
