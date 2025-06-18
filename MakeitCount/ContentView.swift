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
    var isFaceup: Bool = false
    var body: some View {
       ZStack(content: {
           if isFaceup{
               RoundedRectangle(cornerRadius:12)
                   .foregroundColor(.white)
               RoundedRectangle(cornerRadius: 12)
                   .strokeBorder(lineWidth: 2)
               Text("MakeitCount").font(.largeTitle)
           }
           else{
               RoundedRectangle(cornerRadius: 12)
               Text("MakeitCount").font(.largeTitle)
                   .foregroundColor(.white)
            
            
           }
       })
        
    }
}








#Preview {
    ContentView()
}
