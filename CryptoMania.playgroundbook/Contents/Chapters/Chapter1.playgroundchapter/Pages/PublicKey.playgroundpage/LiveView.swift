import PlaygroundSupport
import SwiftUI

PlaygroundPage.current.setLiveView(
    ZStack{
        Image("diffieHellman")
            .resizable()
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
        VStack(alignment: .trailing) {
            Spacer()
            Text("Founding Fathers of Public Key Cryptography")
                .padding()
                .background(Color.white
                                .shadow(color:.black,radius: 5))
                .border(Color.white, width: 4)
                .foregroundColor(.black)
                .font(.custom("HelveticaNeue-UltraLight", size: 33))
                .padding()
        }
        
    }
)


   



