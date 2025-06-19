//
//  ContentView.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/17/25.
//

import SwiftUI

struct ContentView: View {
    let emoji = ["😍", "😃", "😜", "d"]
    
    var body: some View {
        HStack{
            ForEach(emoji.indices, id: \.self) {index in
                CardView(content: emoji[index])
            }
        }
        .foregroundColor(.green)
        .padding()
    }
}


struct CardView: View {
    let content: String
    @State var isFaceup = false
    var body: some View {
       ZStack{
           let base = RoundedRectangle(cornerRadius:12)
          
           if isFaceup{
               base.fill(.white)
               base.strokeBorder(lineWidth: 2)
               Text(content).font(.largeTitle)
           }
           else{
               base
               Text(content).font(.largeTitle)
                   .foregroundColor(.white)
           }
       }
       .onTapGesture {
           isFaceup.toggle()
       }
        
    }
}








#Preview {
    ContentView()
}
