//
//  ListingImageCarousel.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct ListingImageCarousel: View {
    let listing: Listing

    var frameheight: CGFloat
    var radius: CGFloat
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(image)
            }
        }
        .frame(height: frameheight)
        .clipShape(RoundedRectangle(cornerRadius: radius))
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarousel(listing: DeveloperPreview.shared.listings[2], frameheight: 320, radius: 10)
}
