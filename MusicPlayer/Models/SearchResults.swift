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

struct ArtistDetails: Codable {
    let artistId: Int
    var trackId: Int?
    let artistName: String
    let collectionName: String
    var trackName: String?
    let artistViewUrl: String?
    let artworkUrl100: String
    let collectionPrice, trackPrice: Double?

}

