//
//  Defaults.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 6/12/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import Foundation

class Defaults {
    
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    subscript(key: String) -> String? {
        get {
            return defaults.string(forKey: key)
        }
        
        set {
            defaults.set(newValue, forKey: key)
        }
    }
}
