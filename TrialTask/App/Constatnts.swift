//
//  Constatnts.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/5/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

let user1 = User(name: "user1", email: "user1@gmail.com", image: UIImage(named: "user1"), password: nil)

let user2 = User(name: "user2", email: "user2@gmail.com", image: UIImage(named: "user2"), password: nil)

let user3 = User(name: "user3", email: "user3@gmail.com", image: UIImage(named: "user3"), password: nil)

let user4 = User(name: "user4", email: "user4@gmail.com", image: UIImage(named: "user4"), password: nil)

let user5 = User(name: "user5", email: "user5@gmail.com", image:UIImage(named: "user5"), password: nil)

let user6 = User(name: "user6", email: "user6@gmail.com", image: UIImage(named: "user6"), password: nil)

let user7 = User(name: "user7", email: "user7@gmail.com", image: UIImage(named: "user7"), password: nil)

let user8 = User(name: "user8", email: "user8@gmail.com", image: UIImage(named: "user8"), password: nil)

let user9 = User(name: "user9", email: "user9@gmail.com", image: UIImage(named: "user9"), password: nil)

let user10 = User(name: "user10", email: "user10@gmail.com", image: UIImage(named: "user10"), password: nil)

var dates: [Date] {
    let calendar = Calendar.current
    var datesArray = Array<Date>()
    let startDate = calendar.date(byAdding: .hour, value: -8, to: Date())!
    for _ in 0..<7 {
        datesArray.append(calendar.date(byAdding: .hour, value: 0, to: startDate)!)
    }
    return datesArray
}

var messages: [Message] = [
    Message(text: "Think about what people are doing on Facebook today. They're keeping up with their friends and family, but they're also building an image and identity for themselves, which in a sense is their brand.", sender: user1, recevier: User.currentUser!, date: dates[0]),
    
    Message(text: "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.", sender: user2, recevier: User.currentUser!, date: dates[0]),
    
    Message(text: "A very common task in iOS is to provide auto sizing cells for UICollectionview components.", sender: User.currentUser!, recevier: user1, date: dates[0]),
    
    Message(text: "I’ll be back.", sender: user3, recevier: User.currentUser!, date: dates[0]),
    
    Message(text: "Hello.", sender: user4, recevier: User.currentUser!, date: dates[0]),
    
    Message(text: "Hello. How are you?", sender: User.currentUser!, recevier: user1, date: dates[0]),
    
    Message(text: "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.", sender: user2, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "I’ll be back.", sender: user3, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "Life is like a box a chocolate, you never know what your going to get.", sender: user7, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "Life is like a box a chocolate, you never know what your going to get.", sender: user7, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "Awards are wonderful. I've been nominated many times and I've won many awards. But my journey is not towards that. If it happens it will be a blast. If it doesn't, it's still been a blast.", sender: user6, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "In order to make the cars affordable you really need high volume. So you need economies of scale. And because the other car companies make a lot more cars than we do, they've got way better economies of scale.", sender: user5, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "In order to make the cars affordable you really need high volume. So you need economies of scale. And because the other car companies make a lot more cars than we do, they've got way better economies of scale.", sender: user5, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "In order to make the cars affordable you really need high volume. So you need economies of scale. And because the other car companies make a lot more cars than we do, they've got way better economies of scale.", sender: user5, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.", sender: user2, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.", sender: user2, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "Think about what people are doing on Facebook today. They're keeping up with their friends and family, but they're also building an image and identity for themselves, which in a sense is their brand.", sender: user1, recevier: User.currentUser!, date: dates[1]),
     
    Message(text: "Awards are wonderful. I've been nominated many times and I've won many awards. But my journey is not towards that. If it happens it will be a blast. If it doesn't, it's still been a blast.", sender: user6, recevier: User.currentUser!, date: dates[2]),
     
    Message(text: "Hello.", sender: user4, recevier: User.currentUser!, date: dates[3]),
     
    Message(text: "I’ll be back.", sender: user3, recevier: User.currentUser!, date: dates[1]),
     
    Message(text: "Think about what people are doing on Facebook today. They're keeping up with their friends and family, but they're also building an image and identity for themselves, which in a sense is their brand.", sender: user1, recevier: User.currentUser!, date: dates[2]),
     
    Message(text: "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.", sender: user2, recevier: User.currentUser!, date: dates[4]),
     
    Message(text: "Hello.", sender: user4, recevier: User.currentUser!, date: dates[3]),
     
    Message(text: "I’ll be back.", sender: user3, recevier: User.currentUser!, date: dates[2]),
     
    Message(text: "In order to make the cars affordable you really need high volume. So you need economies of scale. And because the other car companies make a lot more cars than we do, they've got way better economies of scale.", sender: user5, recevier: User.currentUser!, date: dates[6]),
     
    Message(text: "Awards are wonderful. I've been nominated many times and I've won many awards. But my journey is not towards that. If it happens it will be a blast. If it doesn't, it's still been a blast.", sender: user6, recevier: User.currentUser!, date: dates[5]),
     
    Message(text: "Life is like a box a chocolate, you never know what your going to get.", sender: user7, recevier: User.currentUser!, date: dates[5]),
     
    Message(text: "Hello.", sender: user4, recevier: User.currentUser!, date: dates[4]),
     
    Message(text: "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.", sender: user2, recevier: User.currentUser!, date: dates[3]),
     
    Message(text: "Think about what people are doing on Facebook today. They're keeping up with their friends and family, but they're also building an image and identity for themselves, which in a sense is their brand.", sender: user1, recevier: User.currentUser!, date: dates[2]),
     
    Message(text: "Awards are wonderful. I've been nominated many times and I've won many awards. But my journey is not towards that. If it happens it will be a blast. If it doesn't, it's still been a blast.", sender: user6, recevier: User.currentUser!, date: dates[1]),
     
    Message(text: "Life is like a box a chocolate, you never know what your going to get.", sender: user7, recevier: User.currentUser!, date: dates[0]),
     
    Message(text: "In order to make the cars affordable you really need high volume. So you need economies of scale. And because the other car companies make a lot more cars than we do, they've got way better economies of scale.", sender: user5, recevier: User.currentUser!, date: dates[2]),
     
    Message(text: "Hello.", sender: user4, recevier: User.currentUser!, date: dates[4]),
     
    Message(text: "I’ll be back.", sender: user3, recevier: User.currentUser!, date: dates[3])
]
