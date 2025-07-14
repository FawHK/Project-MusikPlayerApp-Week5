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
        
        VStack  {
            let isPreviewAvailable = previewUrl.contains(".m4a") || previewUrl.contains(".mp3")
            
            Spacer()
            ImageView(artworkUrl100: artworkUrl100)
            Button {
            } label: {
                if let url = URL(string: artistViewUrl ?? artistUrl) {
                    Link(destination: url) {
                        Image(.appleMusicBadge)
                            .resizable()
                            .frame(width: 150, height: 50)
                            .scaledToFit()
                            .padding(.top, 40.5)
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
                    Text("Track: ")
                    Text(trackName ?? name)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Play Preview")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Button {
                        if isPlaying {
                            audioPause()
                        } else {
                            audioPlay()
                        }
                    } label: {
                        Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(isPlaying ? .red : .blue)
                    }
                    .disabled(!isPreviewAvailable)
                }
                .padding()
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 40))
                
                if !isPreviewAvailable {
                    Text("Preview is not available for this Song")
                        .font(.caption)
                } else {
                    Text("")
                }
                
            }
            .padding()
            .font(.subheadline)
            .padding(.bottom, 110)
        }
    }
    // MARK: - Functions
    
    private func audioPlay() {
        guard !previewUrl.isEmpty, let url = URL(string: previewUrl) else {
            print("Invalid or empty previewUrl: \(previewUrl)")
            return
        }
        previewPlayer = AVPlayer(url: url)
        previewPlayer?.play()
        isPlaying = true
    }

    private func audioPause() {
        previewPlayer?.pause()
        isPlaying = false
    }
}

#Preview {
    SongDetailView(artistName: "Fawwaz", name: "dd", artistViewUrl: "https://music.apple.com/ae/artist/alex-warren/1572671688", previewUrl: "", artistUrl: "https://music.apple.com/ae/artist/alex-warren/1572671688", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/46/78/fb/4678fb84-d19e-f11b-93ff-4dc17660bff8/075679619075.jpg/100x100bb.jpg")
}
