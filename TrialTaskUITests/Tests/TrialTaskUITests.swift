//
//  TrialTaskUITests.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/28/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class TrialTaskUITests: XCTestCase {

    var app: XCUIApplication!
    
    var homePage: UsersListScreen!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        getBackToUsersList()
    }
    
    func testSignUp() {
        
    }
    
    func testGoToAllOfTabBarPages() {
        homePage.goToChatPage().goToSettingsPage()
    }
    
    func testUserSelection() {
        selectUserNumber(3)
    }
    
    func testAboutScreen() {
        goToAboutScreen()
        tapOnTextView()
        expectTextViewNotBeResponsive()
        tapCloseButton()
        settingsScreenIsShown()
    }
    
    func testKeyboardSelectionInChat() {
        selectUserNumber(2)
        tapOnTextField()
        expectChatCollectionViewIsNotCoveredByKeyboard()
    }
    
    func testLogoutBehavior() {
        goToSettingsScreen()
        pressLogoutButton()
        actionSheetIsShownOnScreen()
//        pressConfiramtionLogoutButton()
//        loginScreenIsShown()
    }
    
    func testEditScreen() {
        goToEditScreen()
        tapOnUserNameTextField()
        texfieldsAreNotCoveredByKeyboard()
    }
}

extension TrialTaskUITests {
    func goToSettingsScreen() {
        app.tabBars.buttons.element(boundBy: 1).tap()
    }
    
    func pressLogoutButton() {
        app.buttons["Log out"].tap()
    }
    
    func tapOnUserNameTextField() {
        app.textFields.element(boundBy: 0).tap()
    }
    
    func signUp() {
        app.buttons["Sign up"].tap()
        let userNameTextField = app.textFields["Enter username"]
        let emailTextField = app.textFields["Enter email"]
        let passwordTextField = app.textFields["Enter password"]
        let confirmPasswordTextField = app.textFields["Confirm password"]
        
        userNameTextField.tap()
        userNameTextField.typeText("gfbhjgl")
        
        emailTextField.tap()
        emailTextField.typeText("gdfsh")
        
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("123")
        app.buttons["Sign up"].tap()
    }
    
    func texfieldsAreNotCoveredByKeyboard() {
        let textFields = app.textFields.allElementsBoundByIndex
        let keyboard = app.keyboards.element
        textFields.forEach { (textfield) in
            XCTAssertFalse(keyboard.frame.intersects(textfield.frame))
        }
    }
    
    func pressConfiramtionLogoutButton() {
        app.sheets.buttons["Log out"].tap()
        
    }
    
    func loginScreenIsShown() {
        XCTAssertTrue(app.staticTexts["Log in"].waitForExistence(timeout: 1.5))
    }
    
    func actionSheetIsShownOnScreen() {
        XCTAssertTrue(app.sheets.element.waitForExistence(timeout: 1.5))
    }
    
    func tapOnTextField() {
        app.textFields.element.tap()
    }
    
    func tapCloseButton() {
        app.buttons["Close"].tap()
    }
    
    func settingsScreenIsShown() {
        XCTAssertTrue(app.buttons["Log out"].waitForExistence(timeout: 1.5))
    }
    
    func expectChatCollectionViewIsNotCoveredByKeyboard() {
        let collectionView = app.collectionViews.element
        let keyboard = app.keyboards.element
        XCTAssertFalse(keyboard.frame.intersects(collectionView.frame))
    }

    func goToAboutScreen() {
        goToSettingsScreen()
        app.tables.element.cells.element(boundBy: 1).tap()
    }
    
    func goToEditScreen() {
        goToSettingsScreen()
        app.tables.element.cells.element(boundBy: 0).tap()
    }
    
    func tapOnTextView() {
        app.textViews.element.tap()
    }
    
    func expectTextViewNotBeResponsive() {
        XCTAssertFalse(app.keyboards.element.waitForExistence(timeout: 3))
    }
    
    func getBackToUsersList() {
        app.navigationBars.element.buttons["Chats"].tap()
    }
    
    func selectUserNumber(_ number: Int) {
        app.collectionViews.element.cells.element(boundBy: number).tap()
    }
}
