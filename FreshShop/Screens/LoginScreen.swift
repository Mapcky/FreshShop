//
//  LoginScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 03/06/2025.
//

import SwiftUI

struct LoginScreen: View {
    // MARK: - PROPERTIES
    @Environment(UserViewModel.self) private var userVM
    @State private var username: String = ""
    @State private var password: String = ""
    
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpaces && !password.isEmptyOrWhiteSpaces
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            VStack(spacing: 16) {
                TextField("User name", text: $username)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }//:VSTACK
            .padding(.horizontal)
            
            Button(action: {
                Task {
                    do {
                        try await userVM.login(username: username, password: password)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isFormValid ? Color.green : Color.gray)
                    .cornerRadius(10)
            }//: BUTTON
            .disabled(!isFormValid)
            .padding(.horizontal)
        }//:VSTACK
        .padding()
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}



#Preview {
    LoginScreen()
        .environment(UserViewModel(httpClient: .development))
}
