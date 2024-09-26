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
         name: "The emptiness machine",
         artist: "Link Park",
         fileName: "the_emptiness_machine",
         fileExtension: "wav",
         coverURL: "https://i.scdn.co/image/ab67616d0000b273c0db065619ed208515412917"),
    
    Song(id: 2,
         name: "In the end",
         artist: "Link Park",
         fileName: "in_the_end",
         fileExtension: "wav",
         coverURL: "https://cdns-images.dzcdn.net/images/cover/2cdaf689097fd1db2e655b0fc12223a5/500x500.jpg"),
    
    Song(id: 3,
         name: "Numb",
         artist: "Link Park",
         fileName: "numb",
         fileExtension: "wav",
         coverURL: "https://i1.sndcdn.com/artworks-000105604285-me2956-t500x500.jpg")
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
