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
    
    
}
