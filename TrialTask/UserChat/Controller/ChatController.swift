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
    
    var chatPresenter: ChatPresenter!
    
    var messageData: [MessageData] = []
    
    var selectedUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatPresenter = ChatPresenter(delegate: self, user: selectedUser)
        
        chatPresenter.fetchMessages()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = selectedUser.name
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let item = messageData.count - 1
        let indexPath = IndexPath(item: item, section: 0)
        chatCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: false)
    }
    
    @IBAction func handleSend(_ sender: UIButton) {
        guard !draftTextField.text!.isEmpty else {
            return
        }
        chatPresenter.sendMessage(draftTextField.text!)
    }
    
    @objc private func handleKeyboardNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            draftBottomAnchor.constant = isKeyboardShowing ? -keyboardFrame.height + self.view.safeAreaInsets.bottom : 0
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }) { (compeleted) in
                let indexPath = IndexPath(item: self.messageData.count - 1 , section: 0)
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
  
        cell.messageTextView.text = messageData[indexPath.item].text
        
        cell.isIncoming = messageData[indexPath.item].receiver!.name == User.currentUser?.name
        
        let messageText = messageData[indexPath.item].text
        
        cell.textViewWidthConstraint.constant = estimatedFrameForText(messageText!).width + 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageData.count
    }
}

extension ChatController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let messageText = messageData[indexPath.item].text
        let height = estimatedFrameForText(messageText!).height + 30
        return CGSize(width: chatCollectionView.frame.width, height: height)
    }
    
}

extension ChatController: ChatPresenterDelegate {
    func receiveMessage(_ message: MessageData) {
        self.messageData.append(message)
        chatCollectionView.reloadData()
    }
    
    func setMessages(_ messages: [MessageData]) {
        self.messageData = messages
        chatCollectionView.reloadData()
    }
    
    func messageSent(_ message: MessageData) {
        self.messageData.append(message)
        chatCollectionView.reloadData()
    }
}

extension ChatController: UserSelectionDelegate {
    func userSelecter(_ user: User) {
        selectedUser = user
    }
}
