//
//  ContentView.swift
//  Spotify
//
//  Created by Turma01-9 on 24/09/24.
//

import SwiftUI

struct Playlist: Identifiable {
    var id: Int
    var name: String
    var coverURL: String
}

struct Song {
    var id: Int
    var name: String
    var artist: String
    var fileName: String
    var fileExtension: String
    var coverURL: String
}

let songsList: [Song] = [
    Song(id: 1,
         name: "Blinding Lights",
         artist: "The Weeknd",
         fileName: "blinding_lights",
         fileExtension: "mp3",
         coverURL: "https://link-da-capa.com/blinding_lights.jpg"),
    
    Song(id: 2,
         name: "Shape of You",
         artist: "Ed Sheeran",
         fileName: "shape_of_you",
         fileExtension: "mp3",
         coverURL: "https://link-da-capa.com/shape_of_you.jpg"),
    
    Song(id: 3,
         name: "Levitating",
         artist: "Dua Lipa",
         fileName: "levitating",
         fileExtension: "mp3",
         coverURL: "https://link-da-capa.com/levitating.jpg"),
    
    Song(id: 4,
         name: "Circles",
         artist: "Post Malone",
         fileName: "circles",
         fileExtension: "mp3",
         coverURL: "https://link-da-capa.com/circles.jpg"),
    
    Song(id: 5,
         name: "Dance Monkey",
         artist: "Tones and I",
         fileName: "dance_monkey",
         fileExtension: "mp3",
         coverURL: "https://link-da-capa.com/dance_monkey.jpg")
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



struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Background()
                
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
