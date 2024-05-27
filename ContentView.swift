//
//  ContentView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    var body: some View {
        MainTabView(authManager: authManager)
    }
}

#Preview {
    ContentView(authManager: AuthManager(service: MockAuthService()))
}
