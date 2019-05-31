//
//  SignUpController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/7/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    @IBOutlet weak var userNameTxtField: UITextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var passwordConfirmationTxtField: UITextField!
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        do {
            try isInformationValid()
        } catch {
            handleError(error as! SignUpError)
            return
        }
        
        let user = User(name: userNameTxtField.text!, email: emailTxtField.text!, image: nil, password: passwordTxtField.text!)
        
        user.save()
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "isLoggedIn")
        
        let coreDataStack = CoreDataStack(modelName: "TrialTask")
        coreDataStack.loadData()
        
        let vc = CustomTabBarControlelr()
        present(vc, animated: true, completion: nil)
    }
    
    private func isInformationValid() throws {
        if userNameTxtField.text!.isEmpty {
            throw SignUpError.userNameIsEmpty
        }
        
        if emailTxtField.text!.isEmpty {
            throw SignUpError.emailIsEmpty
        }
        
        if passwordTxtField.text!.isEmpty {
            throw SignUpError.passwordIsNotEntered
        }
        
        if passwordConfirmationTxtField.text! != passwordTxtField.text! {
            throw SignUpError.confirmationFailed
        }
    }
   
    private func handleError(_ error: SignUpError) {
        switch error {
        case .userNameIsEmpty:
            userNameTxtField.shakeAnimation()
        case .emailIsEmpty:
            emailTxtField.shakeAnimation()
        case .passwordIsNotEntered:
            passwordTxtField.shakeAnimation()
        case .confirmationFailed:
            passwordConfirmationTxtField.shakeAnimation()
        }
    }
    
    @IBAction func unwindToLogIn(_ sender: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SignUpController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == userNameTxtField {
            emailTxtField.becomeFirstResponder()
        } else if textField == emailTxtField {
            passwordTxtField.becomeFirstResponder()
        } else if textField == passwordTxtField {
            passwordConfirmationTxtField.becomeFirstResponder()
        }
        return true
    }
}

enum SignUpError: Error {
    case userNameIsEmpty
    case emailIsEmpty
    case passwordIsNotEntered
    case confirmationFailed
}
