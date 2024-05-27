//
//  RegisterationViewModel.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 24/05/2024.
//

import Foundation

class RegisterationViewModel: ObservableObject {
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func createUser(withEmail email: String, passwod: String, fullName: String) async {
        do {
            try await authManager.createUser(withEmail: email, password: passwod, fullName: fullName)
        } catch {
            print("DEBUG: Failed to login with error: \(error.localizedDescription)")
        }
    }
}
