//
//  MainView.swift
//  CalculatorApp
//
//  Created by Молтабаров Аманжол on 23.03.2024.
//

import SwiftUI

struct MainView: View {
    
    // MARK: Property
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
                        .font(.system(size: 90, weight: .light))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .padding(.horizontal, 28)
                }
                
                // MARK: Buttons
                ForEach(viewModel.buttonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                viewModel.didTap(button: item)
                            } label: {
                                Text(item.rawValue)
                                    .padding()
                                    .frame(
                                        width: viewModel.buttonWidth(item: item),
                                        height: viewModel.buttonHeight())
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

// MARK: Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
