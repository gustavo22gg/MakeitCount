//
//  MakeitCountApp.swift
//  MakeitCount
//
//  Created by Shadman Siam on 6/17/25.
//

import SwiftUI

@main
struct MakeitCountApp: App {
    @StateObject var game = EmojiMemoryGame()
//    made it available only on the app as it is stateObject 
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(ViewModel: game)
        }
    }
}
