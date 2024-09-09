//
//  MainView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 09.09.24.
//

import SwiftUI

struct Song: Identifiable {
    var id = UUID()
    
    var title: String
    var artist: String
    var coverImage: String
}

struct ChartView: View {
    // MARK: - Properties
    
    let dummies: [Song] = [
    Song(title: "Ditch", artist: "Lamb of God", coverImage: "ditch"),
    Song(title: "Momento Mori", artist: "Lamb of God", coverImage: "mementoMori"),
    Song(title: "To the Hellfire", artist: "Lorna Shore", coverImage: "toTheHellfire")
    ]
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationStack {
            List(dummies) { dummy in
                HStack {
                    Image(dummy.coverImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                        
                    VStack(alignment: .leading) {
                        Text(dummy.artist)
                            .font(.subheadline)
                            .bold()
                        
                        Text(dummy.title)
                            .font(.caption)
                            
                    }
                }
            }
            .navigationTitle("Top Songs")
        }
    }
}

#Preview {
    ChartView()
        .preferredColorScheme(.dark)
}
