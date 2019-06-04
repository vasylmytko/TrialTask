//
//  LogInUITests.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 6/3/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class LogInUITests: XCTestCase {

    var logInScreen: LogInScreen!
    
    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDown() {
        let loginScreen = LogInScreen()
        loginScreen.logInWithCredentials(email: "123", password: "123")
    }
}
