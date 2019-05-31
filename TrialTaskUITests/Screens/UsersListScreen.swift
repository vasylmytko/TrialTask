//
//  UsersListScreen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest

class UsersListScreen: Screen, MessengerTabBar {
    
    internal override func waitForScreenLoaded() {}

    
    func selectUserAt(_ index: Int) -> ChatScreen {
        
        return ChatScreen()
    }
    
}
