//
//  Concentration.swift
//  Concentration
//
//  Created by Adith Rai on 2/23/19.
//  Copyright © 2019 Adith Rai. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]() //Array of type Card
    
    var indexOfOneAndOnlyFaceUpCard: Int? // use optional so its not set when there isnt a 1&only face up card
    
    // better to use at index instead of using Card so func is not limited
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { // ignores the 1&only card
                // check if the cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{ // '_' means ignore it
            // 3 different copies of card in play here
            let card = Card() // card copy 1
            // when you assign a struct to another var it copies it.
            cards += [card,card] // card copy 2 & 3
        }
        // TODO: Shuffle the cards
    }
}
