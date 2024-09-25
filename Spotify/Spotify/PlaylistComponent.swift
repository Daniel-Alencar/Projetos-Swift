//
//  SwiftUIView.swift
//  Spotify
//
//  Created by Turma01-9 on 25/09/24.
//

import SwiftUI

struct PlaylistComponent: View {
    
    var playlist: Playlist
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: playlist.coverURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
            } placeholder: {
                // Placeholder enquanto a imagem está carregando
                ProgressView()
            }
            Text(playlist.name)
                .font(.caption)
        }
        
    }
}
