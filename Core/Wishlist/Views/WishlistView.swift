//
//  WishlistView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct WishlistView: View {
    @ObservedObject var authManager: AuthManager
    
    @State private var showLogin = false
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    var body: some View {
        NavigationStack {
            VStack {
                if authManager.userSessionId == nil {
                    WishlistLoginView(showLogin: $showLogin)
                } else {
                    WishlistEmptyStateView()
                }
                
            }
            .sheet(isPresented: $showLogin, content: {
                LoginView(authManager: authManager)
            })
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistView(authManager: AuthManager(service: MockAuthService()))
}
