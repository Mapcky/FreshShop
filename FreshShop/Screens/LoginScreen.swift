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
    @State private var isShowingRegister = false


    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpaces && !password.isEmptyOrWhiteSpaces
    }

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                
                VStack(spacing: 8) {
                    Text("FreshShop")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.green)
                    
                    Text("Login to continue")
                        .font(.headline)
                        .foregroundColor(.gray)
                }//: VSTACK TITLES
                
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                        TextField("Username", text: $username)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green.opacity(0.6), lineWidth: 1))
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green.opacity(0.6), lineWidth: 1))
                }//:VSTACK FIELDS
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
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color.green : Color.gray)
                        .cornerRadius(10)
                        .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 5)
                }//:BUTTON LOGIN
                .disabled(!isFormValid)
                .padding(.horizontal)
                
                Button {
                    isShowingRegister = true
                } label: {
                    Text("Don't have an account? Sing Up")
                        .font(.footnote)
                        .foregroundColor(.green)
                        .underline()
                }//:BUTTON REGISTER
                NavigationLink(destination: RegisterScreen(), isActive: $isShowingRegister) {
                    EmptyView()
                }
                VStack(spacing: 12) {
                    Text("or login with")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "globe")
                                Text("Google")
                            }
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        
                        Button {
                        } label: {
                            HStack {
                                Image(systemName: "apple.logo")
                                Text("Apple")
                            }
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }//:FAKE BUTTONS
                    .padding(.horizontal)
                }
                
                Spacer()
            }//: VSTACK
            .padding()
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}



#Preview {
    NavigationStack{
        LoginScreen()
    }
        .environment(UserViewModel(httpClient: .development))
}
