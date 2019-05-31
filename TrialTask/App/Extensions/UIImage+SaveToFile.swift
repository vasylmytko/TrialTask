//
//  UIImage+SaveToFile.swift
//  TrialTask
//
//  Created by Vasyl Mytko on 10/9/18.
//  Copyright © 2018 Vasyl Mytko. All rights reserved.
//

import UIKit

extension UIImage {
    func saveToFile(path: String) {
        func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
        
        if let data = self.pngData() {
            let filename = getDocumentsDirectory().appendingPathComponent(path)
            try? data.write(to: filename)
        }
    }
    
    convenience init?(from path: String) {
        func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
        let fileName = getDocumentsDirectory().appendingPathComponent(path)
        self.init(from: fileName)
    }
}
