//
//  UserCellLayoutTest.swift
//  TrialTaskTests
//
//  Created by Vasyl Mytko on 5/27/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import XCTest
import UIKit
import LayoutTest
@testable import TrialTask

class UserCellLayoutTest: BaseLayoutTestCase {
    func testLayout() {
        runLayoutTests(withViewProvider: UserCell.self) { (view: UserCell, data, context) in
            XCTAssertTrue(view.userEmailLabel.below(view.userNameLabel))
            XCTAssertTrue(view.userEmailLabel.after(view.userImage))
            XCTAssertTrue(view.userNameLabel.leadingAligned(view.userEmailLabel))
            XCTAssertTrue(view.userNameLabel.trailingAligned(view))
            XCTAssertTrue(view.userEmailLabel.trailingAligned(view))
            XCTAssertTrue(view.userImage.topAligned(view.userNameLabel))
        }
    }
}
