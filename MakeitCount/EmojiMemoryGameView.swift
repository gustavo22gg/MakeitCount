//
//  ContentView.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/17/25.
// view/UI = Stateless/Showing whats in the model

import SwiftUI

struct EmojiMemoryGameView: View {
    var ViewModel: EmojiMemoryGame
    let emoji = ["😍", "😃", "😜", "🥳", "😗", "😎", "😀", "😁", "😆", "😂"]
  
    var body: some View {
        ScrollView{
            Cards
        }
        .padding()
    }
    
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]){
            ForEach(emoji.indices, id: \.self) {index in
                CardView(content: emoji[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.green)
    }
}
    


struct CardView: View {
    let content: String
    @State var isFaceup = true
    var body: some View {
       ZStack{
           let base = RoundedRectangle(cornerRadius:12)
          
           Group{
               base.fill(.white)
               base.strokeBorder(lineWidth: 2)
               Text(content).font(.largeTitle)
           }
           .opacity(isFaceup ? 1 : 0)
           base.fill().opacity(isFaceup ? 0 : 1)
       }
       .onTapGesture {
           isFaceup.toggle()
       }
        
    }
}








#Preview {
    EmojiMemoryGameView()
}
