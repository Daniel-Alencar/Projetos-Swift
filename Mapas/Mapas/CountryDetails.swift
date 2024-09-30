//
//  CountryDetails.swift
//  Mapas
//
//  Created by Turma01-9 on 26/09/24.
//

import SwiftUI

struct CountryDetails: View {
    var country: Location

    var body: some View {
        VStack {
            Text(country.name)
                .font(.largeTitle) // Título maior
                .fontWeight(.bold) // Negrito
                .padding(.top) // Espaçamento acima do título
            
            VStack {
                AsyncImage(url: URL(string: country.flag)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 250)
                        .clipShape(Circle()) // Arredondando a imagem
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2)) // Borda cinza
                        .shadow(radius: 10) // Sombra na imagem
                } placeholder: {
                    ProgressView()
                        .frame(width: 250, height: 250) // Placeholder do mesmo tamanho da imagem
                }
            }
            .padding(.bottom) // Espaçamento abaixo da imagem

            Text(country.description)
                .font(.body) // Estilo de fonte do corpo
                .padding() // Padding ao redor do texto
                .multilineTextAlignment(.center) // Alinhamento centralizado
                .background(Color(.systemGray6)) // Fundo cinza claro
                .cornerRadius(10) // Cantos arredondados
                .padding(.horizontal) // Padding horizontal
            
            Spacer() // Espaço para empurrar o conteúdo para cima
        }
        .padding() // Padding geral
        .background(Color.white) // Fundo branco
        .navigationBarTitleDisplayMode(.inline) // Título do nav bar em modo inline
    }
}

#Preview {
    CountryDetails(country: countryLocations[0]) // Exibe o primeiro país como exemplo
}
