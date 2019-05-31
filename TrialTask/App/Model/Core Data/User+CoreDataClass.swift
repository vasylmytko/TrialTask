//
//  UserData+CoreDataClass.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/8/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


public class UserData: NSManagedObject {

    static func saveUser(_ user: User, in context: NSManagedObjectContext) -> UserData {
        let request: NSFetchRequest<UserData> = UserData.fetchRequest()
        
        let predicate = NSPredicate(format: "name == %@", user.name)

        request.predicate = predicate
        
        var users: [UserData] = []

        do {
            users = try context.fetch(request)
        } catch {
            fatalError("Error occured while fetching Users")
        }
        
        guard users.last == nil else {
            return users.last!
        }
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let userData = UserData(entity: entityDescription, insertInto: context)
        
        userData.name = user.name
        userData.email = user.email
        
        if let image = user.image {
            let imageData = image.jpegData(compressionQuality: 1)
            userData.image = imageData as NSData?
        }
        
        if let password = user.password {
            userData.password = password
        }
        
        do {
            try context.save()
        } catch {
            fatalError("Error occured while saving user to CoreData")
        }
        
        return userData
    }
    
    func chatWithUser(_ user: User) -> [Message] {
        let recevied: [Message] = (Array(receivedMessages!) as! [MessageData]).map { Message(from: $0) }
        let sent: [Message] = (Array(sentMessages!) as! [MessageData]).map { Message(from: $0) }
        return (recevied.filter { $0.sender.name == user.name } + sent.filter { $0.recevier.name == user.name }).sorted {
            return $0.date < $1.date
        }
    }
    
    static func loggedInUser(in context: NSManagedObjectContext) -> UserData {
        let request: NSFetchRequest<UserData> = UserData.fetchRequest()
        
        let predicate = NSPredicate(format: "name == %@", User.currentUser!.name)
        
        request.predicate = predicate
        
        var loggedInUser: UserData!

        do {
            loggedInUser = try context.fetch(request).first!
        } catch {
            fatalError("Error occured while fetching logged in user")
        }
        
        return loggedInUser
    }
    
    static func userWithName(_ name: String, in context: NSManagedObjectContext) -> UserData? {
        let request: NSFetchRequest<UserData> = UserData.fetchRequest()
        let predicate = NSPredicate(format: "name==%@", name)
        request.predicate = predicate
        
        var user: UserData?
        
        do {
            user = try context.fetch(request).first
        } catch {
            fatalError("Error occured while searching user")
        }
        
        return user
    }
}
