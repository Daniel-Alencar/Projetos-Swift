//
//  SwiftUIView.swift
//  Spotify
//
//  Created by Turma01-9 on 25/09/24.
//

import SwiftUI

struct SongsList: View {
    var body: some View {
        VStack {
            ForEach(songsList, id: \.id) { song in
                    SongItem(song: song)
            }
        }
        .foregroundColor(.white)
    }
}
