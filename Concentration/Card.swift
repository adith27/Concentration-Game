//
//  Card.swift
//  Concentration
//
//  Created by Adith Rai on 2/23/19.
//  Copyright © 2019 Adith Rai. All rights reserved.
//

import Foundation

// 2 major diff between structs and classes
// - no inheritance, makes structs simpler
// - structs are value types, classes are reference types
// - meaning the value gets copied not ref.
// - examples: arrays, ints, strings, dictionaries

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    // you don't need the emoji identifier since model is UI independent
    
    static var identifierFactory = 0
    
    // you send this to a card you send this to the card type
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
