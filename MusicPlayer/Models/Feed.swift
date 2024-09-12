//
//  ChartEntry.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 10.09.24.
//

import Foundation

struct Chart: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [ChartEntry]
    
}

struct Author: Codable {
    let name: String
    let url: String
}

struct ChartEntry: Codable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: String
    let artistId: String
    let artistUrl: String
    let artworkUrl100: String
    let url: String
    
}



