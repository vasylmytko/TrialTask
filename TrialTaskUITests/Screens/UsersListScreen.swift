//
//  UsersListScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class UsersListScreen: Screen, MessengerTabBar {
    
    private let navBarLabel = app.navigationBars.firstMatch.staticTexts["Chats"]
    private let usersListCollection = app.collectionViews.firstMatch
    
    var numberOfChats: Int {
        return Screen.app.cells.count
    }
    
    internal override func waitForScreenLoaded() {
        wait(for: navBarLabel, .exists)
    }
    
    func selectUserAt(_ index: Int) -> ChatScreen {
        usersListCollection.cells.allElementsBoundByIndex[index].tap()
        return ChatScreen()
    }
    
    func selectUserWithName(_ name: String) -> ChatScreen {
        let cell = usersListCollection.cells.allElementsBoundByIndex.first { $0.label == name }
        cell!.tap()
        return ChatScreen()
    }
}
