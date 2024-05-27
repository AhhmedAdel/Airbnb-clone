//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 23/05/2024.
//

import Foundation

class ExploreService {
    func fetchListing() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
