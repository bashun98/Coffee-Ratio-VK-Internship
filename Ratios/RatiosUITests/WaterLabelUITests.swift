//
//  WaterLabelUITests.swift
//  RatiosUITests
//
//  Created by Евгений Башун on 18.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import XCTest

final class WaterLabelUITests: BaseTest {
    
    //MARK: - water label not changed if no coffee or no ratio

    func testWaterLabelNotChangedIfNoCoffee() {
        //Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        
        //Act
        coffeeScreen.type(into: .waterTextField, text: "5")
        let waterLabel = coffeeScreen.waterLabel
        
        //Assert
        XCTAssertTrue(waterLabel.exists)
    }
    
    func testWaterLabelNotChangedIfNoWaterRatio() {
        //Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        
        //Act
        coffeeScreen.type(into: .coffeeTextField, text: "5")
        let waterLabel = coffeeScreen.waterLabel
        
        //Assert
        XCTAssertTrue(waterLabel.exists)
    }
    
    //MARK: - calculation result is shown
  
    func testWaterLabelChangedWhenCalculationSuccess() {
        //Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let initialWaterLabel = coffeeScreen.waterLabel.label
        
        //Act
        coffeeScreen.type(into: .coffeeTextField, text: "123")
        app.buttons["Done"].tap()
        coffeeScreen.type(into: .waterTextField, text: "3")
        app.buttons["Done"].tap()
        let resultLabel = coffeeScreen.waterLabel.label
        
        //Assert
        XCTAssertNotEqual(initialWaterLabel, resultLabel)
    }
    
    //MARK: - waterLabel sizetofit
    
    func testWaterLabelSizeToFit() {
        //Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let windowWidth = coffeeScreen.mainWindow.frame.width
        coffeeScreen.type(into: .coffeeTextField, text: "99999")
        app.buttons["Done"].tap()
        coffeeScreen.type(into: .waterTextField, text: "99")
        app.buttons["Done"].tap()
        let resultLabelWidth = coffeeScreen.waterLabel.frame.width
        
        //Act
        
        //Assert
        XCTAssertLessThanOrEqual(resultLabelWidth, windowWidth)
    }
}
