//
//  UsersListPresenter.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 6/4/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation

protocol UsersListPresenterDelegate: class {
    func setUsers(_ users: [User])
}

class UsersListPresenter {
    weak var delegate: UsersListPresenterDelegate?
    
    init(delegate: UsersListPresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetchUsers() {
        delegate?.setUsers(users)
    }
    
    
}
