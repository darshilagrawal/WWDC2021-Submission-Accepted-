//#-hidden-code
import PlaygroundSupport
import SwiftUI
import Foundation
import AVKit
//#-end-hidden-code
import CryptoKit
/*:
 
 # One Of the Major Problems with HMAC and Symmetric Key based Cryptography is that the Key needs to be present with both the Sender and the Reciever.So it needs to be send over to the reciever in another medium or channel aswell.What if the Sender does not know the reciever Personally or the Channel is Insecure?
# This is Where [Public Key Cryptography](glossary://Public%20Key%20Cryptography) comes into the picture.
 
 * Callout(Objective:):
 Learn About [Public Key Cryptography](glossary://Public%20Key%20Cryptography)
 */

/*:
 ## The Photograph on our liveView is of The Founding fathers/Legends in the Field of Public Key Cryptography
 
 ## Namely **Martin Hellman** and **Whit Diffie** (From Left to Right)
 */

//: To Breifly explain Diffie-Hellman Key Exchange Let us look at the famous Example of BOB and ALICE

/*:
 ## Both BOB and ALICE will select a Big Prime Number which is Kept PRIVATE and raise it to the Power of a Common [Generator Number](glossary://Generator%20Number) after which modulo operation will be done on resultant using a common number (n). They share this Data and After raising the recieved Data to their private Number the final resultant is a SHARED SECRET which is used as a key for future.
*/
/*:
 - Note: As the Diffie-Hellman Key Exchange is computationally intensive, it is expensive in terms of resources and CPU performance time due to which Elliptic Curves have largely replaced it's Use
*/

/*:
 
 # Elliptic Curve Cryptography
 
*/

//: Based on The Same fundamentals of [DHKE](glossary://DHKE) Elliptic curves move from Discrete Log Problem Towards a Graphical Approach. \n ECC Keys are Much Smaller in Size and provide Similar Security.

/*:
 * Callout(To Do:):
Click The Run Program Function To See How ECC Curves Function and produce Public Key Using Dot Operation on the curve multiple times.

 - Note: Generally the value of number of Times Dot Operation is performed on the Elliptic curve to reach the final value is used as the Private Key.
 
 */

//: Apple's **CryptoKit** provides you with [ECC](glossary://ECC) Without Knowing any of the Mathematical Operations Involved.


/*:
 - Note: CryptoKit Uses ECC Algorithms **Exclusively**. Some Available options are P256,P384,P521 or Curve25519
*/

/*:
 * Callout(Disclaimer:):
The animation presented in the liveView has been adopted from *Nick Sullivan's* Article:"A (Relatively Easy To Understand) Primer on Elliptic Curve Cryptography" since it Beautifully captures the difficulty of backtracking this function.
*/

//#-hidden-code
PlaygroundPage.current.assessmentStatus = .pass(message: "### Now Let's get our hands dirty and perform some ECC [**Click here to get Going**](@next)")



let player = AVPlayer(url:  Bundle.main.url(forResource: "graphVideo", withExtension: "mp4")!)
PlaygroundPage.current.setLiveView(
    VideoPlayer(player:player)
        .onAppear() {
            player.play()
        }
)
    
//#-end-hidden-code
    


