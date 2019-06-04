//
//  ChatPresenter.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 6/4/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation
import CoreData

protocol ChatPresenterDelegate: class {
    func setMessages(_ messages: [MessageData])
    func newMessage(_ message: MessageData)
}

class ChatPresenter: NSObject {
    
    private weak var delegate: ChatPresenterDelegate?
    
    private var fetchedResultsController: NSFetchedResultsController<MessageData>!
    
    private var selectedUser: User!
    
    public init(delegate: ChatPresenterDelegate, user: User) {
        super.init()
        self.delegate = delegate
        self.selectedUser = user
        setupFetchedRC()
    }
    
    public func fetchMessages() {
        try! fetchedResultsController.performFetch()
        if let messages = fetchedResultsController.fetchedObjects {
            delegate?.setMessages(messages)
        }
    }
    
    public func sendMessage(_ message: String) {
        let messageObject = Message(text: message, sender: User.currentUser!, recevier: selectedUser, date: Date())
        MessageData.saveMessage(messageObject, in: CoreDataStack.shared.managedContext)
    }
    
    private func setupFetchedRC() {
        let request: NSFetchRequest<MessageData> = MessageData.fetchRequest()
        
        var predicate1 = NSPredicate(format: "%K==%@",
                                     #keyPath(MessageData.receiver.name), User.currentUser!.name)
        
        var predicate2 = NSPredicate(format: "%K==%@", #keyPath(MessageData.receiver.name), selectedUser.name)
        
        let compoundPredicate1 = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1, predicate2])
        
        predicate1 = NSPredicate(format: "%K==%@", #keyPath(MessageData.sender.name), User.currentUser!.name)
        predicate2 = NSPredicate(format: "%K==%@", #keyPath(MessageData.sender.name), selectedUser.name)
        
        let compoundPredicate2 = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1, predicate2])
        
        let finalPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [compoundPredicate1, compoundPredicate2])
        
        request.predicate = finalPredicate
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController<MessageData>(fetchRequest: request, managedObjectContext: CoreDataStack.shared.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
    }
}

extension ChatPresenter: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert || type == .update {
            if let index = newIndexPath?.item,  let message = fetchedResultsController.fetchedObjects?[index] {
                delegate?.newMessage(message)
            }
        }
    }
}
