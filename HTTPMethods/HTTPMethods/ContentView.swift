import SwiftUI
import Charts // Importar o framework Charts para gráficos

struct ContentView: View {
    // Instanciar o ViewModel
    @StateObject var viewModel = SensorViewModel()

    var body: some View {
        NavigationView {
            VStack {
                
                Chart(viewModel.logDetails) { logDetails in
                    LineMark(
                        x: .value("Hora", logDetails.hora),
                        y: .value("Umidade", Double(logDetails.umidade) ?? 0.0)
                    )
                    // Suavizar as linhas do gráfico
                    .interpolationMethod(.catmullRom)
                    // Cor da linha
                    .foregroundStyle(.blue)
                    // Simbolizar cada ponto com um círculo
                    .symbol(Circle())
                }
                // Altura do gráfico
                .frame(height: 300)
                .padding()
                .navigationTitle("Umidade")
                .onAppear {
                    // Chamar a função para buscar os dados
                    viewModel.fetchLogs()
                }
                .padding()
                
                List(viewModel.logDetails) { logDetails in
                    VStack(alignment: .leading) {
                        Text(logDetails.hora)
                            .font(.headline)
                        
                        // Exibir a umidade com uma barra de progresso animada
                        HStack {
                            Text("Umidade: \(logDetails.umidade)%")
                                .font(.subheadline)
                            Spacer()
                            
                            // ProgressView com animação baseada nos valores de umidade
                            ProgressView(value: Double(logDetails.umidade) ?? 0.0, total: 100)
                                .progressViewStyle(LinearProgressViewStyle())
                                .frame(width: 150)
                                .animation(.easeInOut(duration: 1.0), value: logDetails.umidade)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
