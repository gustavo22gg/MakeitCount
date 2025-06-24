//
//  ContentView.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/17/25.
//

import SwiftUI

struct ContentView: View {
    let emoji = ["😍", "😃", "😜", "🥳", "😗", "😎", "😀", "😁", "😆", "😂"]
    @State var Count = 4;
    
    var body: some View {
        VStack{
            ScrollView{
                Cards
            }
            Spacer()
            CardAdjuster
        }
        .padding()
    }
    
    var CardAdjuster: some View{
        HStack{
            CardAdd
            Spacer()
            CardRemove
        }.imageScale(.large)
        .font(.largeTitle)
    }
    
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<Count, id: \.self) {index in
                CardView(content: emoji[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.green)
    }
    
    
    func adjuster(by offset: Int, Symbol: String) -> some View{
        Button(action: {
            if Count < emoji.count {
                Count += offset
            }
        }, label: {
            Image(systemName: Symbol)
        }).disabled(Count + offset < 1 || Count + offset > emoji.count)
    }
    
    
    var CardAdd: some View{
        adjuster(by: +1, Symbol: "plus.circle")

    }
    
    var CardRemove: some View{
        adjuster(by: -1, Symbol: "minus.circle")
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
    ContentView()
}
