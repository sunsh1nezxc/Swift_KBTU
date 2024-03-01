//
//  MemoryGame.swift
//  Memorize
//
//  Created by Молтабаров Аманжол on 28.02.2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  private(set) var score = 0
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = []
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = cardContentFactory(pairIndex)
      cards.append(Card(content: content, id: "\(pairIndex+1)a"))
      cards.append(Card(content: content, id: "\(pairIndex+1)b"))
    }
  }
  
  var indexOfTheOneAndOnlyFaceUpCard: Int? {
    get { cards.indices.filter { index in cards[index].isFaceUp }.only }
    set {
      cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) }
    }
  }
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
      if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
          if cards[chosenIndex].content == cards[potentialMatchIndex].content {
            cards[chosenIndex].isMatched = true
            cards[potentialMatchIndex].isMatched = true
            score += 2 + cards[chosenIndex].bonus + cards[potentialMatchIndex].bonus
          } else {
            if cards[chosenIndex].hasBeenSeen {
              score -= 1
            }
            if cards[potentialMatchIndex].hasBeenSeen {
              score -= 1
            }
          }
        } else {
          indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp = true
      }
    }
  }
  
  mutating func shuffle() {
    cards.shuffle()
    print(cards)
  }
  
  struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
    var isFaceUp = false {
      didSet {
        if isFaceUp {
          startUsingBonusTime()
        } else {
          stopUsingBonusTime()
        }
        if oldValue && !isFaceUp {
          hasBeenSeen = true
        }
      }
    }
    var hasBeenSeen = false
    var isMatched = false {
      didSet {
        if isMatched {
          stopUsingBonusTime()
        }
      }
    }
    var content: CardContent
    
    var id: String
    
    var debugDescription: String {
      return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
    }
    
    var bonusTimeLimit: TimeInterval = 6
    
    var lastFaceUpDate: Date?
    
    var pastFaceUpTime: TimeInterval = 0
    
    var faceUpTime: TimeInterval {
      if let lastFaceUpDate {
        return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
      } else {
        return pastFaceUpTime
      }
    }
    
    var bonus: Int {
        Int(bonusTimeLimit * bonusPercentRemaining)
    }
    
    var bonusPercentRemaining: Double {
        bonusTimeLimit > 0 ? max(0, bonusTimeLimit - faceUpTime)/bonusTimeLimit : 0
    }
    
    private mutating func startUsingBonusTime() {
      if isFaceUp && !isMatched && bonusPercentRemaining > 0, lastFaceUpDate == nil {
        lastFaceUpDate = Date()
      }
    }
    
    private mutating func stopUsingBonusTime() {
      pastFaceUpTime = faceUpTime
      lastFaceUpDate = nil
    }
  }
}

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
