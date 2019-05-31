//
//  BaseLayoutTestCase.swift
//  TrialTaskTests
//
//  Created by Vasyl Mytko on 5/28/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest
import LayoutTest

class BaseLayoutTestCase: LayoutTestCase {

    override func setUp() {
        super.setUp()
        Config.sharedInstance().viewSizesToTest = [
            ViewSize(width: LYTiPhone4Width),
            ViewSize(width: LYTiPhone6Width),
            ViewSize(width: LYTiPadWidth),
            ViewSize(width: LYTiPhone4Height),
            ViewSize(width: LYTiPhone6Height),
            ViewSize(width: LYTiPadHeight)
        ]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
