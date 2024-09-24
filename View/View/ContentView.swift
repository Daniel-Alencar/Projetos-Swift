//
//  ContentView.swift
//  aula2
//
//  Created by Turma01-9 on 19/09/24.

import SwiftUI

struct Header: View {
    @Binding var name: String;
    
    var body: some View {
        VStack {
            Text("Bem vindo, \(name)")
                .font(.title)
                
            TextField("Digite seu nome", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
        }
    }
}

struct Images: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 270, height: 100)
        Image("truck")
            .resizable()
            .scaledToFit()
            .frame(width: 270, height: 100)
    }
}

struct ContentView: View {
    // Estado para controlar o nome
    @State private var name = ""
    // Estado para controlar o alerta
    @State private var showAlert = false
    
    var body: some View {
        ZStack () {
            Image("image")
                .imageScale(.medium)
                .blur(radius: 15.0)
            
            Color.white.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 200){
                VStack {
                    Header(name: $name)
                }
                VStack {
                    Images()
                }

                Button(action: {
                    if name.isEmpty {
                        print("Nome não inserido")
                    } else {
                        print("Botão foi clicado")
                        showAlert = true
                    }
                }) {
                    Text(
                            name.isEmpty
                            ? "Digite seu nome antes..."
                            : "Clique aqui"
                        )
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("ALERTA"),
                message: Text("\(name), tu é mano 😳🏳️‍🌈?"),
                dismissButton: .default(Text("Sim"))
            )
            
        }
    }
}

#Preview {
    ContentView()
}
