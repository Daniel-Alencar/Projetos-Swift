//
//  Background.swift
//  Spotify
//
//  Created by Turma01-9 on 25/09/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.blue, Color.black]),
            startPoint: .top,
            endPoint: .bottom
        )
            .ignoresSafeArea()
    }
}


#Preview {
    Background()
}
