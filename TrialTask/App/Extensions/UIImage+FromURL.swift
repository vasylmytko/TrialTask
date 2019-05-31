//
//  UIImage+FromURL.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/5/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(from url: URL) {
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            return nil
        }
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
