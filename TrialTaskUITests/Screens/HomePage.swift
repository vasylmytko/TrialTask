//
//  HomePage.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 6/3/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation

class HomeScreen: Screen {
    static func loginIfNeeded(_ email: String, password: String) -> UsersListScreen {
        let logScreen = LogInScreen()
        logScreen.logInWithCredentials(email: email, password: password)
        return UsersListScreen()
    }
}
