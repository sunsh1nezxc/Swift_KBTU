//
//  AdaptiveUI.swift
//  CalculatorApp
//
//  Created by Молтабаров Аманжол on 25.03.2024.
//

import SwiftUI

// MARK: A structure that will deal with adapting the UI depending on the device orientation
struct AdaptiveUI: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > geometry.size.height {
                landscapeLayout
            } else {
                portraitLayout
            }
        }
    }
    
    private var portraitLayout: some View {
        MainView()
    }
    private var landscapeLayout: some View {
        EngineerView()
    }
}
