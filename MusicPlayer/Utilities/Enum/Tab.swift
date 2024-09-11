//
//  Tab.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import Foundation


enum Tab: String, CaseIterable, Identifiable {
    case chart, search
    
    var id: String { rawValue }
    
    var name: String {
        switch self {
        case .chart: "Charts"
        case .search: "Search"
        }
    }
    
    var icon: String {
        switch self {
        case .chart: "chart.bar.xaxis"
        case .search: "waveform.badge.magnifyingglass"
        }
    }
}
