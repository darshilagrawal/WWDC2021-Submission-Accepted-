
import PlaygroundSupport
import SwiftUI
import AVKit
let player = AVPlayer(url:  Bundle.main.url(forResource: "Page1", withExtension: "mp4")!)
PlaygroundPage.current.setLiveView(
    VideoPlayer(player:player)
        .onAppear() {
            player.play()
        }
    
)


   



