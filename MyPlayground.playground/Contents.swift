//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
var name = "TOPPP"
let lowercaseName = name.lowercased().folding(options: .diacriticInsensitive, locale: .current)
let vowelSet = CharacterSet(charactersIn: "aeiou")
print(vowelSet)
var rangeIndex = lowercaseName.rangeOfCharacter(from: vowelSet)




lowercaseName.substring(from: (rangeIndex?.lowerBound)!)