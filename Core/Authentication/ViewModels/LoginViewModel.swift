//
//  LoginViewModel.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 24/05/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func login(withEmail email: String, passwod: String) async {
        do {
            try await authManager.login(withEmail: email, password: passwod)
        } catch {
            print("DEBUG: Failed to login with error: \(error.localizedDescription)")
        }
    }
}
