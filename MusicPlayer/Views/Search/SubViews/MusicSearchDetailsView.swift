//
//  MusicSearchDetailsView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 12.09.24.
//

import SwiftUI

struct MusicSearchDetailsView: View {
    
    // MARK: Properties
    
    var searchDetails: ArtistDetails
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 50) {
            ImageView(artworkUrl100: searchDetails.artworkUrl100)
            Button {
            } label: {
                Link(destination: URL(string: searchDetails.artistViewUrl ?? "")!) {
                    Image(.appleMusicBadge)
                        .resizable()
                        .frame(width: 150, height: 50)
                        .scaledToFit()
                }
            }
            
            VStack(spacing: 10) {
                
                HStack {
                    Text("Artist: ")
                    Text(searchDetails.artistName)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text(searchDetails.trackName == nil ? "Album" : "Track")
                    Text(searchDetails.trackName ?? searchDetails.collectionName)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .font(.subheadline)
            .padding(.bottom, 150)
            
        }
    }
}

#Preview {
    MusicSearchDetailsView(searchDetails: ArtistDetails(artistId: 0,trackId: 3, artistName: "Metallica", collectionName: "",trackName: "nil", artistViewUrl: "", artworkUrl100: "", collectionPrice: 10.0, trackPrice: 1.5))
}
