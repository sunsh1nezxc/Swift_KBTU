//
//  CalculatorAppApp.swift
//  CalculatorApp
//
//  Created by Молтабаров Аманжол on 23.03.2024.
//

import SwiftUI

@main
struct CalculatorAppApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            AdaptiveUI()
                .environmentObject(viewModel)
        }
    }
}

