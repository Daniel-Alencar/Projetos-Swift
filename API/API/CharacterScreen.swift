//
//  CharacterScreen.swift
//  API
//
//  Created by Turma01-9 on 27/09/24.
//

import SwiftUI

struct CharacterScreen: View {
    
    var character : HaPo;
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())

                
            } placeholder: {
                // Placeholder enquanto a imagem está carregando
                VStack {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                
            }
            
            
            Text(character.actor!)
            Text(character.dateOfBirth!)
            Spacer()
        }
    }
}
