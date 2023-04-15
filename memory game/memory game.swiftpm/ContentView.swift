import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            gameBody
            shuffle
        }
        .padding()
    }
    
    var gameBody: some View {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
//                        .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity.animation(.easeInOut(duration: 3))))
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    
    var shuffle: some View {
        Button ("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    }
    
//    var remove: some View{
//        Button(action: {
//            if emojiCount > 1{
//                emojiCount -= 1
//            }
//        }, label: {
//            Text("Remove Card")
//        })
//    }
//    var add: some View{
//        Button(action: {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        }, label: {
//            Text("Add Card")
//        })
//    }

struct CardView: View{
    let card: EmojiMemoryGame.Card
    
//    var content: String
//    @State var isFaceUp: Bool = true
    
    var body: some View {
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(Font.system(size: 40))
                } else if card.isMatched {
                    shape.opacity(0)
                } else{
                    shape.fill()
                    
                }
            }
//        .onTapGesture {
//            isFaceUp = !isFaceUp
//        }
    }
}

private struct DrawingConstants {
    static let cornerRadius: CGFloat = 20
    static let lineWidth: CGFloat = 7
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
