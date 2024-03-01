//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Молтабаров Аманжол on 28.02.2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
  @StateObject var game = EmojiMemoryGame()
  var body: some Scene {
    WindowGroup {
      EmojiMemoryGameView(gameViewModel: game)
    }
  }
}
