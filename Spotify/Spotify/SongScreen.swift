import SwiftUI

struct SongButton: View {
    
    var image: String
    var size: Double?
    
    var body: some View {
        Button(action: {
            print("AQUII")
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
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)
                HStack {
                    Image(systemName: "person.crop.circle")
                    Text(song.artist)
                }
                .padding(.horizontal)
                
                HStack {
                    SongButton(image: "repeat")
                    SongButton(image: "backward.fill")
                    SongButton(image: "play.fill", size: 60)
                    SongButton(image: "forward.fill")
                    SongButton(image: "shuffle")
                }
            }
            .foregroundColor(.white)
            
            
        }
    }
}

#Preview {
    ContentView()
}
