//
//  KIFTestActor+tester.swift
//  TrialTaskTests
//
//  Created by Vasyl Mytko on 5/30/19.
//  Copyright © 2019 Vasyl Mytko. All rights reserved.
//

import KIF

extension KIFTestActor {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
