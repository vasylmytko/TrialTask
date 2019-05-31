//
//  UIView+Animation.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/8/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

extension UIView {
    func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = self.center.x - 5
        animation.toValue = self.center.x + 5
        animation.repeatCount = 3
        animation.duration = 0.1
        self.layer.add(animation, forKey: nil)
    }
}


