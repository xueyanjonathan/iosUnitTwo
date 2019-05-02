//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Jonathan on 4/18/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

// Interface which the user will be displayed questions.

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questions: [Question] = [
        Question(text: "Which food do you liek the most?",
                 type:.single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Bamboo", type: .panda)
            ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Climbing", type: .panda),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
            ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them, I get carsick", type: .cat),
                    Answer(text: "I get a little nervous and jumpy", type: .rabbit),
                    Answer(text: "I barely fit in them", type: .panda),
                    Answer(text: "I love peeking out of the windows on them", type: .dog)
            ])
    ]
    
    var questionIndex = 0
    // variable which keeps track of what the app has already displayed
    
    var answerChosen: [Answer] = []
    // A collection which can store answers
    
    func nextQuestion() {
        // use the questionIndex variable to display the next question
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            // If there is no questions remaining, turn to the result page.
            performSegue(withIdentifier:"ResultsSegue", sender: nil)
        }
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
            // if the buttons are triggered by the action, the switch allows the app to know which answer the player selects.
        case singleButton1:
            answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBAction func multipleAnswerButtonPressed(_ sender: UIButton) {
        // Allows to append as many as four answers per question
        let currenAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answerChosen.append(currenAnswers[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currenAnswers[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currenAnswers[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currenAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        // convert a slider value to an array's index
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // pass data from the QuestionViewController to the ResultsViewController
        if segue.identifier == "ResultsSegue" {
            // allow access to the variable "responses" by assigning answerChosen to it
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answerChosen
        }
    }
    
    override func viewDidLoad() {
        // Show the user the correct stack view of questions and hide the other two
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        // responsible for updating the navigation title, question label, and progress view
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        // each set of question would correspond to a number
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        // the navigation title is set to Question + the correspond number
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        func updateSingleStack(using answers: [Answer]) {
            // The title of the buttons will be correspodn to their certain answer strings
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            // Each label's text correspond to an answer
            multipleStackView.isHidden = false
            // resets the position of the switches every time the app restarts
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
        }
        
        func updateRangedStack(using answers: [Answer]) {
            rangedStackView.isHidden = false
            rangedSlider.setValue(0.5, animated: false)
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
            // Allow to access two Answer struct corresponding to the labels at the same time
        }
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
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
