//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
var name = "TPPP"
let lowercaseName = name.lowercased().folding(options: .diacriticInsensitive, locale: .current)
let vowelSet = CharacterSet(charactersIn: "aeiou")
print(vowelSet)
var rangeIndex = lowercaseName.rangeOfCharacter(from: vowelSet)

if rangeIndex != nil {
    lowercaseName.substring(from: (rangeIndex?.lowerBound)!)
} else {
   lowercaseName
}



