//
//  UserData+CoreDataProperties.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/8/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var image: NSData?
    @NSManaged public var receivedMessages: NSSet?
    @NSManaged public var sentMessages: NSSet?

}

// MARK: Generated accessors for receivedMessages
extension UserData {

    @objc(addReceivedMessagesObject:)
    @NSManaged public func addToReceivedMessages(_ value: MessageData)

    @objc(removeReceivedMessagesObject:)
    @NSManaged public func removeFromReceivedMessages(_ value: MessageData)

    @objc(addReceivedMessages:)
    @NSManaged public func addToReceivedMessages(_ values: NSSet)

    @objc(removeReceivedMessages:)
    @NSManaged public func removeFromReceivedMessages(_ values: NSSet)

}

// MARK: Generated accessors for sentMessages
extension UserData {

    @objc(addSentMessagesObject:)
    @NSManaged public func addToSentMessages(_ value: MessageData)

    @objc(removeSentMessagesObject:)
    @NSManaged public func removeFromSentMessages(_ value: MessageData)

    @objc(addSentMessages:)
    @NSManaged public func addToSentMessages(_ values: NSSet)

    @objc(removeSentMessages:)
    @NSManaged public func removeFromSentMessages(_ values: NSSet)

}
