//
//  SearchFilter.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 12.09.24.
//

import Foundation

enum SearchFilter: String, CaseIterable, Identifiable {
    case song = "song"
    case album = "album"
    
    var id: String { rawValue }
    
    var name: String {
        switch self {
        case .song: "Song"
        case .album: "Album"
        }
    }
}
