//
//  EditScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class EditScreen: Screen {
    private let userImageView = app.images.firstMatch
    private let cancelButton = app.buttons["Cancel"]
    private let saveButton = app.buttons["Save"]
    private let nameTextField = app.textFields["nameTextField"]
    private let emailTextField = app.textFields["emailTextField"]
    
    internal override func waitForScreenLoaded() {}

    func closeEditScreen() -> SettingsScreen {
        cancelButton.tap()
        return SettingsScreen()
    }
    
    func closeAndSaveEditScreen() -> SettingsScreen {
        saveButton.tap()
        return SettingsScreen()
    }
    
    func choosePhoto() {
        userImageView.tap()
    }
}

