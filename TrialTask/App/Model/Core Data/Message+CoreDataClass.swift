//
//  MessageData+CoreDataClass.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/8/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//
//

import Foundation
import CoreData

public class MessageData: NSManagedObject {

    @discardableResult
    static func saveMessage(_ message: Message, in context: NSManagedObjectContext) -> MessageData {
        let entity = NSEntityDescription.entity(forEntityName: "Message", in: context)!
        let messageData = MessageData(entity: entity, insertInto: context)
        messageData.date = message.date as NSDate
        
        let sender = UserData.saveUser(message.sender, in: context)
        let receiver = UserData.saveUser(message.recevier, in: context)
        messageData.receiver = receiver
        messageData.sender = sender
        messageData.date = message.date as NSDate
        messageData.text = message.text
        
        do {
            try context.save()
        } catch {
            fatalError("Error occured while saving messages")
        }
        return messageData
    }
    
    static func fetchMessages(in context: NSManagedObjectContext) -> [Message] {
        let request: NSFetchRequest<MessageData> = MessageData.fetchRequest()
        var messages = [Message]()
        do {
            messages = try context.fetch(request).map { Message(from: $0) }
        } catch {
            fatalError("Error occured while fetching messages")
        }
        return messages
    }
    
}
