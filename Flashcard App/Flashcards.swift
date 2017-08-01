//
//  Flashcards.swift
//  Flashcard App
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}

class CardCollection {
    
    // Single instance of the card collection
    public static var instance : CardCollection = CardCollection()
 
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    
    private init(){
       
        cards = [ Flashcard(question: "How many letters does the word alphabet contain?", options: ["8","15"]),
                  Flashcard(question: "What color is the sky?", options:["Grey", "Green", "Purple", "Red", "Orange", "Blue"]),
                  Flashcard(question: "Which sentence is correct grammatically?", options:["Lets eat Grandma!", "Let's eat grandma!"])]
        
        currentIndex = 0;
        
    }
    
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
