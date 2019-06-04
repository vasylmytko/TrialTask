//
//  String+EstimatedFrameForText.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 6/4/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import UIKit

extension String {
    var estimatedFrame: CGRect {
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], context: nil)
    }
}
