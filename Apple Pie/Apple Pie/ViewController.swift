//
//  ViewController.swift
//  Apple Pie
//
//  Created by Jonathan on 3/11/19.
//  Copyright © 2019 Jonathan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["steak", "chipotle", "black", "rainbow", "cat", "puppy"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var currentGame: Game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            // Give the game the first word from the collection
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            // Create a new instance of Game
            enableLetterButtons(true)
            // If the list of word is not empty, enable all the buttons to let the user continue to play.
            updateUI()
        } else {
            enableLetterButtons(false)
            // If there is no more word in the list, disable all buttons.
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String] ()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        // Separate the underline for the word
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    // One outlet for the collection of buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        // When a button is pressed, it should be disabled from the round.
        let letterString = sender.title(for: . normal)!
        // When a button is pressed, read the button's title(its corresponding character from the alphabet)
        let letter = Character(letterString.lowercased())
        // Determine whether the letter is in the word.
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
}

