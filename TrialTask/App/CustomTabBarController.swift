//
//  CustomTabBarController.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/9/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

class CustomTabBarControlelr: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIStoryboard(name: "Chats", bundle: nil).instantiateInitialViewController()! as! UISplitViewController
        
        let leftNavBar = vc1.viewControllers.first as! UINavigationController
        
        let masterVC = leftNavBar.topViewController as! UsersListController
        
        let rightNav = vc1.viewControllers.last as! UINavigationController
        
        let detailVC = rightNav.topViewController as! ChatController
        
        detailVC.navigationItem.leftItemsSupplementBackButton = true
        detailVC.navigationItem.leftBarButtonItem = vc1.displayModeButtonItem
        
        masterVC.delegate = detailVC
        
        let firstUser = users.first
        
        detailVC.selectedUser = firstUser
        
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        
        let vc2 = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController()!
        
        vc1.tabBarItem.title = "Chats"
        vc1.tabBarItem.image = UIImage(named: "chats")
        vc2.tabBarItem.title = "Settings"
        vc2.tabBarItem.image = UIImage(named: "settings")
        viewControllers = [vc1, vc2]
    }
    
}
