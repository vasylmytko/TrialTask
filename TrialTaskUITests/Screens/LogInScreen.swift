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
    
    private let passwordTextField = app.secureTextFields["Ente password"]
    
    private let logInButton = app.buttons["Log in"]
    
    private let signUpButton = app.buttons["Sign up"]
    
    internal override func waitForScreenLoaded() {}

    
    
}
