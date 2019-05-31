//
//  AppDelegate.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/4/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let directory = NSPersistentContainer.defaultDirectoryURL()
        let url = directory.appendingPathComponent("CalorieCOunter" + ".sqlite")
        print(url)
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            print(granted)
        }
        
        UIApplication.shared.registerForRemoteNotifications()

        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "isLoggedIn") {
            window?.rootViewController = CustomTabBarControlelr()
        } else {
            let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()!
            window?.rootViewController = loginVC
        }

        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Device token\(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for push notifications: \(error.localizedDescription)")
    }
    
    private func parseRemoteNotification(_ notification: [String: AnyObject]) -> String? {
        if let aps = notification["aps"] as? [String: AnyObject] {
            let alert = aps["alert"] as? String
            return alert
        }
        return nil
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let text = notification.request.content.body
        let userName = notification.request.content.title
        
        let coreDataStack = CoreDataStack(modelName: "TrialTask")
        
        let user = User(from: UserData.userWithName(userName, in: coreDataStack.managedContext)!)
        
        let message = Message(text: text, sender: user, recevier: User.currentUser!, date: Date())
        
        MessageData.saveMessage(message, in: coreDataStack.managedContext)
        
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        completionHandler()
    }
}
