import Foundation
import Carbon

let arguments = CommandLine.arguments
let targetID = arguments.count > 1 ? arguments[1] : "com.apple.keylayout.ABC"

let filter = [kTISPropertyInputSourceID: targetID] as CFDictionary
let sources = TISCreateInputSourceList(filter, false).takeRetainedValue() as! [TISInputSource]

if let firstSource = sources.first {
    TISSelectInputSource(firstSource)
    exit(0)
} else {
    exit(1)
}
