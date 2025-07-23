//
//  EmojiMemoryGame.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/25/25.
// ViewModel Binds View to Model

import SwiftUI


class EmojiMemoryGame: ObservableObject {
//    to make ir reactive, added observableobject
    private static let emojis = ["😍", "😃", "😜", "🥳", "😗", "😎", "😀", "😁", "😆", "😂", "😅", "🤣"]
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 20){ pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else{
                return "?"
            }
        }
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()

    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
//    MARK: - IntentS
    func shuffle(){
        model.shuffle()
        
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        return model.choose(card)
    }
}





