//
//  SignUpScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class SignUpScreen: Screen {
    private let nameTextField = app.textFields["Enter username"]
    
    private let emailTextField = app.textFields["Enter email"]
    
    private let passwordTextField = app.secureTextFields["Enter password"]
    
    private let confirmPasswordTextField = app.secureTextFields["Confirm password"]
    
    private let signUpButton = app.buttons["Sign up"]
    
    internal override func waitForScreenLoaded() {}
    
}
