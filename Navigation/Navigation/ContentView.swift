//
//  ContentView.swift
//  Navigation
//
//  Created by Turma01-9 on 23/09/24.
//

import SwiftUI


struct Mode1: View {
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text("Modo 1")
                    .font(.title)
                
                VStack {
                    Text("Nome: Tiago")
                    Text("Sobrenome: Pereira")
                }
                .foregroundColor(.white)
                .padding(30)
                .background(.pink)
                .cornerRadius(10)
                
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct Mode2: View {
    
    @State private var name = "";
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text("Modo 2")
                    .font(.title)
                
                VStack {
                    TextField("Nome", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300)
                        .foregroundColor(.black)
                    
                    Text("Bem vindo, \(name)")
                    
                    NavigationLink(destination: Mode2Son(name: name)) {
                        Text(
                            name.isEmpty
                            ? "Digite seu nome antes..."
                            : "Acessar tela"
                        )
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .foregroundColor(.white)
                .padding(30)
                .background(.pink)
                .cornerRadius(10)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct Mode2Son: View {
    
    var name: String;
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text("Volte, \(name)!")
                    .font(.title)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct Mode3: View {
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text("Modo 3")
                    .font(.title)
                
                VStack {
                    Text("Nome: Tiago")
                    Text("Sobrenome: Pereira")
                }
                .foregroundColor(.white)
                .padding(30)
                .background(.pink)
                .cornerRadius(10)
            }
        }
    }
}

struct ContentView: View {
    
    @State private var isSheetPresented = false;
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                
                VStack (spacing: 10) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding()
                    
                    
                    VStack {
                        ZStack() {
                            ZStack {
                                Color.pink
                                    .frame(width: 200, height: 100)
                                NavigationLink(destination: Mode1()) {
                                    Text("Modo 1")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                    
                                }
                            }
                            .cornerRadius(20)
                        }
                    }
                    
                    VStack {
                        ZStack() {
                            ZStack {
                                Color.pink
                                    .frame(width: 200, height: 100)
                                NavigationLink(destination: Mode2()) {
                                    Text("Modo 2")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                    
                                }
                            }
                            .cornerRadius(20)
                        }
                    }
                    
                    VStack {
                        ZStack() {
                            ZStack {
                                Color.pink
                                    .frame(width: 200, height: 100)
                                Button(action: {
                                    isSheetPresented = true
                                }) {
                                    Text("Modo 3")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                }
                                .sheet(isPresented: $isSheetPresented) {
                                    Mode3()
                                }
                            }
                            .cornerRadius(20)

                        }
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
