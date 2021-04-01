//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Tham Thearawiboon on 7/2/2564 BE.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack(alignment: .center, spacing: 50){
            Text("Move: \(viewModel.Move)")
                .padding(20)
            
            Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        withAnimation(.linear(duration: 0.5)){
                            viewModel.choose(card: card)
                        }
                    }
                    .padding(5)
            }
            .foregroundColor(.blue)
            .padding()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                        viewModel.resetGame()
                    }
                }, label: {
                Text("New Game")
            })
            .padding(10)
            
        }
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader{ geometry in
            if card.id != 15{
                Text(card.content)
                    .font(Font.system(size: fontSize(for: geometry.size )))
                    .cardify()
            }
        }
    }
    
    // MARK: Drawing Constants
    private let fontScaleFactor: CGFloat = 0.75
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
