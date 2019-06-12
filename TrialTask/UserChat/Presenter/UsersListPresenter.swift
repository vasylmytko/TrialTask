//
//  UsersListPresenter.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 6/4/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation

fileprivate var users: [User] = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]

protocol UsersListPresenterDelegate: class {
    func setUsers(_ users: [User])
}

class UsersListPresenter: NSObject {
    weak var delegate: UsersListPresenterDelegate?
    
    init(delegate: UsersListPresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetchUsers() {
        delegate?.setUsers(users)
    }
}
