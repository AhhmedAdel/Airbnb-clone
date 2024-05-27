//
//  ListingMapView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 24/05/2024.
//

import SwiftUI
import MapKit

struct ListingMapView: View {
    private let listings: [Listing]
    @State private var cameraPosition: MapCameraPosition
    @State private var selectedListing: Listing?
    @State private var showListingDetails = false
    @Environment(\.dismiss) var dismiss
    init(listings: [Listing], center: CLLocationCoordinate2D = .losAngeles) {
        self.listings = listings
        let coordinateRegion = MKCoordinateRegion(
            center: center,
            latitudinalMeters: 50000,
            longitudinalMeters: 50000
        )
        self._cameraPosition = State(initialValue: .region(coordinateRegion))
    }
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Map(position: $cameraPosition, selection: $selectedListing) {
                ForEach(listings, id: \.self) { listing in
                    Marker("", coordinate: listing.coordinates)
                        .tag(listing.id)
                }
            }
            
            if let selectedListing {
                withAnimation(.spring){
                    MapListingPreviewView(listing: selectedListing)
                        .onTapGesture { showListingDetails.toggle() }
                }
            }
        }
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                 Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                            .shadow(radius: 4)
                    )
                    .padding(.top, 40)
                    .padding(.leading, 32)
            }
        }
        .fullScreenCover(isPresented: $showListingDetails) {
            if let selectedListing {
                ListingDetailView(listing: selectedListing)
            }
        }
    }
}

#Preview {
    ListingMapView(listings: DeveloperPreview.shared.listings)
}
