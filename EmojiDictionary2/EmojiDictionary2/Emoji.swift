//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Brian Wilkinson on 4/23/19.
//  Copyright © 2019 Brian Wilkinson. All rights reserved.
//  Jonathan Lin

// A model giving the formal description of an emoji
import Foundation

class Emoji {
    
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
