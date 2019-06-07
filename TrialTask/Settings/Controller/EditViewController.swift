//
//  EditViewController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/9/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var visualEffectContentView: UIView!
    
    @IBOutlet weak var imageContentView: UIView!
    
    let imagePicker = UIImagePickerController()
    
    var user = User(from: UserDefaults.standard)
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.portrait]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        let barButton1 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil)
        let barButton2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        imagePicker.toolbar.items?.append(barButton1)
        imagePicker.toolbar.items?.append(barButton2)
        setupUI()
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if nameTxtField.text!.isEmpty {
            nameTxtField.shakeAnimation()
            return
        }
        
        if emailTxtField.text!.isEmpty {
            emailTxtField.shakeAnimation()
            return
        }
    
        user?.name = nameTxtField.text!
        user?.email = emailTxtField.text!
        user?.image = userImage.image
        user?.save()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func setupUI() {
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.borderWidth = 2
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.masksToBounds = true
        
        imageContentView.layer.cornerRadius = userImage.layer.cornerRadius
        
        imageContentView.clipsToBounds = true
        
        if let image = user?.image {
            userImage.image = image
        }
        nameTxtField.text = user?.name
        emailTxtField.text = user?.email
    }
}

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.contentMode = .scaleAspectFit
            userImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
