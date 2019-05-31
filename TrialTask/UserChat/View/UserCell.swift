//
//  UserCell.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/5/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!

    
    func updateUI(_ user: User) {
        userImage.image = user.image
        userNameLabel.text = user.name
        userEmailLabel.text = user.email
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImage.layer.cornerRadius = userImage.frame.width / 2
        userImage.layer.masksToBounds = true
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.gray : UIColor.black
        }
    }
}
