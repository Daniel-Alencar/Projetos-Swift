//
//  ContentView.swift
//  Mapas
//
//  Created by Turma01-9 on 26/09/24.
//

import SwiftUI
import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}

var countryLocations = [
    Location(
        name: "Brazil",
        coordinate: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1000px-Flag_of_Brazil.svg.png",
        description: "Brazil, known for its Amazon rainforest and vibrant culture."
    ),
    Location(
        name: "United States",
        coordinate: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        flag: "https://static.mundoeducacao.uol.com.br/mundoeducacao/2022/05/bandeira-estados-unidos.jpg",
        description: "The United States, home to a diverse landscape and leading global economy."
    ),
    Location(
        name: "Japan",
        coordinate: CLLocationCoordinate2D(latitude: 36.2048, longitude: 138.2529),
        flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/2560px-Flag_of_Japan.svg.png",
        description: "Japan, famous for its technology, traditional arts, and cherry blossoms."
    ),
    Location(
        name: "Germany",
        coordinate: CLLocationCoordinate2D(latitude: 51.1657, longitude: 10.4515),
        flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/2560px-Flag_of_Germany.svg.png",
        description: "Germany, known for its rich history, automotive industry, and Oktoberfest."
    ),
    Location(
        name: "Australia",
        coordinate: CLLocationCoordinate2D(latitude: -25.2744, longitude: 133.7751),
        flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png",
        description: "Australia, known for its Outback, wildlife, and Great Barrier Reef."
    )
]


struct ContentView: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -142350, longitude: -519253),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    @State private var isSheetPresented = false
    
    
    var body: some View {
        ZStack {
            VStack {
                Map(position: $position)
                    .ignoresSafeArea()
            }
            
            VStack {
                VStack {
                    Text("World map")
                    Text("Brazil")
                }
                
                Spacer()
                
                HStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 50) {
                            ForEach(countryLocations) { location in
                                Button(action: {
                                    isSheetPresented = true
                                }) {
                                    AsyncImage(url: URL(string: location.flag)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                        
                                        // Para arredondar a imagem, se desejar
                                        // .clipShape(Circle())
                                        
                                    } placeholder: {
                                        // Placeholder enquanto a imagem está carregando
                                        ProgressView()
                                    }
                                }
                                .sheet(isPresented: $isSheetPresented) {
                                    CountryDetails(country: location)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
