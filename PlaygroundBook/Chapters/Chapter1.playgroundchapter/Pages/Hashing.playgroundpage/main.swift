//#-hidden-code
//Page 2
import PlaygroundSupport
import SwiftUI
import BookCore
//#-end-hidden-code
import CryptoKit

/*:
 
 * Callout(Objective:):
 Learn About Hashing and commonly used Hash functions
*/

let stringOne = /*#-editable-code*/"WWDC2021"/*#-end-editable-code*/


//: The Process of Converting a Human Readable Text/Data into a **Fixed Length** Key for security purposes is known as Hashing.

/*:
- Note:The Fixed length property of Hashing Functions make it suitable for Data storage and Fast retrievals
 
 Let us perform a quick hash function to show a property of hashing known as [Avalanche Effect](glossary://Avalanche%20Effect)
 
 First we will convert our string into data format which is a universal format readable by all computers
 */
//#-editable-code
let stringOneData=stringOne.data(using: .utf8)
//#-end-editable-code
/*:
 - Note:Currently our Data is of Optional type which cannot be used in a hash function
*/

//: We can solve this Problem by adding a guard let statement to our data which safely unwraps it and gives a FatalError in case if the data is found to be null.
 

guard let stringOneDataUnwrapped=stringOneData else{
    fatalError("Empty Data Unwrapped")
}

//: Some Commonly used Hash Functions are SHA256,SHA384 and SHA512

/*:
 - Note:SHA stands for *Secure Hash Algorithm* which were developed by the NSA for National Security and Protection.
*/
/*: Apple's **CryptoKit** makes it possible to use the different SHA Algorithms using only a **Single line of Code**

* Callout(To do):
 Select one of the 3 SHA Algorithms By Typing out the desired name
 Example: SHA512
*/

let hashedValue =/*#-editable-code*/SHA256/*#-end-editable-code*/.hash(data: stringOneDataUnwrapped)

//:Finally we will Convert the Hash Value into a String which we can read easily

let finalHashString = hashedValue.compactMap { String(format: "%02x", $0) }.joined()

//:To Show The **Avalanche Effect** we will create Another String with slight modification

let stringTwo = /*#-editable-code*/"WWDC2020"/*#-end-editable-code*/

//: The Change between our 1st and 2nd String is of JUST A SINGLE NUMBER.
//: Repeating The Same Procedure will result in Hash Value of the 2nd String

/*:
 * Callout(To do):
 Click Run Program to see the final results showing the Avalanche Effect in action
*/

//#-hidden-code
let stringTwoData=stringTwo.data(using: .utf8)
guard let stringTwoDataUnwrapped=stringTwoData else{
    fatalError("Empty Data Unwrapped")
}
let hashedValueTwo = SHA256.hash(data: stringTwoDataUnwrapped)
let finalHashStringTwo = hashedValueTwo.compactMap { String(format: "%02x", $0) }.joined()

//#-end-hidden-code



//#-hidden-code
PlaygroundPage.current.setLiveView(
    
    ZStack{
        GeometryReader{ geometry in
            Image("Page3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                
                Text("Avalanche Effect")
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("HelveticaNeue-UltraLight", size: 50))
                    .padding()
                
                
                
                Text(stringOne)
                    .font(.custom("HelveticaNeue-Bold", size: 40))
                    .padding()
                
                Text(finalHashString)
                    .font(.custom("HelveticaNeue-Light", size: 40))
                    .padding()
                
                Text(stringTwo)
                    .font(.custom("HelveticaNeue-Bold", size: 40))
                    .padding()
                
                Text(finalHashStringTwo)
                    .font(.custom("HelveticaNeue-Light", size: 40))
                    .padding()
                
                
            }
            .frame(width: geometry.size.width * 0.98)
            .background(Color(red: 0.501, green: 0.7, blue: 0.995)
                            .shadow(color:.black,radius: 5)
            )
            .border(Color.white, width: 4)
            .foregroundColor(.white)
            .font(.custom("special", size: 33))
            .padding(EdgeInsets(top: geometry.size.height*0.28, leading: 5, bottom: 0, trailing: 5))
        }
    }
    
)
PlaygroundPage.current.assessmentStatus = .pass(message:"### Hashing alone is not Secure \" [**Click Here to learn more secure ways!**](@next)")
//#-end-hidden-code
