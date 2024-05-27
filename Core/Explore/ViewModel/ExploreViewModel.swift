//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 23/05/2024.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListing() }
    }
    
    func fetchListing() async {
        do {
            self.listings = try await service.fetchListing()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listing with an error \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation() {
        let filteredListings = listings.filter({ listing in
            listing.city.lowercased() == searchLocation.lowercased() ||
            listing.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
