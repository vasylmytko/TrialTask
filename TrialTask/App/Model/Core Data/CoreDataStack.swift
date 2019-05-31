//
//  CoreDataStack.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/8/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    var modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    lazy var  managedContext: NSManagedObjectContext = {
        return storeContainer.viewContext
    }()
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    public func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch {
            let error = error as Error
            print("Unresolved error \(error)")
        }
    }
    
    func loadData() {
        deleteData()
        messages.forEach {
            MessageData.saveMessage($0, in: self.managedContext)
        }
    }
    
    private func deleteData() {
        let request: NSFetchRequest<MessageData> = MessageData.fetchRequest()
        do {
            let messages = try managedContext.fetch(request)
            messages.forEach { managedContext.delete($0) }
            try managedContext.save()
        } catch {
            fatalError("Error occured while deleting objects")
        }
     }
}

