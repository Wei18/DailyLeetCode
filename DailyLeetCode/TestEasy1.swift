//
//  TestEasy1.swift
//  DailyLeetCode
//
//  Created by ZhiWei Cao on 2021/6/21.
//

import Foundation

public protocol DailyLeetCodeCompatible {
   
    var test1: TestEasy1Wrapper? { get }
    
}

public protocol TestEasy1Wrapper {
    
    /// 1. Two Sum
    ///
    /// [Reference]( https://leetcode.com/problems/two-sum/)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int]
    
}
