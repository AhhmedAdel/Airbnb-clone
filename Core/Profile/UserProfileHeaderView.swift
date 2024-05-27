//
//  UserProfileHeaderView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 26/05/2024.
//

import SwiftUI

struct UserProfileHeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .fill(.white)
                .frame(width: 300, height: 200)
                .shadow(radius: 10)
            
            VStack(spacing: 12) {
                CircleProfileAvatarView(imageURL: "male-profile-photo" ,size: .xLarge)
                Text("John Doe")
                    .font(.headline)
                Text("Guest")
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    UserProfileHeaderView()
}
