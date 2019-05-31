//
//  UserCell+ViewProvider.swift
//  TrialTaskTests
//
//  Created by Vasyl Mytko on 5/27/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import UIKit
import LayoutTest
@testable import TrialTask

extension UserCell: ViewProvider {
    
    public static func dataSpecForTest() -> [AnyHashable : Any] {
        return [
            "userName": StringValues(required: true),
            "userEmail": StringValues(required: true)
        ]
    }
    
    public static func view(forData data: [AnyHashable : Any], reuse reuseView: UIView?, size: ViewSize?, context: AutoreleasingUnsafeMutablePointer<AnyObject?>?) -> UIView {
        let view: UserCell = {
            if let reuseView = reuseView as? UserCell {
                return reuseView
            } else {
                let contents = Bundle.main.loadNibNamed("UserCell", owner: nil, options: nil)
                let cell = contents?.first as? UserCell
                return cell!
            }
        }()
        view.userImage.image = user1.image
        view.userEmailLabel.text = data["userName"] as? String
        view.userEmailLabel.text = data["userEmail"] as? String
        return view
    }
} 
