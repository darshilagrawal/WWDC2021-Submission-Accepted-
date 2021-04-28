//#-hidden-code
import PlaygroundSupport
import SwiftUI
import Foundation
import AVKit
//#-end-hidden-code
import CryptoKit
/*:
 
 # Hashing in Itself does not protect your data
 - Note: An Attacker can change the hashvalue after manipulating the data
 * Callout(Objective:):
 Learn About [HMAC](glossary://HMAC)
 
We will perform [HMAC](glossary://HMAC) to provide a way of authenitcation of data between the User and Sender.
 */

//: A [Symmetric Key](glossary://Symmetric%20Key) will be used to Sign the Hash Output of data (which was produced earlier in this Playground) by the sender and the same Key will be used by the reciever to Authenticate the data.
/*:
 ## Firstly we will produce a Symmetric Key
 */
let symmetricKey = SymmetricKey(size: .bits256)
/*:
 - Note: You can produce Symmetric key of 3 Sizes namely 128,192 and 256. 256 Bits being the most secure and computationally intensive to crack


# Time To Produce The HMAC code which we will send to the Reciever.
 */

/*:
 * Callout(Disclaimer:):
 We will be using the **Same String** as data from the Previous Page.
 previously used code has been hidden for better concentration on the current Topic
*/
//#-hidden-code
let stringToSign="WWDC2021"
let dataOfString=stringToSign.data(using: .utf8)
    
guard let unwrappedData=dataOfString else {
        fatalError("Data Found to be empty")
    }
//#-end-hidden-code
let signedDigest=HMAC<SHA512>.authenticationCode(for: unwrappedData, using: symmetricKey)
let signedDigestData=Data(signedDigest)
/*:
 * Callout(What is a Digest:):
 A Digest is a String of digits created By a hashing function. So the Output of a SHA256 function in **Cryptographic** terms is known as Digest
 - Note: The Code is Converted to data to simulate real world scenario where data format is used for transferring Information
 */
/*:
# Now On The Reciever's End
*/

//: We Will Check For the Authenticity of data by using CryptoKit's Default *.isValidAuthenticationCode* function. The function returns a boolean Value (True Or False which authenticates wether the data is legitimate or not)
let symmetricKeyNOTVALID = SymmetricKey(size: .bits128)

/*:
# This Symmetric Key (symmetricKeyNOTVALID) simulates a data breach by a hacker who wants to manipulate our data
*/
if HMAC<SHA512>.isValidAuthenticationCode(signedDigestData, authenticating: unwrappedData, using: /*#-editable-code*/symmetricKeyNOTVALID/*#-end-editable-code*/) {
/*:
#                           Success
*/
//#-hidden-code
    PlaygroundPage.current.assessmentStatus = .pass(message: "### Perfect! You've Succesfully Authenticated The Data. But there are still Some Problems [**Click here to Know More**](@next)")
    
    PlaygroundPage.current.setLiveView(
        ZStack{
            Image("Page1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                
                Text("You Have Successfully Recieved the data")
                    .underline()
                    .font(.custom("HelveticaNeue-UltraLight", size: 30))
                    .padding(.leading,10)
                    .padding(.trailing,10)
                
                Text(stringToSign)
                    .font(Font.system(size:50, design: .serif))
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))
                
                
            }
            .frame(width:400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            .background(Color.white
                            .shadow(color:.black,radius: 5))
            .border(Color.white, width: 4)
            .foregroundColor(.black)
            .font(.custom("special", size: 33))
            
        })
    

//#-end-hidden-code
}else{
/*:
#                               Failure
*/
        //#-hidden-code
    PlaygroundPage.current.assessmentStatus = .fail(hints : [" # The Key which You are using(*symmetricKeyNOTVALID*) is not the same key used for Signing The data"], solution: nil)
    
    let player = AVPlayer(url:  Bundle.main.url(forResource: "Failure", withExtension: "mp4")!)
    PlaygroundPage.current.setLiveView(
        VideoPlayer(player:player)
            .onAppear() {
                player.play()
            }
    )
    
        //#-end-hidden-code
    }

/*:
 * Callout(HINT:):
 Change 'symmetricKeyNOTVALID' to 'symmetricKey' to Authenticate The Data Correctly and [Move Forward](@next).
 */
