//
//  MemorizeGame.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/25/25.
// Model UI Independent = Data + logic

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    var indexOfTheOnlyCardFaceUpCard: Int?{
        get{
            let faceUpCardIndices = cards.indices.filter{ index in cards[index].isFaceUp}
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
        }
        set{
            
            cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0)}
            
        }
    }
        
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentailMatchedIndex = indexOfTheOnlyCardFaceUpCard{
                    if cards[potentailMatchedIndex].content == cards[chosenIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentailMatchedIndex].isMatched = true
                    }
                    
                } else {
                    indexOfTheOnlyCardFaceUpCard = chosenIndex
                        }
                    }
                    cards[chosenIndex].isFaceUp = true
                }
            }
        
    
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String
        var debugDescription: String{
          "ID: \(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }

    }
}


