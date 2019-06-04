//
//  ChatScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation

class ChatScreen: Screen, MessengerTabBar {
    
    private let messageTextField = app.textFields["Enter message..."]
    
    private let sendButton = app.buttons["Send"]
    
    private let backButton = app.navigationBars.firstMatch.buttons["Chats"]
    
    internal override func waitForScreenLoaded() {
        wait(for: messageTextField, .exists)
    }
    
    public var userName: String {
        return Screen.app.navigationBars.staticTexts.firstMatch.label
    }
    
    public var lastMessage: String {
        return Screen.app.cells.element(boundBy: numberOfMessages - 1).staticTexts.firstMatch.label
    }
    
    public var numberOfMessages: Int {
        return Screen.app.cells.count
    }
    
    public func goBackToUsersList() -> UsersListScreen {
        backButton.tap()
        return UsersListScreen()
    }
    
    public func sendMessage(_ message: String) -> Self {
        messageTextField.tap()
        messageTextField.typeText("How are you?")
        sendButton.tap()
        return self
    }
}
