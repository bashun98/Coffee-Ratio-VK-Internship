//
//  TimerView.swift
//  Ratios
//
//  Created by John Peden on 2/26/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI
import Combine

private enum TimerState {
    case running
    case paused
}

struct TimerView: View {
    
    @State var buttonText: String = "Start"
    @State var timerText: String = "00:00"
    @State private var timerState: TimerState = .paused
    @State private var secondsPassed = 0
    
    private let viewModel = TimerViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(timerText)
                    .frame(minWidth: geometry.size.width / 2, maxWidth: geometry.size.width / 1.5, maxHeight: geometry.size.height * 0.4, alignment: .center)
                    .font(.system(size: 500).monospacedDigit())
                    .minimumScaleFactor(0.001)
                    .onReceive(viewModel.timer) { date in
                        self.secondsPassed += 1
                        
                        let hours = String(format: "%02d", self.secondsPassed / 60)
                        let minutes = String(format :"%02d", self.secondsPassed % 60)
                        self.timerText = "\(hours):\(minutes)"
                    }
                    .scaledToFit()
                    .accessibility(identifier: AccessID.timerLabelID.rawValue)
                
                Button(action: handleButtonPress) {
                    Text(buttonText)
                        .padding(5)
                        .font(.system(size: 500))
                        .minimumScaleFactor(0.001)
                        .frame(maxWidth: geometry.size.width / 2, maxHeight: geometry.size.height * 2 / 9)
                        .background(Color("Primary"))
                        .cornerRadius(CGFloat(15))
                        .foregroundColor(Color("AltText"))
                }
                .scaledToFit()
                .accessibility(identifier: AccessID.startPauseButtonID.rawValue)
                
                Button(action: {
                    self.timerState = .paused
                    self.viewModel.stop()
                    self.buttonText = "Start"
                    self.secondsPassed = 0
                    self.timerText = "00:00"
                }) {
                    Text("Reset")
                        .frame(maxWidth: geometry.size.width / 4, maxHeight: geometry.size.height / 9)
                        .font(.system(size: 500))
                        .minimumScaleFactor(0.001)
                        .foregroundColor(Color("Primary"))
                }
                .scaledToFit()
                .accessibility(identifier: AccessID.resetButtonID.rawValue)
                
                Spacer()
                    .frame(maxHeight: geometry.size.height / 9)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func handleButtonPress() {
        switch timerState {
        case .running:
            viewModel.stop()
            buttonText = "Start"
            timerState = .paused
            
        case .paused:
            viewModel.start()
            buttonText = "Pause"
            timerState = .running
        }
    }
}

