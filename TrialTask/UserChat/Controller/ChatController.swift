//
//  ChatController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/6/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit
import CoreData

class ChatController: UIViewController {

    @IBOutlet weak var chatCollectionView: UICollectionView!
    
    @IBOutlet weak var draftBottomAnchor: NSLayoutConstraint!
    
    @IBOutlet weak var draftTextField: UITextField!
    
    @IBAction func handleSend(_ sender: UIButton) {
        guard !draftTextField.text!.isEmpty else {
            return
        }
        
        let message = Message(text: draftTextField.text!, sender: User.currentUser!, recevier: selectedUser, date: Date())
        
        MessageData.saveMessage(message, in: coreDataStack.managedContext)
        
        refreshUI()
        
        let count = fetchedResultsController.fetchedObjects!.count - 1

        let insertedIndexPath = IndexPath(item: count, section: 0)
        
        chatCollectionView.scrollToItem(at: insertedIndexPath, at: .bottom, animated: true)
        
        draftTextField.text = ""
    }
    
    var selectedUser: User! {
        didSet {
            setupFetchedRC()
            refreshUI()
        }
    }
    
    let coreDataStack = CoreDataStack(modelName: "TrialTask")
    
    var fetchedResultsController: NSFetchedResultsController<MessageData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = selectedUser.name
    }
    
    private func refreshUI() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Error occured while fetching Users")
        }
        
        loadViewIfNeeded()
        chatCollectionView.reloadData()
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
        
        fetchedResultsController = NSFetchedResultsController<MessageData>(fetchRequest: request, managedObjectContext: coreDataStack.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
          fetchedResultsController.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let item = fetchedResultsController.fetchedObjects!.count - 1
        let indexPath = IndexPath(item: item, section: 0)
        chatCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: false)
    }
    
    @objc private func handleKeyboardNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            draftBottomAnchor.constant = isKeyboardShowing ? -keyboardFrame.height + self.view.safeAreaInsets.bottom : 0
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }) { (compeleted) in
                let indexPath = IndexPath(item: self.fetchedResultsController.fetchedObjects!.count - 1 , section: 0)
                    self.chatCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    
    private func estimatedFrameForText(_ text: String) -> CGRect {
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], context: nil)
    }
    
}

extension ChatController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! MessageCell
  
        cell.messageTextView.text = fetchedResultsController.fetchedObjects?[indexPath.item].text
        
        cell.isIncoming = fetchedResultsController.fetchedObjects![indexPath.item].receiver!.name == User.currentUser?.name
        
        let messageText = fetchedResultsController.fetchedObjects?[indexPath.item].text
        
        cell.textViewWidthConstraint.constant = estimatedFrameForText(messageText!).width + 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
}

extension ChatController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert {
            refreshUI()
            chatCollectionView.scrollToItem(at: newIndexPath!, at: .bottom, animated: true)
        }
    }
    
}

extension ChatController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let messageText = fetchedResultsController.fetchedObjects?[indexPath.item].text
        let height = estimatedFrameForText(messageText!).height + 30
        return CGSize(width: chatCollectionView.frame.width, height: height)
    }
    
}

extension ChatController: UserSelectionDelegate {
    func userSelecter(_ user: User) {
        selectedUser = user
    }
}
