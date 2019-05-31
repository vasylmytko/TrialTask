//
//  User.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/4/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var email: String
    var image: UIImage?
    var password: String?
   
    init(name: String, email: String, image: UIImage?, password: String?) {
        self.name = name
        self.image = image
        self.email = email
        self.password = password
    }
    
    init?(from userDefaults: UserDefaults) {
        guard let userName = userDefaults.string(forKey: "userName"),
            let userEmail = userDefaults.string(forKey: "userEmail") else {
                return nil
        }
        name = userName
        email = userEmail
        password = userDefaults.string(forKey: "userPassword") ?? ""
        guard let imageData = userDefaults.object(forKey: "userImage") as? Data else {
            return 
        }
        image = UIImage(data: imageData)
    }
    
    init(from userData: UserData) {
        name = userData.name!
        email = userData.email!
        if let imageData = userData.image {
            image = UIImage(data: imageData as Data)
        }
        password = userData.password
    }
    
    static let currentUser: User? = {
        let userDefaults = UserDefaults.standard
        return User(from: userDefaults)
    }()
    
    func save() {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(self.name, forKey: "userName")
        userDefaults.set(self.email, forKey: "userEmail")
        userDefaults.set(self.password ?? "", forKey: "userPassword")
        guard let userImage = image else {
            return
        }
        let imageData = userImage.pngData()
        userDefaults.set(imageData, forKey: "userImage")
    }
}

