//
//  UsersListController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/5/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class UsersListController: UIViewController {
    
    weak var delegate: UserSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UsersListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        cell.updateUI(users[indexPath.item])
        return cell
    }
}

extension UsersListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.item]
        delegate?.userSelecter(selectedUser)
        
        if let detailVC = delegate as? ChatController {
            let detailNavigationController = detailVC.navigationController
            splitViewController?.showDetailViewController(detailNavigationController!, sender: nil)
        }
    }
}

extension UsersListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

protocol UserSelectionDelegate: class {
    func userSelecter(_ user: User)
}


