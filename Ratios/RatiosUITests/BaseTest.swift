//
//  UITestCase.swift
//  RatiosUITests
//
//  Created by Евгений Башун on 19.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    
    private(set) var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        app = nil
    }
}
