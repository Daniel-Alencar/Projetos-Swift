import SwiftUI

struct PlaylistDetails: View {
    
    @State private var playlistName = "Hackatruck FM";
    
    var body: some View {
        VStack {
            VStack {
                Image("image")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            HStack {
                Text(playlistName)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal)
            HStack {
                Image(systemName: "person.crop.circle")
                Text("Daniel Alencar")
            }
            .padding(.horizontal)
            .padding(.bottom)
            
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
