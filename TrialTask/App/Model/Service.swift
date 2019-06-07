//
//  Service.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 6/6/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation
import CoreData

protocol DataProvider {
    func messagesBetween(user1: User, and user2: User)
    func sendMessage(_ message: Message)
}

class MessengerDataProvider: NSObject {
    
}

extension MessengerDataProvider: NSFetchedResultsControllerDelegate {
    
}

extension MessengerDataProvider: DataProvider {
    func messagesBetween(user1: User, and user2: User) {
        
    }
    
    func sendMessage(_ message: Message) {
        
    }
}

