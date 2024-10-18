//
//  ContentView.swift
//  websocket
//
//  Created by Turma01-9 on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WebSocketViewModel()
    
    var body: some View {
        VStack {
            Text("WebSocket ESP32")
                .font(.largeTitle)
                .padding()
            
            TextField("Digite seu nome", text: $viewModel.playerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .disabled(viewModel.isConfirmed)
            
            Button(action: {
                viewModel.confirmPlayer()
            }) {
                Text("Confirmar")
                    .padding()
                    .background(viewModel.isConfirmed ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(viewModel.isConfirmed || viewModel.playerName.isEmpty)
            .padding()
            
            List(viewModel.players, id: \.self.name) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    Text(player.confirmation ? "Confirmado" : "Não Confirmado")
                        .foregroundColor(player.confirmation ? .green : .red)
                }
            }
            
            VStack {
                Text("value: \(viewModel.value)")
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.connectWebSocket()
        }
        .onDisappear {
            viewModel.disconnectWebSocket()
        }
    }
}

#Preview {
    ContentView()
}
