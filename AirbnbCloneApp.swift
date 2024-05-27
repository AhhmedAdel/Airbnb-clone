//
//  AirbnbCloneApp.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

@main
struct AirbnbCloneApp: App {
    
    let authManager = AuthManager(service: FirebaseAuthService())
    
    var body: some Scene {
        WindowGroup {
            ContentView(authManager: authManager)
        }
    }
}
