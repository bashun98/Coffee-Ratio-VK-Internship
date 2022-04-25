//
//  WaterInput.swift
//  Ratios
//
//  Created by John Peden on 2/29/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI
import Combine
import Introspect

struct WaterInput: View {
    
    @Binding var amount: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(maxHeight: geometry.size.height * 0.05)
                
                Text("What ratio?")
                    .bold()
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.001)
                    .frame(maxWidth: geometry.size.width / 2, maxHeight: geometry.size.height * 0.2)
                    .foregroundColor(Color("Text"))
                    .scaledToFit()
                
                HStack {
                    VStack(alignment: .center) {
                        Text("1")
                            .frame(width: geometry.size.height / 3, height: geometry.size.height / 3)
                            .font(.system(size: geometry.size.height / 6))
                            .minimumScaleFactor(0.001)
                            .scaledToFit()
                        
                        Text("coffee")
                            .frame(maxWidth: geometry.size.width * 0.2,  maxHeight: geometry.size.height * 0.15)
                            .foregroundColor(Color("Text"))
                            .font(.system(size: 100))
                            .minimumScaleFactor(0.001)
                            .scaledToFit()
                    }
                    .frame(maxWidth: geometry.size.width * 0.2 ,maxHeight: geometry.size.height)
                    
                    Text(":")
                        .font(.system(size: 100))
                        .minimumScaleFactor(0.001)
                        .frame(maxWidth: geometry.size.width * 0.1, maxHeight: geometry.size.height / 4, alignment: .center)
                        .scaledToFit()
                    
                    VStack(alignment: .center) {
                        TextField("", text: $amount)
                            .frame(width: geometry.size.height / 3, height: geometry.size.height / 3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("Primary"), lineWidth: 3)
                            )
                            .multilineTextAlignment(.center)
                            .font(.system(size: geometry.size.height / 5))
                            .scaledToFit()
                            .keyboardType(.numberPad)
                            .onReceive(Just(amount), perform: { _ in
                                limitText(2)
                            })
                            .introspectTextField { (textField) in
                                let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                                let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                                doneButton.tintColor = .systemBlue
                                toolBar.items = [doneButton]
                                textField.inputAccessoryView = toolBar
                            }
                            .accessibility(identifier: AccessID.waterTextFieldID.rawValue)
                        
                        Text("water")
                            .frame(maxWidth: geometry.size.width * 0.2,  maxHeight: geometry.size.height * 0.15)
                            .foregroundColor(Color("Text"))
                            .font(.system(size: 100))
                            .minimumScaleFactor(0.001)
                            .scaledToFit()
                    }
                    .frame(maxWidth: geometry.size.width * 0.2 ,maxHeight: geometry.size.height)
                }
                .frame(maxWidth: geometry.size.width / 2, maxHeight: .infinity, alignment: .center)
                
                Spacer()
                    .frame(maxHeight: geometry.size.height * 0.05)
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
