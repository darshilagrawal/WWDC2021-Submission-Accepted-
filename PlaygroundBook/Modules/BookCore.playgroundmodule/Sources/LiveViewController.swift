//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  A source file which is part of the auxiliary module named "BookCore".
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import PlaygroundSupport

@objc(BookCore_LiveViewController)
public class LiveViewController: UITableViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    let stringOfData:[String] = []
    public func receive(_ message: PlaygroundValue) {
        
        
    }
}


