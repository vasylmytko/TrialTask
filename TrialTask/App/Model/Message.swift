//
//  Message.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/8/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import Foundation

struct Message {
    var text: String
    var sender: User
    var recevier: User
    var date: Date
    
    init(text: String, sender: User, recevier: User, date: Date) {
        self.text = text
        self.sender = sender
        self.recevier = recevier
        self.date = date
    }
    
    init(from messageData: MessageData) {
        self.text = messageData.text!
        self.sender = User(from: messageData.sender!)
        self.recevier = User(from: messageData.receiver!)
        self.date = messageData.date! as Date
    }
}
