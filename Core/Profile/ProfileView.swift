//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authManager: AuthManager

    @State private var showLogin = false
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    var body: some View {
            VStack {
                // Profile Login View
                if authManager.userSessionId == nil {
                    ProfileLoginView(showLogin: $showLogin)
                } else {
                    UserProfileHeaderView()
                }
                
                // Profile Options
                VStack(spacing: 24) {
                    ProfileOptionRowView(imageName: "gear", title: "Settings")
                    ProfileOptionRowView(imageName: "gear", title: "Accessability")
                    ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
                }
                .padding(.vertical)
                
                if authManager.userSessionId != nil {
                    Button {
                        authManager.signout()
                    } label: {
                        Text("Log out")
                            .foregroundStyle(.black)
                            .underline()
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            
            .sheet(isPresented: $showLogin, content: {
                LoginView(authManager: authManager)
            })
    }
}

#Preview {
    ProfileView(authManager: AuthManager(service: MockAuthService()))
}
