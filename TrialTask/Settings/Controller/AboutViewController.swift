//
//  AboutViewController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/10/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func helloButton(_ sender: CustomButton) {
        textView.backgroundColor = .yellow
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
