import Foundation
import SwiftUI

struct Player: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var confirmation: Bool
}

class WebSocketViewModel: ObservableObject {
    @Published var playerName: String = ""
    @Published var isConfirmed: Bool = false
    @Published var players: [Player] = []
    
    @Published var value: Bool = false
    
    private var webSocketTask: URLSessionWebSocketTask?
    
    func connectWebSocket() {
        guard let url = URL(string: "ws://esp32.local/ws") else {
            print("URL inválida")
            return
        }
        
        webSocketTask = URLSession(configuration: .default).webSocketTask(with: url)
        webSocketTask?.resume()
        
        receiveMessage()
    }
    
    func disconnectWebSocket() {
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
    }
    
    func confirmPlayer() {
        guard !playerName.isEmpty else { return }
        
        let message = [
            "name": playerName,
            "confirmation": true
        ] as [String : Any]
        
        if let data = try? JSONSerialization.data(withJSONObject: message) {
            sendMessage(data: data)
            isConfirmed = true
        }
    }
    
    private func sendMessage(data: Data) {
        let message = URLSessionWebSocketTask.Message.data(data)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Erro ao enviar mensagem: \(error)")
            }
        }
    }
    
    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .data(let data):
                    self?.handleReceivedData(data: data)
                case .string(let text):
                    // Tentar decodificar o texto como JSON para identificar qual função chamar
                    if let data = text.data(using: .utf8) {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                            
                            if json?["name"] != nil && json?["confirmation"] != nil {
                                // Se o JSON contém "name" e "confirmation", chama handleReceivedText
                                self?.handleReceivedText(text: text)
                            } else if json?["value"] != nil {
                                // Se o JSON contém "value", chama handleReceivedValue
                                self?.handleReceivedValue(text: text)
                            } else {
                                print("Formato de mensagem JSON desconhecido: \(text)")
                            }
                        } catch {
                            print("Erro ao decodificar JSON: \(error)")
                        }
                    }
                @unknown default:
                    break
                }
            case .failure(let error):
                print("Erro ao receber mensagem: \(error)")
            }

            // Continuar recebendo mensagens
            self?.receiveMessage()
        }
    }
    
    private func handleReceivedText(text: String) {
        print("Mensagem recebida (string): \(text)")

        // Tentar decodificar o texto como JSON
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let json = json,
                   let name = json["name"] as? String,
                   let confirmation = json["confirmation"] as? Bool {

                    // Criar um novo jogador
                    let player = Player(name: name, confirmation: confirmation)

                    // Adicionar o jogador ao array de players
                    DispatchQueue.main.async {
                        self.players.append(player)
                    }

                    print("Nome: \(name), Confirmação: \(confirmation)")
                }
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
        }
    }
    
    private func handleReceivedValue(text: String) {
        print("Mensagem recebida (string): \(text)")

        // Tentar decodificar o texto como JSON
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let json = json,
                   let value = json["value"] as? Bool {

                    // Aqui você pode usar o valor de 'value' como necessário.
                    DispatchQueue.main.async {
                        // Supondo que você queira atualizar o valor de confirmação
                        self.value = value
                    }

                    print("Valor: \(value)")
                }
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
        }
    }

    
    private func handleReceivedData(data: Data) {
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
           let jsonDict = jsonObject as? [String: Any],
           let playerName = jsonDict["name"] as? String,
           let confirmation = jsonDict["confirmation"] as? Bool {
            
            DispatchQueue.main.async { [weak self] in
                print("Nome do jogador recebido: \(playerName), confirmação: \(confirmation)")
                
                // Verifique se o jogador já está na lista
                if let existingPlayerIndex = self?.players.firstIndex(where: { $0.name == playerName }) {
                    // Atualiza o jogador existente
                    self?.players[existingPlayerIndex].confirmation = confirmation
                } else {
                    // Adiciona novo jogador
                    self?.players.append(Player(name: playerName, confirmation: confirmation))
                }
            }
        } else {
            print("Erro ao decodificar o JSON ou JSON inesperado.")
        }
    }
}
