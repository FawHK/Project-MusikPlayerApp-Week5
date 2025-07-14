//
//  ImageView.swift
//  MusicPlayer
//
//  Created by Fawwaz Hajj Khalid on 12.09.24.
//

import SwiftUI

struct ImageView: View {
    
    // MARK: - Properties
    
    let artworkUrl100: String
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: artworkUrl100)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 360, height: 210)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    ImageView(artworkUrl100: "")
}
