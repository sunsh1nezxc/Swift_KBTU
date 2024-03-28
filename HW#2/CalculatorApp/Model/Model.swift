//
//  Model.swift
//  CalculatorApp
//
//  Created by Молтабаров Аманжол on 23.03.2024.
//

import SwiftUI

enum Operation {
    case addition, subtract, multiply, divide, negative, percent, decimal, none
}

enum Buttons: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    case plus = "+", minus = "-", multiple = "×", divide = "÷", equal = "=", decimal = ".", percent = "%", negative = "+/-", clear = "AC"
    case sqrt = "sqrt(x)", pow2 = "x^2", pow3 = "x^3", ln = "ln", factorial = "x!", epowerx = "e^x", sin = "sin", cos = "cos", tan = "tan", ctg = "ctg", e = "e"
    
    var buttonColor: Color {
        switch self { 
        case .clear, .negative, .percent:
            return Color("grayCalc")
        case .divide, .multiple, .minus, .plus, .equal:
            return Color("orangeCalc")
        case .sqrt, .pow2, .pow3, .ln, .factorial, .epowerx, .sin, .cos, .tan, .ctg, .e:
            return Color("yellowCalc")
        default:
            return Color("darkGreyCalc")
        }
    }
    
    var buttonTxtColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.black
        default:
            return Color.white
        }
    }
}

