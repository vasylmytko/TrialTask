//
//  NotificationManager.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/10/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject {

    private var timer: Timer!
   
    var bool: Bool = true
    
    private func addNotification(text: String, user: User) {
        let content = UNMutableNotificationContent()
        content.title = user.name
        content.body = text
        content.sound = UNNotificationSound.default
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "messageNotification", content: content, trigger: triger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    func postNotification() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
            let message = self.bool ? "Hello" : "How are you"
            let user = self.bool ? user1 : user3
            self.addNotification(text: message, user: user)
            self.bool.toggle()
        })
    }
    
    func stopNotification() {
        timer.invalidate()
    }
}

