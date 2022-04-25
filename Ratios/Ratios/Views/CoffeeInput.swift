//
//  CoffeeInput.swift
//  Ratios
//
//  Created by John Peden on 2/27/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI
import Combine
import Introspect

struct CoffeeInput: View {
    
    @Binding var amount: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(maxHeight: geometry.size.height * 0.15)
                
                Text("How much coffee?")
                    .bold()
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.001)
                    .frame(maxWidth: geometry.size.width * 0.8, maxHeight: geometry.size.height * 0.25)
                    .foregroundColor(Color("Text"))
                    .scaledToFit()
                    .lineLimit(1)
                    .accessibility(identifier: AccessID.coffeeLabelID.rawValue)
                
                TextField("", text: $amount)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height * 0.25, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Primary"), lineWidth: 3)
                    )
                    .onReceive(Just(amount), perform: { _ in
                        limitText(5)
                    })
                    .font(.system(size: geometry.size.height * 0.15))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .introspectTextField { (textField) in
                        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                        doneButton.tintColor = .systemBlue
                        toolBar.items = [doneButton]
                        textField.inputAccessoryView = toolBar
                    }
                    .accessibility(identifier: AccessID.coffeeTextFieldID.rawValue)
                
                Text("grams")
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.001)
                    .frame(maxWidth: geometry.size.width / 6, maxHeight: geometry.size.height / 6)
                    .scaledToFit()
                
                Spacer()
                    .frame(maxHeight:  geometry.size.height * 0.05)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func limitText(_ upper: Int) {
        if amount.count > upper {
            amount = String(amount.prefix(upper))
        }
    }
}
