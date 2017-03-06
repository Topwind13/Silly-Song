//
//  ViewController.swift
//  Silly Song
//
//  Created by TOP on 3/4/2560 BE.
//  Copyright © 2560 TOPP Pongsakorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }


    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"].joined(separator: "\n")
//        let fullname = nameField.text?.capitalized
        guard let fullname = nameField.text?.capitalized, !fullname.isEmpty else {
            return
        }
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: fullname)
    }

}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

// make a short name by starting from first vowel
func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercased().folding(options: .diacriticInsensitive, locale: .current)
    
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    let rangeIndex = lowercaseName.rangeOfCharacter(from: vowelSet)
    if rangeIndex != nil {
        return lowercaseName.substring(from: (rangeIndex?.lowerBound)!)
    } else {
        return lowercaseName
    }
    
}

// function get the lyricsTemplate and fullname and return lyrics with name
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

