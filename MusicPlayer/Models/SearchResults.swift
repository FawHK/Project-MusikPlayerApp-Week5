//
//  SongDetalis.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import Foundation


struct SearchResults: Codable {
    var results: [ArtistDetails]
    
}

struct ArtistDetails: Codable, Identifiable {
    var id: Int { trackId ?? (collectionId ?? 0 )  }
    var trackId: Int?
    let collectionId: Int?
    let artistName: String
    let collectionName: String
    var trackName: String?
    let artistViewUrl: String?
    let previewUrl: String?
    let artworkUrl100: String
    let collectionPrice, trackPrice: Double?

}

