//
//  ContentViewElementsUITests.swift
//  RatiosUITests
//
//  Created by Евгений Башун on 18.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import XCTest

final class ContentViewElementsUITests: BaseTest {
    
    //MARK: - Elements can not be wider than the screen
    
    func testWidestElementCanNotbeOffscreen() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let coffeeLabelWidth = coffeeScreen.coffeeLabel.frame.width
        let windowWidth = coffeeScreen.mainWindow.frame.width
        
        // Act
        
        // Assert
        XCTAssertLessThanOrEqual(coffeeLabelWidth, windowWidth)
    }
    
    //MARK: - contentview not offscreen when textfield tapped
    
    func testContentViewOnScreenAfterTextFieldTapped() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let windowMinY = coffeeScreen.mainWindow.frame.minY
        let windowMaxY = coffeeScreen.mainWindow.frame.maxY
        
        // Act
        coffeeScreen.tapTo(.waterTextField)
        let contentViewMinY = coffeeScreen.contentView.frame.minY
        let contentViewMaxY = coffeeScreen.contentView.frame.maxY
        
        // Assert
        XCTAssertGreaterThanOrEqual(contentViewMinY, windowMinY)
        XCTAssertLessThanOrEqual(contentViewMaxY, windowMaxY)
    }
}
