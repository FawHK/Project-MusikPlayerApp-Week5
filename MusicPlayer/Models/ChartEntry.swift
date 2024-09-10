//
//  ChartEntry.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 10.09.24.
//

import Foundation

struct Chart: Codable {
    let feed: ChartEntry
}

struct ChartEntry: Codable {
    let title: String
    let id: String
    let author: Author
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Result]
    
}

struct Author: Codable {
    let name: String
    let url: String
}

struct Result: Codable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: String
    let kind: String
    let artistId: String
    let artistUrl: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    
}

struct Genre: Codable {
    let genreId: String
    let name: String
    let url: String
}

