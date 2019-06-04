//
//  SettingsController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/6/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    let notificationManager = NotificationManager()
    
    lazy var alertController: UIAlertController = {
       let alert = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Log out", style: .default, handler: { _ in
//            if AccessToken.isCurrentAccessTokenActive {
//                let loginManager = LoginManager()
//                loginManager.logOut()
//            }
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(false, forKey: "isLoggedIn")
            
            self.performSegue(withIdentifier: "LogInVC", sender: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _  in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        return alert
    }()
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        present(alertController, animated: true, completion: nil)
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        
        guard let user = User(from: userDefaults) else {
            return
        }
        
        userNameLabel.text = user.name
        userEmailLabel.text = user.email
        
        guard let image = user.image else {
            return
        }
        
        userImage.image = image
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        userImage.cornerRadius = userImage.frame.height / 2
        userImage.layer.masksToBounds = true
        userImage.layer.borderWidth = 3.0
        userImage.layer.borderColor = UIColor.white.cgColor
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SettingsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath)
        } else if indexPath.row == 1 {
            return tableView.dequeueReusableCell(withIdentifier: "aboutCell", for: indexPath)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationCell
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
    }
}

extension SettingsController: NotificationCellDelegate {
    func simulateNotifications(_ isEnabled: Bool) {
        if isEnabled {
            notificationManager.postNotification()
        } else {
            notificationManager.stopNotification()
        }
    }
}

protocol NotificationCellDelegate: class {
    func simulateNotifications(_ isEnabled: Bool)
}


