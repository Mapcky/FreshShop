//
//  AuthenticationModifier.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 04/06/2025.
//

import SwiftUI

struct AuthenticationModifier: ViewModifier {
    // MARK: - PROPERTIES
    @State private var isLoading: Bool = true
    @Environment(UserViewModel.self) private var userVM
    
    // MARK: - BODY
    func body(content: Content) -> some View {
        Group {
            if isLoading {
                SplashScreen()
            } else {
                if userVM.user != nil {
                    content
                } else {
                    LoginScreen()
                }
            }//: if Splash
        }.onAppear(perform: {
            checkAuthentication()
        })
    }
    
    private func checkAuthentication() {
        guard let token = Keychain<String>.get("jwttoken"), JWTTokenValidator.validate(token: token) else {
            DispatchQueue.main.async{
                withAnimation(.linear) {
                    isLoading = false
                }
            }
            userVM.logout()
            return
        }
        Task {
            do {
                try await userVM.loginById()
                DispatchQueue.main.async {
                    withAnimation(.linear) {
                        isLoading = false
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}



extension View {
    func requiresAuthentication() -> some View {
        modifier(AuthenticationModifier())
    }
}
