//
//  TimerViewUITests.swift
//  RatiosUITests
//
//  Created by Евгений Башун on 17.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import XCTest

final class TimerViewUITests: BaseTest {
    
    //MARK: - timer counts
    
    func testTimerStartedAfterStartTapped() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let timerLabel = coffeeScreen.timerLabel.label
                
        // Act
        coffeeScreen.timerShould(.start)
        sleep(1)
        let newTimerLabel = coffeeScreen.timerLabel.label
        
        // Assert
        XCTAssertNotEqual(newTimerLabel, timerLabel)
    }
    
    func testTimerContinueAfterPause() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        coffeeScreen.timerShould(.start)
        sleep(1)
        coffeeScreen.timerShould(.pause)
        let timerLabel = coffeeScreen.timerLabel.label
        
        // Act
        coffeeScreen.timerShould(.start)
        sleep(1)
        let newTimerLabel = coffeeScreen.timerLabel.label

        // Assert
        XCTAssertNotEqual(timerLabel, newTimerLabel)
    }
    
    //MARK: - timer can pause
    
    func testTimerPausedAfterPauseTapped() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let timerLabel = coffeeScreen.timerLabel.label
        coffeeScreen.timerShould(.start)
        
        // Act
        coffeeScreen.timerShould(.pause)
        sleep(1)
        let newTimerLabel = coffeeScreen.timerLabel.label
        
        // Assert
        XCTAssertEqual(timerLabel, newTimerLabel)
    }
    
    //MARK: - timer reset
    
    func testTimerIsZeroIfResetTappedFirst() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let timerLabel = coffeeScreen.timerLabel.label
        
        // Act
        coffeeScreen.timerShould(.reset)
        sleep(1)
        let newTimerLabel = coffeeScreen.timerLabel.label
        
        // Assert
        XCTAssertEqual(timerLabel, newTimerLabel)
    }
    
    func testTimerIsZeroAfterResetTappedWhileCounting() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let timerLabel = coffeeScreen.timerLabel.label
        coffeeScreen.timerShould(.start)
        sleep(1)
        
        // Act
        coffeeScreen.timerShould(.reset)
        sleep(1)
        let newTimerLabel = coffeeScreen.timerLabel.label
   
        // Assert
        XCTAssertEqual(timerLabel, newTimerLabel)
    }
    
    func testTimerIsZeroAfterResetTappedWhenPause() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        let timerLabel = coffeeScreen.timerLabel.label
        coffeeScreen.timerShould(.start)
        sleep(1)
        coffeeScreen.timerShould(.pause)
        
        // Act
        coffeeScreen.timerShould(.reset)
        sleep(1)
        let newTimerLabel = coffeeScreen.timerLabel.label
        
        // Assert
        XCTAssertEqual(timerLabel, newTimerLabel)
    }
        
    //MARK: - test buttons labels
    
    func testResetButtonLabelNotChangedAfterTapped() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        
        // Act
        coffeeScreen.timerShould(.reset)
        let resetButtonLabel = coffeeScreen.titleOf(button: .reset)
        
        // Assert
        XCTAssertEqual(resetButtonLabel, "Reset")
    }
    
    func testStartButtonLabelChangedToPauseLabelAfterTapped() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        
        // Act
        coffeeScreen.timerShould(.start)
        let startButtonLabel = coffeeScreen.titleOf(button: .start)
        
        // Assert
        XCTAssertEqual(startButtonLabel, "Pause")
    }
    
    func testPauseButtonLabelChangedToStartAfterTapped() {
        // Arrange
        let coffeeScreen = CoffeeScreen(with: app)
        coffeeScreen.timerShould(.start)
        
        // Act
        coffeeScreen.timerShould(.pause)
        let pauseButtonLabel = coffeeScreen.titleOf(button: .pause)
        
        // Assert
        XCTAssertEqual(pauseButtonLabel, "Start")
    }
}
