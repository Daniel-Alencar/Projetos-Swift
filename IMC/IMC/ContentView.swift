import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            Text("Calculadora de IMC")
                .font(.title)
        }
    }
}

struct Forms: View {
    @Binding var mass: Double
    @Binding var height: Double
    @Binding var imcResult: String
    @Binding var color: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Massa (kg)")
            TextField("Massa (kg)", value: $mass, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
                .keyboardType(.decimalPad)
            
            Text("Altura (cm)")
            TextField("Altura (cm)", value: $height, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
                .keyboardType(.decimalPad)
            
            Button(action: {
                if mass <= 0 || height <= 0 {
                    imcResult = "Por favor, preencha todos os campos."
                } else {
                    let heightInMeters = height / 100.0
                    let imc = mass / (heightInMeters * heightInMeters)
                    
                    if imc < 18.5 {
                        imcResult = "Baixo peso"
                        color = "Baixo_peso"
                    } else if imc < 25 {
                        imcResult = "Peso normal"
                        color = "Normal_peso"
                    } else if imc < 30 {
                        imcResult = "Sobrepeso"
                        color = "Sobre_peso"
                    } else {
                        imcResult = "Obesidade"
                        color = "Obesidade"
                    }
                }
            }) {
                Text("Calcular")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(imcResult)
                .font(.headline)
                .padding()
        }
    }
}

struct TableView: View {
    var body: some View {
        VStack {
            Image("tabela-IMC")
                .resizable()
                .scaledToFit()
                .frame(width: 370, height: 160)
        }
    }
}

struct ContentView: View {
    @State private var mass = 0.0
    @State private var height = 0.0
    @State private var imcResult = ""
    @State private var color = "normal_peso"
    
    var body: some View {
        ZStack {
            Color(color)
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                Header()
                Forms(mass: $mass, height: $height, imcResult: $imcResult, color: $color)
                TableView()
            }
        }
    }
}

#Preview {
    ContentView()
}
