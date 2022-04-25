//
//  WaterDisplay.swift
//  Ratios
//
//  Created by John Peden on 2/29/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI

struct WaterDisplay: View {
    
    @Binding var waterRatio: String
    @Binding var coffee: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(maxHeight: geometry.size.height * 0.05)
                
                Text("You need")
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.001)
                    .frame(maxWidth: geometry.size.width / 2, maxHeight: geometry.size.height * 0.2)
                    .scaledToFit()
                
                Text(
                    String(
                        CalculatorViewModel.calculateGramsOfWaterTimes(
                            waterRatio: Grams(waterRatio) ?? 0,
                            coffee: Grams(coffee) ?? 0
                        )
                    )
                )
                .frame(minWidth: geometry.size.width * 0.5, maxWidth: geometry.size.width * 0.7, maxHeight: .infinity, alignment: .center)
                .font(.system(size: 500))
                .minimumScaleFactor(0.001)
                .scaledToFit()
                .accessibility(identifier: AccessID.waterLabelID.rawValue)
                
                Text("grams of water")
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.001)
                    .frame(maxWidth: geometry.size.width / 2, maxHeight: geometry.size.height * 0.15)
                    .lineLimit(1)
                    .scaledToFit()
                
                Spacer()
                    .frame(maxHeight: geometry.size.height * 0.05)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
