//
//  ContentView.swift
//  TabView
//
//  Created by Turma01-9 on 23/09/24.
//

import SwiftUI

struct ItemList: View {
    
    @State var image: String
    
    var body: some View {
        VStack {
            HStack(spacing: 220) {
                Text("Item")
                    .font(.title2)
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            .padding()
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            ZStack {
                Color.pink.opacity(1)
                ZStack {
                    Color.black.opacity(1)
                        .cornerRadius(200)
                        .frame(width: 250, height: 250)
                    Image(systemName: "paintbrush")
                        .resizable()
                        .foregroundColor(.pink)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
            }
            .tabItem {
                Label("Rosa", systemImage: "paintbrush.fill")
            }
            .edgesIgnoringSafeArea(.top)
            
            ZStack {
                Color.blue.opacity(1)
                ZStack {
                    Color.black.opacity(1)
                        .cornerRadius(200)
                        .frame(width: 250, height: 250)
                    Image(systemName: "paintbrush.pointed")
                        .resizable()
                        .foregroundColor(.blue)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
            }
            .tabItem {
                Label("Azul", systemImage: "paintbrush.pointed.fill")
            }
            .edgesIgnoringSafeArea(.top)
            
            ZStack {
                Color.gray.opacity(1)
                ZStack {
                    Color.black.opacity(1)
                        .cornerRadius(200)
                        .frame(width: 250, height: 250)
                    Image(systemName: "paintpalette")
                        .resizable()
                        .foregroundColor(.gray)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
            }
            .tabItem {
                Label("Cinza", systemImage: "paintpalette.fill")
            }
            .edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Lista de páginas em tela")
                    .font(.title)
                ItemList(image: "paintbrush.fill")
                ItemList(image: "paintbrush.pointed.fill")
                ItemList(image: "paintpalette.fill")
                
            }
            .tabItem {
                Label("Lista", systemImage: "list.bullet")
            }
                        
        }
    }
}

#Preview {
    ContentView()
}
