import PlaygroundSupport
import SwiftUI
import AVKit
let player = AVPlayer(url:  Bundle.main.url(forResource: "cryptoVideo", withExtension: "mp4")!)
PlaygroundPage.current.setLiveView(
    VideoPlayer(player:player)
        .onAppear() {
            player.play()
        }
    
)

let timer = Timer.scheduledTimer(withTimeInterval: 7.0, repeats: false) { timer in
    PlaygroundPage.current.assessmentStatus = .pass(message:"### To Quote Yannick Sierra \"Welcome to the Bitcoin Session (Just Kidding) \" [**Click Here for next Page!**](@next)")
}


