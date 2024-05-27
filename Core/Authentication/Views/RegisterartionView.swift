//
//  RegisterartionView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 24/05/2024.
//

import SwiftUI

struct RegisterartionView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userFullName = ""
    
    @StateObject var viewModel: RegisterationViewModel
    
    @Environment(\.dismiss) var dismiss
    
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        self._viewModel = StateObject(wrappedValue: RegisterationViewModel(authManager: authManager))
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.airbnbAppIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your full name", text: $userFullName)
                    .modifier(PrimaryTextFieldModifier())
                
                TextField("Enter your email", text: $email)
                    .modifier(PrimaryTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(PrimaryTextFieldModifier())
                
            }
            
            CustomButtonView(title: "Create an account", action: {
                Task {
                    await
                    viewModel.createUser(
                        withEmail: email,
                        passwod: password,
                        fullName: userFullName)
                }
            })
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.7)
            
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 2) {
                    Text("have an account?")
                    Text("Login")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)

        }
    }
}

extension RegisterartionView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        !userFullName.isEmpty
    }
}

#Preview {
    RegisterartionView(authManager: AuthManager(service: MockAuthService()))
}
