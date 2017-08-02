//
//  Flashcards.swift
//  Flashcard App
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation
import GameKit

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    
        self.options = shuffle(list : options)
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
       
        cards = [ Flashcard(question: "How many letters does the alphabet contain?", options: ["26","11"]),
                  Flashcard(question: "What color is the sky?", options:["Blue", "Green", "Purple", "Red", "Orange"]),
                  Flashcard(question: "Which sentence is correct grammatically?", options:["Let's eat, Grandma!", "Lets eat grandma!"]),
                  Flashcard(question: "What state is the city Boston located in?", options:["Massachusetts", "Oklahoma", "Texas" , "Ohio" , "Illinois" , "Idaho" , "Florida"])]
        
        
        currentIndex = 0;
        
        cards = shuffle(list : cards)
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

func shuffle<T>(list : [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
}
