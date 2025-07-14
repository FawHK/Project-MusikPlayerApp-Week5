//
//  Country.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import Foundation

enum Country: String, CaseIterable, Identifiable {
    case germany = "DE"
    case usa = "US"
    case denmark = "DK"
    case spain = "ES"
    case italy = "IT"
    case uae = "AE"
    
    var id: String { rawValue }
    
    var name: String {
        switch self {
        case .germany: "Germany"
        case .usa: "USA"
        case .denmark: "Denmark"
        case .spain: "Spain"
        case .italy: "Italy"
        case .uae: "UAE"
        }
    }
    
    var url: String {
        switch self {
        case .germany: "https://rss.marketingtools.apple.com/api/v2/de/music/most-played/10/songs.json"
        case .usa: "https://rss.marketingtools.apple.com/api/v2/us/music/most-played/10/songs.json"
        case .denmark: "https://rss.marketingtools.apple.com/api/v2/dk/music/most-played/10/songs.json"
        case .spain: "https://rss.marketingtools.apple.com/api/v2/es/music/most-played/10/songs.json"
        case .italy: "https://rss.marketingtools.apple.com/api/v2/it/music/most-played/10/songs.json"
        case .uae: "https://rss.marketingtools.apple.com/api/v2/ae/music/most-played/10/songs.json"
        }
    }
}
