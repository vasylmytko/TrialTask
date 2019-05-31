//
//  LoginController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/4/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var logInContentView: UIView!
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        do {
            try validateUser()
        } catch {
            passwordTxtField.shakeAnimation()
            emailTxtField.shakeAnimation()
            return
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "isLoggedIn")
        let tabBarController = CustomTabBarControlelr()
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        emailTxtField.cornerRadius = 10
        passwordTxtField.cornerRadius = 10
        emailTxtField.layer.borderColor = UIColor.white.cgColor
        emailTxtField.layer.borderWidth = 1
        passwordTxtField.layer.borderColor = UIColor.white.cgColor
        passwordTxtField.layer.borderWidth = 1
        logInContentView.layer.borderWidth = 1
        logInContentView.layer.borderColor = UIColor.white.cgColor
        logInContentView.cornerRadius = 10
    }
    
    func validateUser() throws {
        let userDefaults = UserDefaults.standard
        if let email = userDefaults.string(forKey: "userEmail") {
            if email != emailTxtField.text! {
                throw LogInError.incorrectEmail
            }
        }
        
        if let password = userDefaults.string(forKey: "userPassword") {
            if password != passwordTxtField.text! {
                throw LogInError.icorrectPassword
            }
        }
    }
    
//    func fetchUser(_ completion: @escaping (User) -> ()) {
//        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
//        GraphRequest(graphPath: "me", parameters: parameters).start { (connection, result, error) in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//            
//            guard let dict = result as? [String: Any] else {
//                return
//            }
//            
//            guard let email = dict["email"] as? String else {
//                return
//            }
//            
//            guard let picture = dict["picture"] as? [String: Any],
//                let data = picture["data"] as? [String: Any],
//                let url = data["url"] as? String else {
//                    return
//            }
//            
//            guard let firstName = dict["first_name"] as? String,
//                let lastName = dict["last_name"] as? String else {
//                    return
//            }
//            
//            let userImage = UIImage(from: URL(string: url)!)!
//            
//            let user = User(name: (firstName + " " + lastName), email: email, image: userImage, password: "")
//            completion(user)
//        }
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//extension LoginController: LoginButtonDelegate {
//    func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
//
//        if result.isCancelled {
//            return
//        }
//
//        fetchUser { fetchedUser in
//            let userDefaults = UserDefaults.standard
//
//            let coreDataStack = CoreDataStack(modelName: "TrialTask")
//
//            if let user = User(from: userDefaults) {
//                if user.name != fetchedUser.name {
//                    fetchedUser.save()
//                    coreDataStack.loadData()
//                }
//            } else {
//                fetchedUser.save()
//                coreDataStack.loadData()
//            }
//
//            userDefaults.set(true, forKey: "isLoggedIn")
//
//            DispatchQueue.main.async {
//                let tabBarController = CustomTabBarControlelr()
//                self.present(tabBarController, animated: true, completion: nil)
//            }
//        }
//    }
//
//    func loginButtonDidLogOut(_ loginButton: FBLoginButton!) {
//
//    }
//}

enum LogInError: Error {
    case incorrectEmail
    case icorrectPassword
}
