//
//  SongDetalisView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 12.09.24.
//

import SwiftUI

struct SongDetalisView: View {
    
    // MARK: - Properties
    
    let songDetails: ChartEntry
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 50) {
            ImageView(artworkUrl100: songDetails.artworkUrl100)
            Button {
            } label: {
                Link(destination: URL(string: songDetails.artistUrl)!) {
                    Image(.appleMusicBadge)
                        .resizable()
                        .frame(width: 150, height: 50)
                        .scaledToFit()
                }
            }
            
            VStack(spacing: 10) {
                
                HStack {
                    Text("Artist: ")
                    Text(songDetails.artistName)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("Track: ")
                    Text(songDetails.name)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .font(.subheadline)
            .padding(.bottom, 150)
            
        }
    }
}

#Preview {
    SongDetalisView(songDetails: ChartEntry(artistName: "Fawwaz", id: "", name: "", releaseDate: "", artistId: "", artistUrl: "", artworkUrl100: "", url: ""))
}
