//
//  SwiftUIView.swift
//  Spotify
//
//  Created by Turma01-9 on 25/09/24.
//

import SwiftUI

struct SuggestedPlaylists: View {
    
    var body: some View {
        VStack {
            HStack{
                Text("Playlists sugeridas")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
            ScrollView (.horizontal) {
                
                HStack {
                    ForEach(playlistsList) { playlist in
                        PlaylistComponent(playlist: playlist)
                    }
                }
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
