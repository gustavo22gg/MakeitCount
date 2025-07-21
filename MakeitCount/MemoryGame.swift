//
//  MemorizeGame.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/25/25.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
