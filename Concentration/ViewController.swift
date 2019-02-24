//
//  ViewController.swift
//  Concentration
//
//  Created by Adith Rai on 2/3/19.
//  Copyright © 2019 Adith Rai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // classes get a free init as long as all their vars are initialized
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2) // lazy only initializes when someone uses it
    // NOTE: you cannot use property observers like didSet to lazy vars
    
    
    var flipCount = 0 { // no decimals means that it is inferred as Int
        didSet{ // property observer
            flipCountLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet weak var flipCountLabel: UILabel! // outlets create instance variables
    
    @IBOutlet var cardButtons: [UIButton]! // to rename the variable, use cmd click
    
    
    
    @IBAction func touchCard(_ sender: UIButton) { // actions create methods
        flipCount += 1
        if  let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    var emojiChoices = ["🦇","👻","🎃","😱","🍭","🧟‍♂️","🙀","😈","🧙‍♀️"] // no need for Array<String> due to inference
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 { // back to back if statements
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex) //removes the emoji to avoid repetition
        }
        return emoji[card.identifier] ?? "?" // read as: return emoji[card.identifier], if nil return '?'
    }
}

