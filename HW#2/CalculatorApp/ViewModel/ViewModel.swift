//
//  ViewModel.swift
//  CalculatorApp
//
//  Created by Молтабаров Аманжол on 24.03.2024.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var value = "0"
    @Published var num: Double = 0.0
    @Published var currentOperation: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    let engineerButtonsArray: [[Buttons]] = [
        [.pow2, .pow3, .clear, .negative, .percent, .divide],
        [.factorial, .ln, .seven, .eight, .nine, .multiple],
        [.sqrt, .epowerx, .four, .five, .six, .minus],
        [.sin, .cos, .one, .two, .three, .plus],
        [.tan, .ctg, .e, .zero, .decimal, .equal]
    ]
    
    // MARK: Tap Button Method
    func didTap(button: Buttons) {
        switch button {
        case .plus, .minus, .multiple, .divide:
            currentOperation = button.buttonToOperation()
            num = Double(value) ?? 0
            value = "0"
        case .equal:
            if let currentValue = Double(value) {
                value = formatResult(performOperation(currentValue))
            }
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100.0)
            }
        case .clear:
            value = "0"
        case .decimal:
            if !value.contains(".") {
                value += "."
            }
        case .negative:
            if let negativeValue = Double(value) {
                value = formatResult(-negativeValue)
            }
        case .pow2:
            if let currentValue = Double(value) {
                value = String(pow(currentValue, 2))
            }
        case .pow3:
            if let currentValue = Double(value) {
                value = String(pow(currentValue, 3))
            }
        case .factorial:
            if let currentValue = Double(value), currentValue >= 0, currentValue.rounded() == currentValue {
                value = String(factorial(of: Int(currentValue)))
            } else {
                value = "Error"
            }
        case .ln:
            if let currentValue = Double(value), currentValue > 0 {
                value = String(log(currentValue))
            } else {
                value = "Error"
            }
        case .sqrt:
            if let currentValue = Double(value), currentValue >= 0 {
                value = String(sqrt(currentValue))
            } else {
                value = "Error"
            }
        case .epowerx:
            if let currentValue = Double(value) {
                value = String(exp(currentValue))
            }
        case .sin:
            if let currentValue = Double(value) {
                let radians = currentValue * .pi / 180
                value = String(sin(radians))
            }
        case .cos:
            if let currentValue = Double(value) {
                let radians = currentValue * .pi / 180
                value = String(cos(radians))
            }
        case .tan:
            if let currentValue = Double(value) {
                let radians = currentValue * .pi / 180
                value = String(tan(radians))
            }
        case .ctg:
            if let currentValue = Double(value), currentValue != 90 && currentValue != 270 {
                let radians = currentValue * .pi / 180
                let tangentValue = tan(radians)
                if tangentValue != 0 {
                    value = String(1 / tangentValue)
                } else {
                    value = "Error"
                }
            } else {
                value = "Error"
            }
        case .e:
            value = String(M_E)
        default:
            if value == "0" {
                value = String(button.rawValue)
            } else {
                value += String(button.rawValue)
            }
        }
    }

    // MARK: Helper Culculate Method
    func performOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return num + currentValue
        case .subtract:
            return num - currentValue
        case .multiply:
            return num * currentValue
        case .divide:
            return num / currentValue
        default:
            return currentValue
        }
    }
    
    // MARK: Remove Last "0" Method
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    // MARK: 
    private func factorial(of number: Int) -> Int {
        return number == 0 ? 1 : number * factorial(of: number - 1)
    }
    
    // MARK: Size of Buttons Methods
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12.0
        let totalSpacing: CGFloat = 5 * spacing
        let zeroTotalSpacing: CGFloat = 4 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - zeroTotalSpacing) / totalColumns * 2
        }
        return (screenWidth - totalSpacing) / totalColumns
    }

    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12.0
        let totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColumns
    }
}
