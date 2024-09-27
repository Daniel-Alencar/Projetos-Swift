//
//  ContentView.swift
//  API
//
//  Created by Turma01-9 on 27/09/24.
//

import SwiftUI

var GryffindorURL = "https://rukminim2.flixcart.com/image/850/1000/l02r1jk0/poster/9/k/c/medium-gryffindor-poster-harry-potter-a3-wall-poster-pack-of-1-original-imagbxchyhbethwv.jpeg?q=90&crop=false";

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            
            Color("Gryffindor")
            
            VStack {
                ZStack {
                    Image("salao_comunal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 300)
                        .ignoresSafeArea(.all)
                    AsyncImage(url: URL(string: GryffindorURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .opacity(0.2)
                        
                    } placeholder: {
                        // Placeholder enquanto a imagem está carregando
                        ProgressView()
                    }
                }
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.chars) { character in
                            CharacterView(character: character)
                        }
                    }
                }
            }
            .onAppear() {
                viewModel.fetchData()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
