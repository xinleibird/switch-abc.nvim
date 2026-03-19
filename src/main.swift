import Foundation
import Carbon

let arguments = CommandLine.arguments
let targetID = arguments.count > 1 ? arguments[1] : "com.apple.keylayout.ABC"

if let currentSource = TISCopyCurrentKeyboardInputSource()?.takeRetainedValue() {
    if let pointer = TISGetInputSourceProperty(currentSource, kTISPropertyInputSourceID) {
        let currentID = Unmanaged<CFString>.fromOpaque(pointer).takeUnretainedValue() as String
        if currentID == targetID {
            exit(0)
        }
    }
}

let filter = [kTISPropertyInputSourceID: targetID] as CFDictionary
let sources = TISCreateInputSourceList(filter, false).takeRetainedValue() as! [TISInputSource]

if let firstSource = sources.first {
    TISSelectInputSource(firstSource)
    exit(0)
} else {
    exit(1)
}
