//
//  MockAuthService.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 24/05/2024.
//

import Foundation

struct MockAuthService: AuthServiceProtocol {
    func login(withEmail email: String, password: String) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func signout() {
        
    }
}
