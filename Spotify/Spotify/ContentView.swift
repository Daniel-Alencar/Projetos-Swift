//
//  ContentView.swift
//  Spotify
//
//  Created by Turma01-9 on 24/09/24.
//

import SwiftUI

struct Song: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var coverURL: String
}

struct Playlist: Identifiable {
    var id: Int
    var name: String
    var coverURL: String
}

var songsList = [
    Song(id: 1, name: "Numb Encore", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 2, name: "Lost", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 3, name: "In the End", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 4, name: "Crawling", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 5, name: "Somewhere I Belong", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 6, name: "Bleed It Out", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 7, name: "New Divide", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 8, name: "Waiting for the End", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 9, name: "What I've Done", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg"),
    Song(id: 10, name: "One Step Closer", artist: "Link Park", coverURL: "https://upload.wikimedia.org/wikipedia/en/d/d6/14_Numb-Encore_%28CD_single%29.jpg")
]

var playlistsList = [
    Playlist(id: 1, name: "The Dark Side", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 2, name: "Classic Rock Hits", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 3, name: "Chill Vibes", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 4, name: "Road Trip Tunes", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 5, name: "Workout Motivation", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 6, name: "Party Playlist", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 7, name: "Study Sessions", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 8, name: "Top 100 Songs", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 9, name: "Indie Essentials", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png"),
    Playlist(id: 10, name: "Relaxing Music", coverURL: "https://upload.wikimedia.org/wikipedia/pt/3/3b/Dark_Side_of_the_Moon.png")
]



struct PlaylistDetails: View {
    
    @State private var playlistName = "Hackatruck FM";
    
    var body: some View {
        VStack {
            VStack {
                Image("image")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            HStack {
                Text(playlistName)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding()
            HStack {
                Image(systemName: "person.crop.circle")
                Text("Daniel Alencar")
                Spacer()
            }
            .padding()
        }
    }
}

struct SongScreen: View {
    
    var song: Song
    
    var body: some View {
        VStack {
            
        }
    }
}

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

struct SuggestedPlaylists: View {
    
    var body: some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(playlistsList) { playlist in
                    PlaylistComponent(playlist: playlist)
                }
            }
        }
        .padding()
    }
}

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


struct SongsList: View {
    var body: some View {
        VStack {
            
                ForEach(songsList) { song in
                    SongItem(song: song)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        PlaylistDetails()
                        SongsList()
                        SuggestedPlaylists()
                    }
                }
            }
        }
        .background(.red)
    }
}

#Preview {
    ContentView()
}
