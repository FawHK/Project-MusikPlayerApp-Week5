//
//  SongDetalis.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import Foundation

//struct SearchSong: Codable {
//    let resultCount: SearchResults
//}

struct SearchResults: Codable {
    var results: [SongDetails]
    
}

struct SongDetails: Codable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let artworkUrl100: String

}
//struct SongDetail: Codable, Identifiable {
//  var id: Int // Verwende das `trackId` aus der API als eindeutige ID
//  var trackName: String
//  var artistName: String
//  var artworkUrl100: String
//  enum CodingKeys: String, CodingKey {
//    case id = "trackId"
//    case trackName
//    case artistName
//    case artworkUrl100
//  }
//}
//struct SearchResults: Codable {
//  var results: [SongDetail]
//}
