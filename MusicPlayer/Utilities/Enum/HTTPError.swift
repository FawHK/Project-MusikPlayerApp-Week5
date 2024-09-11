//
//  HTTPError.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import Foundation

enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    var message: String {
        switch self {
        case .invalidURL: "Unvalid URL"
        case .fetchFailed: "Loading Failed"
        }
    }
}
