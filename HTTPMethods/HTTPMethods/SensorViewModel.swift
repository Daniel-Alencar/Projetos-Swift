//
//  UserViewModel.swift
//  Métodos HTTP
//
//  Created by Turma01-9 on 02/10/24.
//

import Foundation
import Combine

struct LogDetails: Codable, Identifiable {
    var _id: String
    var _rev: String
    var hora: String
    var umidade: String
    
    var id: String {
        return _id;
    }
}

class SensorViewModel: ObservableObject {
    @Published var logDetails: [LogDetails] = []
    
    // Timer para atualização automática
    private var timer: AnyCancellable?

    init() {
        // Configura o timer para buscar novos logs a cada 10 segundos
        self.timer = Timer.publish(every: 10, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.fetchLogs()
            }
    }
    
    deinit {
        // Cancelar o timer quando o ViewModel for desalocado
        timer?.cancel()
    }

    func fetchLogs() {
        guard let url = URL(string: "http://127.0.0.1:1880/get") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Verificar se houve erros
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            // Verificar a resposta e os dados
            if let data = data {
                do {
                    // Decodificar os dados JSON no modelo
                    let decodedLogs = try JSONDecoder().decode([LogDetails].self, from: data)
                    
                    // Atualizar os dados na main thread
                    DispatchQueue.main.async {
                        self.logDetails = decodedLogs
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
        
        // Iniciar a tarefa de rede
        task.resume()
    }
}
