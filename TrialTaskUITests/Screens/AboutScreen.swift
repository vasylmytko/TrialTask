//
//  AboutScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class AboutScreen: Screen {
    
    private let closeButton = app.buttons["Close"]
    
    internal override func waitForScreenLoaded() {}
    
    func closeScreen() -> SettingsScreen {
        closeButton.tap()
        return SettingsScreen()
    }
}
