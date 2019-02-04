//
//  ViewController.swift
//  Concentration
//
//  Created by Adith Rai on 2/3/19.
//  Copyright © 2019 Adith Rai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 { // no decimals means that it is inferred as Int
        didSet{ // property observer
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel! // outlets create instance variables
    
    @IBOutlet var cardButtons: [UIButton]! // to rename the variable, use cmd click
    
    var emojiChoices = ["🎃","👻","🎃","👻"] // no need for Array<String> due to inference
    
    @IBAction func touchCard(_ sender: UIButton) { // actions create methods
        flipCount += 1
        if  let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else {
            print("chosen card was not in cardButtons")
        }
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            
        }
        else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

