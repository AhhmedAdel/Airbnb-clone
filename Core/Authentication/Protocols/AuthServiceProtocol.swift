//
//  AuthServiceProtocol.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 26/05/2024.
//

import Foundation

protocol AuthServiceProtocol {
    func login(withEmail email: String, password: String) async throws -> String?
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws -> String?
    
    func signout()
}
