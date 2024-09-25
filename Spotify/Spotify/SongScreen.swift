import SwiftUI
import AVFoundation

struct SongButton: View {
    
    var image: String
    var size: Double?
    // Ação personalizada ao clicar no botão
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            // Executa a ação passada como argumento
            action()
        }) {
            Image(systemName: image)
                .resizable()
                .foregroundColor(.white)
                .frame(width: size ?? 40.0, height: size ?? 40.0)
        }
        .padding()
    }
}

struct SongScreen: View {
    
    var song: Song
    // Estado para controlar o ícone play/pause
    @State private var isPlaying = false
    // Player de áudio
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                VStack {
                    Image("image")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                HStack {
                    Text(song.name)
                        .font(.title)
                }
                .padding(.horizontal)
                HStack {
                    Image(systemName: "person.crop.circle")
                    Text(song.artist)
                }
                .padding(.horizontal)
                
                HStack {
                    SongButton(image: "repeat") {}
                    SongButton(image: "backward.fill") {}
                    
                    // Botão de play/pause
                    SongButton(image: isPlaying ? "pause.fill" : "play.fill", size: 60) {
                        if isPlaying {
                            pauseMusic()
                        } else {
                            playMusic()
                        }
                        isPlaying.toggle()
                    }
                    
                    SongButton(image: "forward.fill") {}
                    SongButton(image: "shuffle") {}
                }
            }
            .foregroundColor(.white)
        }
        .onAppear {
            print("Tela apareceu, chamando setupAudioPlayer()")
            setupAudioPlayer()
        }
    }
    
    // Configura o AVAudioPlayer com a música
    func setupAudioPlayer() {
        print("Tentando carregar o arquivo: \(song.fileName).\(song.fileExtension)")
        if let url = Bundle.main.url(forResource: song.fileName, withExtension: song.fileExtension) {
            print("URL encontrado: \(url)")
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                print("Audio preparado para tocar")
            } catch {
                print("Erro ao carregar o arquivo de áudio: \(error)")
            }
        } else {
            print("Arquivo de música não encontrado.")
        }
    }

    // Função para tocar a música
    func playMusic() {
        audioPlayer?.play()
        print("Playing")
    }
    
    // Função para pausar a música
    func pauseMusic() {
        audioPlayer?.pause()
        print("Pausando")
    }
}

#Preview {
    ContentView()
}
