//
//  ContentView.swift
//  Ratios
//
//  Created by John Peden on 2/26/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var coffee: String = ""
    @State var waterRatio: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                CoffeeInput(amount: $coffee)
                    .frame(width: geometry.size.width, height: geometry.size.height / 5)
                
                Divider()
                    .frame(width: geometry.size.width / 1.5)
                
                WaterInput(amount: $waterRatio)
                    .frame(width: geometry.size.width, height: geometry.size.height / 5)
                
                Divider()
                    .frame(width: geometry.size.width / 1.5)
                
                WaterDisplay(
                    waterRatio: $coffee,
                    coffee: $waterRatio
                )
                .frame(width: geometry.size.width, height: geometry.size.height / 5)
                
                Divider()
                    .frame(width: geometry.size.width / 1.5)
                
                TimerView()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
            }
            .padding()
            .frame(width: geometry.size.width)
            .frame(minHeight: geometry.size.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
