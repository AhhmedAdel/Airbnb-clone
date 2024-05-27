//
//  ProfileLoginView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 26/05/2024.
//

import SwiftUI

struct ProfileLoginView: View {
    @Binding var showLogin: Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Log in to start planning your next trip")
            }
            
            CustomButtonView(title: "Login", action: { showLogin.toggle() })
            
            HStack {
                Text("Don't have an account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
        }
    }
}
    
#Preview {
    ProfileLoginView(showLogin: .constant(false))
}
