//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Jonathan on 4/18/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//


// Determine the answer and display it to the player
import UIKit

class ResultsViewController: UIViewController {
    
    
    var responses: [Answer]! // The player's response
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        // a dictionary which holds the frequency of each response
        let responseTypes = responses.map { $0.type }
        // Mapping each answer to its corresponding type
        for response in responseTypes {
            // Iterates through the collection, and adds or updates the key/value pair in the dictionary
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value})
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        // If the code records answers for multiple animals, determine the most frequent animals related to the questions
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
