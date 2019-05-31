//
//  MessengerTabBar.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation
import XCTest

protocol MessengerTabBar {
    func goToSettingsPage() -> SettingsScreen
    func goToChatPage() -> UsersListScreen
}

extension MessengerTabBar {
    private var chatButton: XCUIElement {
        return Screen.app.buttons["Chats"]
    }
    
    private var settingsButton: XCUIElement {
        return Screen.app.buttons["Settings"]
    }
    
    @discardableResult
    func goToSettingsPage() -> SettingsScreen {
        settingsButton.tap()
        return SettingsScreen()
    }
    
    @discardableResult
    func goToChatPage() -> UsersListScreen {
        chatButton.tap()
        return UsersListScreen()
    }
}

enum UIStatus: String {
    case exists = "exists == true"
    case notExist = "exists == false"
    case hittable = "isHittable == true"
}

func wait(for element: XCUIElement, _ status: UIStatus, within timeout: TimeInterval = 0.1) {
    let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: status.rawValue), object: element)
    let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
    
    if result == .timedOut {
        XCTFail(expectation.description)
    }
}
