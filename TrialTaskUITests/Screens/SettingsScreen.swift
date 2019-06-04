//
//  SettingsScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class SettingsScreen: Screen, MessengerTabBar {
    private let logOutButton: XCUIElement = app.buttons["Log out"]
    
    private let aboutCell = app.cells.element(boundBy: 0)
    
    private let editCell = app.cells.element(boundBy: 1)
    
    private let notificationSwitch = app.cells.switches.firstMatch
    
    internal override func waitForScreenLoaded() {
        wait(for: logOutButton, .exists)
    }

    public func goToEditScreen() -> EditScreen {
        editCell.tap()
        return EditScreen()
    }
    
    public func goToAboutScreen() -> AboutScreen {
        aboutCell.tap()
        return AboutScreen()
    }
    
    public func logOut() -> SettingsScreen {
        logOutButton.tap()
        return SettingsScreen()
    }
    
    public func alertIsShown() -> Bool {
        let alert = Screen.app.alerts.firstMatch.buttons["Log out"]
        return alert.waitForExistence(timeout: 1.5)
    }
    
    public func confirmLogout() -> LogInScreen {
        let button = Screen.app.alerts.firstMatch.buttons["Log out"]
        button.tap()
        return LogInScreen()
    }
    
    public func turnNotificationsOn() -> Self {
        notificationSwitch.tap()
        return self
    }
}
