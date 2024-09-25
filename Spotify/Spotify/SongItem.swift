//
//  SwiftUIView.swift
//  Spotify
//
//  Created by Turma01-9 on 25/09/24.
//

import SwiftUI

struct SongItem: View {
    var song: Song

    var body: some View {
        NavigationLink(destination: SongScreen(song: song)) {
            HStack {
                AsyncImage(url: URL(string: song.coverURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                    
                        // Para arredondar a imagem, se desejar
                        // .clipShape(Circle())
                    
                } placeholder: {
                    // Placeholder enquanto a imagem está carregando
                    ProgressView()
                }
                
                // Alinhe o texto à esquerda
                VStack(alignment: .leading) {
                    Text(song.name)
                        .fontWeight(.bold)
                    Text(song.artist)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Isso empurra o botão para a direita
                Spacer()
                
                Button(action: {
                    // Ação do botão
                }) {
                    Image(systemName: "ellipsis")
                }
            }
            // Defina uma largura fixa
            .frame(width: 350)
            // Adiciona padding ao redor do item
        }
        // Se quiser adicionar padding horizontal
        .padding(.horizontal)
    }
}

