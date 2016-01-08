//
//  acess.swift
//  osxcmd
//
//  Created by 凌佳 on 15/11/22.
//  Copyright © 2015年 凌佳. All rights reserved.
//

import Foundation

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}

public struct TrackedString2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    
    public init() {}
}






































