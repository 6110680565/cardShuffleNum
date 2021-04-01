//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tham Thearawiboon on 10/2/2564 BE.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var Move : Int {
        model.Move
    }
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let Num =  ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", " "]
        let Number = 16
        return MemoryGame<String>(numberOfPairsOfCard: Number) { Num[$0] }
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
