//
//  MapListingPreviewView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 24/05/2024.
//

import SwiftUI

struct MapListingPreviewView: View {
    let listing: Listing
    var body: some View {
        VStack {
            TabView {
                ForEach(listing.imageURLs, id: \.self) { imageURL in
                    Image(imageURL)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Rectangle())
                }
            }
            .frame(height: 200)
            .tabViewStyle(.page)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    Text("7 nights: Dec 12 - 20")
                    
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("per night")
                    }
                }
                Spacer()
                
                RatingView(rating: String(listing.rating))
            }
            .font(.footnote)
            .padding(8)
            
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .shadow(radius: 4)
    }
}

#Preview {
    MapListingPreviewView(listing: DeveloperPreview.shared.listings[0])
}
