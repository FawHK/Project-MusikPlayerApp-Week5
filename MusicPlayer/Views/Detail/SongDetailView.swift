//
//  DetailSongsView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 13.09.24.
//

import SwiftUI
import AVFoundation

struct SongDetailView: View {
    
    // MARK: - Properties
    
    @State private var previewPlayer: AVPlayer?
    @State private var isPlaying = false
    
    
    
    // MARK: - Body
    
    let artistName: String
    let name: String
    let collectionName: String = ""
    var trackName: String?
    let artistViewUrl: String?
    var previewUrl: String
    var artistUrl: String = ""
    let artworkUrl100: String
    
    var body: some View {
        
        VStack(spacing: 50)  {
            ImageView(artworkUrl100: artworkUrl100)
            Button {
            } label: {
                if let url = URL(string: artistViewUrl ?? artistUrl) {
                    Link(destination: url) {
                        Image(.appleMusicBadge)
                            .resizable()
                            .frame(width: 150, height: 50)
                            .scaledToFit()
                    }
                }
            }
            
            VStack(spacing: 10) {
                
                HStack {
                    Text("Artist: ")
                    Text(artistName)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("Track")
                    Text(trackName ?? name)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Play Preview")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button(action: audioPlay) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(isPlaying ? .blue : .red)
                    }
                    Button(action: audioPlay) {
                        Image(systemName: "pause.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(isPlaying ? .red : .blue)
                    }
                }
                .padding()
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 40))
                
            }
            .padding()
            .font(.subheadline)
            .padding(.bottom, 150)
        }
    }
    // MARK: - Functions
    
    private func pausePreview() {
        if !isPlaying {
            previewPlayer?.pause()
            isPlaying.toggle()
        }
    }
    private func playPreview() {
        if isPlaying {
            previewPlayer?.play()
            isPlaying.toggle()
        }
    }
    private func audioPlay() {
        let urlString = previewUrl
        guard let Url = URL(string: urlString) else {
            return
        }
        previewPlayer = AVPlayer(url: Url)
        previewPlayer?.play()
    }
}

#Preview {
    SongDetailView(artistName: "Fawwaz", name: "dd", artistViewUrl: "", previewUrl: "", artistUrl: "df", artworkUrl100: "")
}
