//
//  NotificationCell.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/10/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    var delegate: NotificationCellDelegate?
    
    @IBAction func switchDidChangeValue(_ sender: UISwitch) {
        delegate?.simulateNotifications(sender.isOn)
    }
}
