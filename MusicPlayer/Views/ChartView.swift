//
//  MainView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 09.09.24.
//

import SwiftUI


struct ChartView: View {
    // MARK: - Properties
    
    @State private var charts: [ChartEntry] = []
    @State private var selectedCountry: Country = .germany
 
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    Picker("Select Country", selection: $selectedCountry) {
                        ForEach(Country.allCases) { country in
                            Text("\(country.name)")
                                .tag(country)
                        }
                    }
                }
                    
                ForEach(charts, id: \.id) { song in
                    HStack {
                        let str = song.artworkUrl100
                        let url = URL(string: str)
                        
                        AsyncImage(url: url) { image in
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
                            
                            Text(song.name)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Charts")
        }
        .onChange(of: selectedCountry) {
            fetchSongs()
        }
        .task {
            fetchSongs()
        }
    }
    
    // MARK: - Functions
    
    private func fetchSongs() {
        Task {
            do {
                charts = try await getSongsFromAPI()
            } catch let error as HTTPError {
                print(error.message)
            } catch {
                print(HTTPError.fetchFailed.message)
            }
        }
    }
    
    
    private func getSongsFromAPI() async throws -> [ChartEntry] {
        let urlString = selectedCountry.url
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Chart.self, from: data).feed.results

    }
    
    
//    private func fetchSongsFromJSON() {
//        guard let path = Bundle.main.path(forResource: "ChartsDE", ofType: "json") else {
//            print("File doesn't exist")
//            return
//        }
//        do {
//            let data = try Data(contentsOf: URL(filePath: path))
//            let songs = try JSONDecoder().decode(Chart.self, from: data)
//            
//            self.charts = songs.feed.results
//        } catch {
//            print("Error \(error)")
//            return
//        }
//    }
}

#Preview {
    ChartView()
        .preferredColorScheme(.dark)
}
