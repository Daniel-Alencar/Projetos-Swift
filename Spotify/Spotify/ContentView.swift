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
