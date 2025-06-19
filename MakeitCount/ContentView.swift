//
//  ContentView.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceup: true)
            CardView()
            CardView()
        }
        .foregroundColor(.green)
        .padding()
    }
}


struct CardView: View {
    @State var isFaceup = false
    var body: some View {
       ZStack{
           let base = RoundedRectangle(cornerRadius:12)
          
           if isFaceup{
               base.fill(.white)
               base.strokeBorder(lineWidth: 2)
               Text("MakeitCount").font(.largeTitle)
           }
           else{
               base
               Text("MakeitCount").font(.largeTitle)
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
