//
//  AuthManager.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 25/05/2024.
//

import Foundation

class AuthManager: ObservableObject {
    @Published var userSessionId: String?
    
    private let service: AuthServiceProtocol
    
    init(service: AuthServiceProtocol) {
        self.service = service
//        self.userSessionId = UUID().uuidString
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        self.userSessionId = try await service.login(withEmail: email, password: password)
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        self.userSessionId = try await service.createUser(withEmail: email, password: password, fullName: fullName)
    }
    
    @MainActor
    func signout() {
        service.signout()
        self.userSessionId = nil
    }
}
