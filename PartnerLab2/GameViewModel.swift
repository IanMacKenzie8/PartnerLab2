import SwiftUI
import Combine

final class GameViewModel: ObservableObject {
    @Published private(set) var cards: [Card] = []
    @Published private(set) var moves: Int = 0
    @Published private(set) var pairsFound: Int = 0

    private let theme: [String] = [
        "🍁","🍂","🎃","🌰","🧣","🦊","🥧","☕️","🪵","🕯️","🦃","🌾"
    ]

    private var indexOfFirstFlipped: Int? = nil

    init() { restart() }

    var totalPairs: Int { cards.count / 2 }

    func flip(_ card: Card) {
        guard let idx = cards.firstIndex(where: { $0.id == card.id }),
              !cards[idx].isMatched, !cards[idx].isFaceUp else { return }

        cards[idx].isFaceUp = true

        if let first = indexOfFirstFlipped {
            moves += 1
            if cards[first].emoji == cards[idx].emoji {
                cards[first].isMatched = true
                cards[idx].isMatched = true
                pairsFound += 1
                indexOfFirstFlipped = nil
            } else {
                let firstIndex = first
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
                    guard let self = self else { return }
                    self.cards[firstIndex].isFaceUp = false
                    self.cards[idx].isFaceUp = false
                }
                indexOfFirstFlipped = nil
            }
        } else {
            indexOfFirstFlipped = idx
        }
    }

    func restart() {
        moves = 0
        pairsFound = 0
        indexOfFirstFlipped = nil
        let chosen = Array(theme.shuffled().prefix(6)) // ≥ 6 pairs
        cards = (chosen + chosen).shuffled().map { Card(emoji: $0) }
    }
}

