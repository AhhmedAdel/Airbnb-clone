//
//  FirebaseAuthService.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 25/05/2024.
//

import Firebase

struct FirebaseAuthService: AuthServiceProtocol {
    
    func login(withEmail email: String, password: String) async throws -> String? {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result.user.uid
        } catch {
            throw error
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws -> String? {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            return result.user.uid
        } catch {
            throw error
        }
    }
    
    func signout() {
        try? Auth.auth().signOut()
    }
}


