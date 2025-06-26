//
//  UserViewModel.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 03/06/2025.
//

import SwiftUI

@MainActor
@Observable
class UserViewModel {
    private var httpClient: HTTPClient
    private(set) var user: User?
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    // MARK: - COMPUTED PROPERTIES
    
    var firstName: String {
        return user?.firstName ?? ""
    }
    
    var lastName: String {
        return user?.lastName ?? ""
    }
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    var email: String {
        return user?.email ?? ""
    }
    
    
    
    // MARK: - FUNCTIONS
    func login(username: String, password: String) async throws {
        
        let body = ["username" : username, "password" : password]
        
        let bodyData = try? JSONEncoder().encode(body)
        
        let resource = Resource(url: Constants.Urls.loginUser, method: .post(bodyData), modelType: LoginUserResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success, let user = response.user, let token = response.token {
            self.user = user
            Keychain.set(token, forKey: "jwttoken")
        } else {
            print(response.message ?? "An error occured while retriving user data")
        }
    }
    
    func loginById() async throws {
        let resource = Resource(url: Constants.Urls.loginById, modelType: LoginUserResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success, let user = response.user {
            self.user = user
        } else {
            print(response.message ?? "An error occured while retriving user data")
        }
    }
    
    func logout() {
        user = nil
        let _ = Keychain<String>.delete("jwttoken")
    }
    
    func register(user: User) async throws {
        //let bodyData = try JSONEncoder().encode(user)
                
        let body = ["username": user.username, "password": user.password!, "first_name": user.firstName, "last_name": user.lastName, "email": user.email]
        
        let bodyData = try JSONEncoder().encode(body)
        
        let resource = Resource(url: Constants.Urls.register, method: .post(bodyData), modelType: LoginUserResponse.self)
        
        let response = try await httpClient.load(resource)
        
        if response.success, let newUser = response.user, let newToken = response.token {
            self.user = newUser
            Keychain.set(newToken, forKey: "jwttoken")
        } else {
            print(response.message ?? "An error occurred during the registration process")
        }
    }
    
    
}
