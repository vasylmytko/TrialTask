//
//  MessageData+CoreDataProperties.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/8/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//
//

import Foundation
import CoreData


extension MessageData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MessageData> {
        return NSFetchRequest<MessageData>(entityName: "Message")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var sender: UserData?
    @NSManaged public var receiver: UserData?

}
