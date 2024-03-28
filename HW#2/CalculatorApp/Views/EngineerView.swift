//
//  EngineerView.swift
//  CalculatorApp
//
//  Created by Молтабаров Аманжол on 25.03.2024.
//

import SwiftUI

struct EngineerView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Spacer()
                
                // MARK: Display
                HStack {
                    Spacer()
                    Text(viewModel.value)
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .light))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .padding(.horizontal, 28)
                }
                
                // MARK: Buttons
                ForEach(viewModel.engineerButtonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                viewModel.didTap(button: item)
                            } label: {
                                Text(item.rawValue)
                                    .padding()
                                    .frame(
                                        width: 110,
                                        height: 46)
                                    .background(item.buttonColor)
                                    .foregroundColor(item.buttonTxtColor)
                                    .cornerRadius(viewModel.buttonHeight() / 2)
                                    .font(.system(size: 35))
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct EngineerView_Previews: PreviewProvider {
    static var previews: some View {
        EngineerView()
            .environmentObject(ViewModel())
    }
}
