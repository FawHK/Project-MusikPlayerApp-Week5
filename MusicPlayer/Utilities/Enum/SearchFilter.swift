//
//  SearchFilter.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 12.09.24.
//

import Foundation

enum SearchFilter: String, CaseIterable, Identifiable {
    case song, album
    
    var id: String { rawValue }
    
    var name: String {
        switch self {
  
        case .song: "Song"
        case .album: "Album"
        }
    }
    
    var url: String {
        switch self {
// To ask about \(text)
        case .song: "https://itunes.apple.com/search?term=&media=music&entity=song"
        case .album: "https://itunes.apple.com/search?term=&media=music&entity=album&limit=5"
        }
    }
}
