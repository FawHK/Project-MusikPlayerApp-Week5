//
//  NavigatorView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import SwiftUI

struct NavigatorView: View {
    
    var body: some View {
        TabView {
            ChartView()
                .tabItem {
                    Label(Tab.chart.name, systemImage: Tab.chart.icon)
                }
            SearchView()
                .tabItem {
                    Label(Tab.search.name, systemImage: Tab.search.icon)
                }
        }
    }
}

#Preview {
    NavigatorView()
        .preferredColorScheme(.dark)
}
