//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Ahmed Adel on 22/05/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    @State private var showMapView = false

    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                ZStack(alignment: .bottom) {
                    ScrollView {
                        SearchAndFilterBar(location: $viewModel.searchLocation)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    showDestinationSearchView.toggle()
                                }
                            }
                        LazyVStack(spacing: 32) {
                            ForEach(viewModel.listings) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(listing: listing)
                                        .frame(height: 410)
//                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                    }
                    .navigationDestination(for: Listing.self) { listing in
                        ListingDetailView(listing: listing)
                            .navigationBarBackButtonHidden()
                    }
                    Button {
                        showMapView.toggle()
                    } label: {
                        HStack {
                            Text("Map")
                            
                            Image(systemName: "paperplane")
                        }
                        .foregroundStyle(.white)
                        .padding(.vertical, 20)
                        .padding(.horizontal)
                        .background(Color.black)
                        .clipShape(Capsule())
                        .padding()
                    }
                }
                .sheet(isPresented: $showMapView) {
                    ListingMapView(listings: viewModel.listings )
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
