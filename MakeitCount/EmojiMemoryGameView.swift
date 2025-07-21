//
//  ContentView.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/17/25.
// view/UI = Stateless/Showing whats in the model

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var ViewModel: EmojiMemoryGame = EmojiMemoryGame()
  
    var body: some View {
        ScrollView{
            cards
                .animation(.default, value: ViewModel.cards)
        }
        Button("Shuffle"){
            ViewModel.shuffle()
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(ViewModel.cards) {card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        ViewModel.choose(card)
                    }
            }
        }.foregroundColor(.green)
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
