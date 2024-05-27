//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct MainTabView: View {
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    var body: some View {
        
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore ", systemImage: "magnifyingglass")
                }
            WishlistView(authManager: authManager)
                .tabItem {
                    Label("Wishlist ", systemImage: "heart")
                }
            
            
            ProfileView(authManager: authManager)
                .tabItem {
                    Label("Profile ", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView(authManager: AuthManager(service: MockAuthService()))
}
