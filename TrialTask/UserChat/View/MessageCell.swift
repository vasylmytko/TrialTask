//
//  MessageCell.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/6/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var textBackgroundView: UIView!
    
    @IBOutlet weak var textViewWidthConstraint: NSLayoutConstraint!
        
    @IBOutlet weak var messageLeadingAnchor: NSLayoutConstraint!
    
    @IBOutlet weak var messageTrailingAnchor: NSLayoutConstraint!
    
    var isIncoming: Bool!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    func setupCell() {
        textBackgroundView.cornerRadius = 15
        textBackgroundView.layer.masksToBounds = true
        
        textBackgroundView.backgroundColor = isIncoming ? UIColor.darkGray : UIColor.lightGray
        
        if isIncoming {
            messageTrailingAnchor.isActive = false
            messageLeadingAnchor.isActive = true
        } else {
            messageLeadingAnchor.isActive = false
            messageTrailingAnchor.isActive = true
        }
    }
}
