//
//  SearchView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Properties
    
    @State private var songs: [ArtistDetails] = []
    @State private var text: String = ""
    @State private var selectedURL: SearchFilter = .song
    
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Search Music", text: $text)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: fetchSongs) {
                        Text("Search")
                            .foregroundStyle(.red)
                    }
                }
                .padding()
                
                Picker("Filter", selection: $selectedURL ) {
                    ForEach(SearchFilter.allCases) { filter in
                        Text(filter.name)
                            .tag(filter)
                    } 
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                List(songs) { song in
                    NavigationLink {
                        SongDetailView(artistName: song.artistName, name: song.trackName ?? song.collectionName, artistViewUrl: song.artistViewUrl, previewUrl: song.previewUrl ?? "", artworkUrl100: song.artworkUrl100)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: song.artworkUrl100)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.trailing, 8)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment: .leading) {
                                Text("\(song.artistName)")
                                    .font(.subheadline)
                                    .bold()
                                
                                Text(song.trackName ?? song.collectionName)
                                    .font(.caption)
                            }
                        }
                    }    
                }
                
            }
            .navigationTitle("Music Finder")
            .onChange(of: selectedURL) {
                text = ""
                fetchSongs()
            }
            .task {
                fetchSongs()
            }
        }
    }
    
    // MARK: - Functions
    
    private func fetchSongs() {
        Task {
            do {
                songs = try await getSongsFromAPI()
            } catch let error as HTTPError {
                print(error.message)
            } catch {
                print(error)
            }
        }
    }
    
    private func getSongsFromAPI() async throws -> [ArtistDetails] {
        var urlString = "https://itunes.apple.com/search?term=\(text)media=music"
        switch selectedURL {
        case .song:
            urlString = "https://itunes.apple.com/search?term=\(text)&entity=song&limit=15"
        case .album:
            urlString = "https://itunes.apple.com/search?term=\(text)&entity=album&limit=15"
        }
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(SearchResults.self, from: data).results
        
    }
}

#Preview {
    SearchView()
}
