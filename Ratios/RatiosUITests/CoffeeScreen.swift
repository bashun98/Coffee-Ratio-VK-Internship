//
//  CoffeeScreen.swift
//  RatiosUITests
//
//  Created by Евгений Башун on 19.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import XCTest

final class CoffeeScreen {
    
    private let app: XCUIApplication!
    
    //MARK: - Enums
    
    enum TimerAction {
        case start
        case reset
        case pause
    }
    
    enum TextFields {
        case waterTextField
        case coffeeTextField
    }
       
    //MARK: - Buttons
    
    var startButton: XCUIElement {
        app.buttons[AccessID.startPauseButtonID.rawValue]
    }

    var pauseButton: XCUIElement {
        app.buttons[AccessID.startPauseButtonID.rawValue]
    }

    var resetButton: XCUIElement {
        app.buttons[AccessID.resetButtonID.rawValue]
    }


    //MARK: - TextFields

    var coffeeTextField: XCUIElement {
        app.textFields[AccessID.coffeeTextFieldID.rawValue]
    }

    var waterTextField: XCUIElement {
        app.textFields[AccessID.waterTextFieldID.rawValue]
    }


    //MARK: - Labels

    var waterLabel: XCUIElement {
        app.staticTexts[AccessID.waterLabelID.rawValue]
    }

    var timerLabel: XCUIElement {
        app.staticTexts[AccessID.timerLabelID.rawValue]
    }
    
    var coffeeLabel: XCUIElement {
        app.staticTexts[AccessID.coffeeLabelID.rawValue]
    }
    
    //MARK: - Windows
    
    var mainWindow: XCUIElement {
        app.windows[AccessID.mainID.rawValue]
    }
    
    //MARK: - ContentView
    
    var contentView: XCUIElement {
        app.otherElements[AccessID.contentViewID.rawValue]
    }
    
    //MARK: - Init CoffeeScreen
    
    init(with app: XCUIApplication) {
        self.app = app
    }
    
    //MARK: - Work with TextFields
    
    func tapTo(_ textfield: TextFields) {
        switch textfield {
        case .waterTextField:
            waterTextField.tap()
        case .coffeeTextField:
            coffeeTextField.tap()
        }
    }
    
    func type(into textfield: TextFields, text: String) {
        switch textfield {
        case .waterTextField:
            tapTo(.waterTextField)
            waterTextField.typeText(text)
        case .coffeeTextField:
            tapTo(.coffeeTextField)
            coffeeTextField.typeText(text)
        }
    }
    
    //MARK: - Work with Timer
    
    func timerShould(_ action: TimerAction) {
        switch action {
        case .start:
            startButton.tap()
        case .reset:
            resetButton.tap()
        case .pause:
            pauseButton.tap()
        }
    }
    
    func titleOf(button type: TimerAction) -> String {
        switch type {
        case .start:
            return startButton.label
        case .reset:
            return resetButton.label
        case .pause:
            return pauseButton.label
        }
    }
}
