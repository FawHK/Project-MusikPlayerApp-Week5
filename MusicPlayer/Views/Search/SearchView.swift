//
//  SearchView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 11.09.24.
//

import SwiftUI

struct SearchView: View {
    @State private var songs: [SongDetails] = []
    @State private var selectedCountry: Country = .germany
    @State private var text: String = ""
    
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Music", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
                    fetchSongs()
                    
                } label: {
                    Text("Search")
                        .foregroundStyle(.red)
                        .padding(.trailing)
                }
            }
            Section {
                Picker("Select Country", selection: $selectedCountry) {
                    ForEach(Country.allCases) { country in
                        Text("\(country.name)")
                            .tag(country)
                    }
                }
            }
            List(songs, id: \.trackId) { song in
                Text(song.artistName)
            
            }
            
        }
        .task {
            fetchSongs()
        }
    }
        
    
    
    private func fetchSongs() {
        Task {
            do {
                songs = try await getSongsFromAPI()
                print(songs)
            } catch let error as HTTPError {
                print(error.message)
            } catch {
                print(HTTPError.fetchFailed.message)
            }
        }
    }
    
    private func getSongsFromAPI() async throws -> [SongDetails] {
        let countryCode = selectedCountry.rawValue.lowercased()
        let urlString = "https://itunes.apple.com/search?term=\(text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&country=\(countryCode)"
      
        
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResonse = response as? HTTPURLResponse {
            print("Status Code: \(httpResonse.statusCode)")
        }
//        print(response)
        print(String(data: data, encoding: .utf8) ?? "No Data")
        return try JSONDecoder().decode(SearchResults.self, from: data).results
        
    }
}

#Preview {
    SearchView()
        .preferredColorScheme(.dark)
}
