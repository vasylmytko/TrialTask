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
    
    private var dataProvider: DataProvider!
    
    private var selectedUser: User!
    
    public init(delegate: ChatPresenterDelegate, selectedUser: User) {
        super.init()
        self.delegate = delegate
        let messengerDataProvider = MessengerDataProvider()
        messengerDataProvider.delegate = self
        self.dataProvider = messengerDataProvider
        setUser(selectedUser)
    }
    
    public func setUser(_ user: User) {
        selectedUser = user
        messages()
    }
    
    public func sendMessage(_ message: String) {
        let messageObject = Message(text: message, sender: User.currentUser!, recevier: selectedUser, date: Date())
        dataProvider.sendMessage(messageObject)
    }
    
    public func messages() {
        let messages = dataProvider.messagesBetween(user1: User.currentUser!, selectedUser)
        delegate?.setMessages(messages)
    }
}

extension ChatPresenter: MessengerDataProviderDelegate {
    func newMessage(_ message: MessageData) {
        delegate?.newMessage(message)
    }
}
