//
//  Card.swift
//  Concentration
//
//  Created b/Users/student/Desktop/Concentration/Concentration/Concentration.swifty student on 2018/11/24.
//  Copyright © 2018年 YANGMIAO. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
