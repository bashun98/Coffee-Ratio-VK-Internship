//
//  TextFieldsUITests.swift
//  RatiosUITests
//
//  Created by Евгений Башун on 17.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import XCTest

final class TextFieldsUITests: BaseTest {
    
    //MARK: - Is userinteractive?
    
    func testCoffeeTextFieldIsUserInteractive() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        
        // Act

        // Assert
        XCTAssertTrue(coffeeScreen.coffeeTextField.isHittable)
    }

    func testRatioTextFieldIsUserInteractive() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)

        // Act

        // Assert
        XCTAssertTrue(coffeeScreen.waterTextField.isHittable)
    }
    
    //MARK: - TextFields are hittable when keyabord appears
    
    func testTextFieldsAreHittableWhenTappedToCoffeeTextfield() {
        //Arrange
        let coffeeScreen = CoffeeScreen(with: app)
         
        // Act
        coffeeScreen.tapTo(.coffeeTextField)
        
        //Assert
        XCTAssertTrue(coffeeScreen.waterTextField.isHittable)
        XCTAssertTrue(coffeeScreen.coffeeTextField.isHittable)
    }
    
    func testTextFieldsAreHittableWhenTappedToWaterTextfield() {
        //Arrange
        let coffeeScreen = CoffeeScreen(with: app)
         
        // Act
        coffeeScreen.tapTo(.waterTextField)
        
        //Assert
        XCTAssertTrue(coffeeScreen.waterTextField.isHittable)
        XCTAssertTrue(coffeeScreen.coffeeTextField.isHittable)
    }
    
    //MARK: - keyboard can be dismissed
    
    func testKeyboardDismissedWhenDoneButtonTapped() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        coffeeScreen.tapTo(.waterTextField)

        // Act
        app.buttons["Done"].tap()
     
        // Assert
        XCTAssertFalse(app.keyboards.element.exists)
    }
    
    //MARK: - TextFields have a limit on input
    
    func testCoffeeTextFieldInputCanNotBeMoreThanFiveDigits() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
               
        // Act
        coffeeScreen.type(into: .coffeeTextField, text: "9999999999")
        app.buttons["Done"].tap()
        let currentTextOfTextfield = coffeeScreen.coffeeTextField.value as! String

        // Assert
         XCTAssertEqual(currentTextOfTextfield, "99999")
    }
    
    func testWaterTextFieldInputCanNotBeMoreThanTwoDigits() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
               
        // Act
        coffeeScreen.type(into: .waterTextField, text: "9999999999")
        app.buttons["Done"].tap()
        let currentTextOfTextfield = coffeeScreen.waterTextField.value as! String

        // Assert
         XCTAssertEqual(currentTextOfTextfield, "99")
    }
    
    //MARK: - Textfields text sizetofit
    
    func testCoffeeTextFieldInputAlwaysNarrowerThanTextField() {
        // Arrange
        let coffeeScreeen = CoffeeScreen(with: app)
        let textFieldWidth = coffeeScreeen.coffeeTextField.frame.width
        let windowHeight = coffeeScreeen.mainWindow.frame.height
        let fontsize = windowHeight * 0.03
        
        // Act
        coffeeScreeen.type(into: .coffeeTextField, text: "99999")
        app.buttons["Done"].tap()
        let inputText = coffeeScreeen.coffeeTextField.value as! String
        let inputTextWidth = inputText.widthOfString(usingFont: .systemFont(ofSize: fontsize))
        
        // Assert
        XCTAssertLessThanOrEqual(inputTextWidth, textFieldWidth)
    }
    
    func testWaterTextFieldInputAlwaysNarrowerThanTextField() {
        // Arrange
        let coffeeScreeen = CoffeeScreen(with: app)
        let textFieldWidth = coffeeScreeen.waterTextField.frame.width
        let windowHeight = coffeeScreeen.mainWindow.frame.height
        let fontsize = windowHeight * 0.04
        
        // Act
        coffeeScreeen.type(into: .waterTextField, text: "99")
        app.buttons["Done"].tap()
        let inputText = coffeeScreeen.waterTextField.value as! String
        let inputTextWidth = inputText.widthOfString(usingFont: .systemFont(ofSize: fontsize))
        
        // Assert
        XCTAssertLessThanOrEqual(inputTextWidth, textFieldWidth)
    }
}
