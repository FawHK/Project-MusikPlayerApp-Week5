//
//  MainView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 09.09.24.
//

import SwiftUI


struct ChartView: View {
    // MARK: - Properties
    
    @State private var charts: [Result] = []
    
//    let dummies: [Song] = [
//    Song(title: "Ditch", artist: "Lamb of God", coverImage: "ditch"),
//    Song(title: "Momento Mori", artist: "Lamb of God", coverImage: "mementoMori"),
//    Song(title: "To the Hellfire", artist: "Lorna Shore", coverImage: "toTheHellfire")
//    ]
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationStack {
            List(charts, id: \.id) { song in
                HStack {
                    Image(.toTheHellfire)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("\(song.artistName)")
                            .font(.subheadline)
                            .bold()
                        
                        Text(song.name)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Charts")
        }
        .task {
            fetchSongsFromJSON()
        }
    }
    private func fetchSongsFromJSON() {
        guard let path = Bundle.main.path(forResource: "Charts", ofType: "json") else {
            print("File doesn't exist")
            return
        }
        do {
            let data = try Data(contentsOf: URL(filePath: path))
            let songs = try JSONDecoder().decode(Chart.self, from: data)
            
            self.charts = songs.feed.results
        } catch {
            print("Error \(error)")
            return
        }
    }
}

#Preview {
    ChartView()
        .preferredColorScheme(.dark)
}
