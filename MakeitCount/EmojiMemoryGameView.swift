//
//  ContentView.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/17/25.
// view/UI = Stateless/Showing whats in the model

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var ViewModel: EmojiMemoryGame = EmojiMemoryGame()
  
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack{
            cards
                .animation(.default, value: ViewModel.cards)
        
            Button("Shuffle"){
                ViewModel.shuffle()
            }
        }
        .padding()
    }
    
//    @ViewBuilder
    private var cards: some View{
        AspectVGrid(ViewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(4)
                .onTapGesture {
                    ViewModel.choose(card)
                }
        
        }
        .foregroundColor(.gray)
       
    }

}
    


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
       ZStack{
           let base = RoundedRectangle(cornerRadius:12)
          
           Group{
               base.fill(.white)
               base.strokeBorder(lineWidth: 2)
               Text(card.content)
                   .font(.system(size: 200))
                   .minimumScaleFactor(0.01)
                   .aspectRatio(contentMode: .fit)
               
           }
            .opacity(card.isFaceUp ? 1 : 0)
           base.fill()
            .opacity(card.isFaceUp ? 0 : 1)
       }.opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//        not faceup and no match
        
    }
}








#Preview {
    EmojiMemoryGameView(ViewModel: EmojiMemoryGame())
}


