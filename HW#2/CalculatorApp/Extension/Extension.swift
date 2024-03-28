//
//  Extension.swift
//  CalculatorApp
//
//  Created by Молтабаров Аманжол on 24.03.2024.
//

import SwiftUI

extension Buttons {
    func buttonToOperation() -> Operation {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .subtract
        case .multiple:
            return .multiply
        case .divide:
            return .divide
        default:
            return .none
        }
    }
}

