//
//  LoginView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 24/05/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel: LoginViewModel
    @Environment(\.dismiss) var dismiss
    
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authManager: authManager))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.airbnbAppIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .modifier(PrimaryTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(PrimaryTextFieldModifier())

                }
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .padding(.bottom, 16)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                CustomButtonView(title: "Login", action: {
                    Task {
                        await
                        viewModel.login(
                            withEmail: email,
                            passwod: password
                        )
                        print(authManager.userSessionId ?? "Null")
                        dismiss()
                    }
                })
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1 : 0.7)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegisterartionView(authManager: authManager)
                        .navigationBarBackButtonHidden()
                    
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5
    }
}
#Preview {
    LoginView(authManager: AuthManager(service: MockAuthService()))
}
