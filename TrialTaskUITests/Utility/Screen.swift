//
//  Screen.swift
//  TrialTaskUITests
//
//  Created by Vasyl Mytko on 5/31/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation
import XCTest

class Screen {
    static let app = XCUIApplication()
    
    internal func waitForScreenLoaded() {}
    
    required init() {
        waitForScreenLoaded()
    }
}
