//
//  Game.swift
//  Apple Pie
//
//  Created by Jonathan on 3/13/19.
//  Copyright © 2019 Jonathan. All rights reserved.

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    // A collection of charactesr that keep track of the selected letters
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        // Receive a Character
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            // Loop through each character of word. If the character is in guessedLetters, convert it to a string and append it to the variable.
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}
