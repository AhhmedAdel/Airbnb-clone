//
//  RatingView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct RatingView: View {
    var rating: String = "4.86"
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Text(rating)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingView()
}
