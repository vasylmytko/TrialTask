//
//  LogInScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation
import XCTest

class LogInScreen: Screen {
    
    private let emailTextField = app.textFields["Enter email"]
    
    private let passwordTextField = app.secureTextFields["Enter password"]
    
    private let logInButton = app.buttons["Log in"]
    
    private let signUpButton = app.buttons["Sign up"]
    
    internal override func waitForScreenLoaded() {
        wait(for: logInButton, .exists)
    }
    
    func logInWithCredentials(email: String, password: String) -> UsersListScreen {
        emailTextField.typeText(email)
        passwordTextField.typeText(password)
        logInButton.tap()
        return UsersListScreen()
    }
}
