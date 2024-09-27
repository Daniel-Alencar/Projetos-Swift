//
//  CharacterView.swift
//  API
//
//  Created by Turma01-9 on 27/09/24.
//

import SwiftUI

struct CharacterView: View {
    
    var character : HaPo;
    @State private var isSheetPresented = false;

    var body: some View {
        HStack {
            Button(action: {
                isSheetPresented = true
            }) {
                AsyncImage(url: URL(string: character.image!)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())

                    
                } placeholder: {
                    // Placeholder enquanto a imagem está carregando
                    VStack {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    
                }
                Text(character.name!)
                    .foregroundStyle(.white)
                    .font(.title2)
                Spacer()
            }
            .sheet(isPresented: $isSheetPresented) {
                CharacterScreen(character: character)
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
