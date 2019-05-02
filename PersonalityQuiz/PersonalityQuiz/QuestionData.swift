//
//  File.swift
//  PersonalityQuiz
//
//  Created by Jonathan on 4/22/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

// The file models the flow of the app.

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    // describes three types of questions
    case single, multiple, ranged
}

struct Answer {
    // Have a string to display to the players according to their responses
    var text: String
    var type: AnimalType
}

enum AnimalType: String {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", panda = "🐼"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends"
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full o energy."
        case .panda:
            // panda's trait description from https://dreamingandsleeping.com/panda-spirit-animal-symbolism-and-meaning/
            return "Gentle strength is one of your most important traits. You are a firm and determined person, but at the same time you are very kind."
        }
    }
}
