import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard : Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
            //        var faceUpCardIndices = [Int]()
            //        for index in cards.indices { //cards.indices = 0<..cards.count
            //            if cards[index].isFaceUp {
            //                faceUpCardIndices.append(index)
            //            }
            
        set{ cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
//                    if index != newValue {
//                        cards[index].isFaceUp = false
//                    } else {
//                        cards[index].isFaceUp = true
//                    }
            }
        }
            
            
            mutating func choose(_ card: Card) {
                if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
                   !cards[chosenIndex].isFaceUp,
                   !cards[chosenIndex].isMatched
                {
                    if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                            cards[chosenIndex].isMatched = true
                            cards[potentialMatchIndex].isMatched = true
                        }
                        cards[chosenIndex].isFaceUp = true
                    } else {
                        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                    }
                }
            }
    
    mutating func shuffle() {
        cards.shuffle()
    }
            
            //    func index(of card: Card) -> Int? {
            //        for index in 0..<cards.count{
            //            if cards[index].id == card.id {
            //                return index
            //            }
            //        }
            //        return nil
            //    }
            
            init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
                cards = []
                //add numberOfPairsOfCards*2 cards to cards array
                for pairIndex in 0..<numberOfPairsOfCards{
                    let content = createCardContent(pairIndex)
                    cards.append(Card(content: content, id: pairIndex*2))
                    cards.append(Card(content: content, id: pairIndex*2+1))
                    
                }
                cards.shuffle()
            }
            
            struct Card: Identifiable {
                var isFaceUp = false
                var isMatched = false
                let content: CardContent
                let id: Int
            }
        }
    
    extension Array {
        var oneAndOnly: Element? {
            if self.count == 1 {
                return self.first
            } else {
                return nil
            }
        }
    }

