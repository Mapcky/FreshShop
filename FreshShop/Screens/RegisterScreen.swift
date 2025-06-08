//
//  RegisterScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 04/06/2025.
//

import SwiftUI

struct RegisterScreen: View {
    // MARK: - PROPERTIES
    @Environment(UserViewModel.self) private var userVM
    @Environment(\.dismiss) private var dismiss

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""

    private enum RegisterFields: CaseIterable {
        case username, password, firstName, lastName, email
    }
    
    @State private var fieldErrors: [RegisterFields: Bool] = [:]


    // MARK: - FUNCTIONS
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpaces &&
        !password.isEmptyOrWhiteSpaces &&
        !firstName.isEmptyOrWhiteSpaces &&
        !lastName.isEmptyOrWhiteSpaces &&
        !email.isEmptyOrWhiteSpaces &&
        email.contains("@") &&
        email.contains(".")
    }
    
    private func validateForm() -> Bool {
        fieldErrors = [:]

        var isValid = true

        if username.isEmptyOrWhiteSpaces {
            fieldErrors[.username] = true
            isValid = false
        }

        if password.isEmptyOrWhiteSpaces {
            fieldErrors[.password] = true
            isValid = false
        }

        if firstName.isEmptyOrWhiteSpaces {
            fieldErrors[.firstName] = true
            isValid = false
        }

        if !lastName.isEmptyOrWhiteSpaces {
            fieldErrors[.lastName] = true
            isValid = false
        }

        if email.isEmptyOrWhiteSpaces && !email.contains("@") && !email.contains(".") {
            fieldErrors[.email] = true
            isValid = false
        }

        return isValid
    }
    
    func registerUser() async {
        
        let newUser = User(username: username, firstName: firstName, lastName: lastName, email: email, password: password)
        Task {
            do {
                try await userVM.register(user: newUser)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            VStack(spacing: 8) {
                Text("Create Account")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.green)

                Text("Join FreshShop today")
                    .font(.headline)
                    .foregroundColor(.gray)
            }//: TITLE

            VStack(spacing: 18) {
                NiceTextField(titleLabel: "Username", fieldValue: $username, showError: fieldErrors[.username] ?? false)
                    .textInputAutocapitalization(.never)
                    
                NiceTextField(titleLabel: "First Name", fieldValue: $firstName, showError: fieldErrors[.firstName] ?? false)
                NiceTextField(titleLabel: "Last Name", fieldValue: $lastName, showError: fieldErrors[.lastName] ?? false)
                NiceTextField(titleLabel: "Email", fieldValue: $email, showError: fieldErrors[.email] ?? false)
                    .textInputAutocapitalization(.never)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .font(.caption2)
                        .foregroundStyle(.gray)

                    SecureField("", text: $password)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(fieldErrors[.password] ?? false ? Color.red : Color.gray.opacity(0.5), lineWidth: 1.5)
                        )
                }//: SECUREFIELD
            }//VSTACK
            .padding(.horizontal)
            GreenButton(title: "Register", enabled: isFormValid, action: {
                Task {
                    await registerUser()
                        //dismiss()
                }
            })//: REGISTER BUTTON
            .padding(.horizontal)
            
            Button("Already have an account? Login") {
                //back login scren
            }//: LOGIN
            .font(.footnote)
            .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}
#Preview {
    RegisterScreen()
        .environment(UserViewModel(httpClient: .development))
}
