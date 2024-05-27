//
//  CustomButtonView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct CustomButtonView: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        })
    }
}

#Preview {
    CustomButtonView(title: "Login", action: { print("Debug") })
}
