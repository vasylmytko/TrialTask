//
//  MessengerDataProvider.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 6/6/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation
import CoreData

protocol DataProvider {
    func messagesBetween(user1: User, _ user2: User) -> [MessageData]
    func sendMessage(_ message: Message)
}

protocol MessengerDataProviderDelegate: class {
    func newMessage(_ message: MessageData)
}

class MessengerDataProvider: NSObject {
    public weak var delegate: MessengerDataProviderDelegate?
   
    private var fetchedResultsController: NSFetchedResultsController<MessageData>!
    
    private func setupFetchedRC(user1: User, user2: User) {
        let request: NSFetchRequest<MessageData> = MessageData.fetchRequest()
        
        var predicate1 = NSPredicate(format: "%K==%@",
                                     #keyPath(MessageData.receiver.name), user1.name)
        
        var predicate2 = NSPredicate(format: "%K==%@", #keyPath(MessageData.receiver.name), user2.name)
        
        let compoundPredicate1 = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1, predicate2])
        
        predicate1 = NSPredicate(format: "%K==%@", #keyPath(MessageData.sender.name), user1.name)
        predicate2 = NSPredicate(format: "%K==%@", #keyPath(MessageData.sender.name), user2.name)
        
        let compoundPredicate2 = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1, predicate2])
        let finalPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [compoundPredicate1, compoundPredicate2])
        
        request.predicate = finalPredicate
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.shared.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        try! fetchedResultsController.performFetch()
    }
}

extension MessengerDataProvider: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert || type == .update {
            if let index = newIndexPath?.item,  let message = fetchedResultsController.fetchedObjects?[index] {
                delegate?.newMessage(message)
            }
        }
    }
}

extension MessengerDataProvider: DataProvider {
    func messagesBetween(user1: User, _ user2: User) -> [MessageData] {
        setupFetchedRC(user1: user1, user2: user2)
        return fetchedResultsController.fetchedObjects!
    }
    
    func sendMessage(_ message: Message) {
        MessageData.saveMessage(message, in: CoreDataStack.shared.managedContext)
    }
}

