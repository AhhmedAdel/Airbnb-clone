//
//  WishlistLoginView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 27/05/2024.
//

import SwiftUI

struct WishlistLoginView: View {
    @Binding var showLogin: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Login to view your wishlist")
                    .font(.headline)
                
                Text("You can create, view or edit wishlists once you're logged in")
                    .font(.footnote)
                
            }
            CustomButtonView(title: "Login", action: { showLogin.toggle() })
            Spacer()
            
        }
    }
}

#Preview {
    WishlistLoginView(showLogin: .constant(false))
}
