//
//  Compatible.swift
//  DailyLeetCode
//
//  Created by ZhiWei Cao on 2021/6/21.
//

import Foundation

public protocol DailyLeetCodeCompatible {
   
    var test1: TestEasy1Wrapper? { get }
    
    var test6: TestMedium6Wrapper? { get }
    
    var test7: TestEasy7Wrapper? { get }
    
    var test9: TestEasy9Wrapper? { get }
    
    var test13: TestEasy13Wrapper? { get }
    
    var test14: TestEasy14Wrapper { get }
    
    var test20: TestEasy20Wrapper { get }
}
