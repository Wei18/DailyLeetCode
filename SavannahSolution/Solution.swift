//
//  Solution.swift
//  SavannahSolution
//
//  Created by ZhiWei Cao on 2021/6/21.
//

import Foundation
import DailyLeetCode

public struct Solution: DailyLeetCodeCompatible {
    
    public init() {}
    
    public var test1: TestEasy1Wrapper? { Test1() }
    
}

struct Test1: TestEasy1Wrapper {
    
    // MARK: Solution 2(success)
    ///example: [1, 2, 3, 4, 5], target is 9
    ///第一次 for loop 找到 1，需要往下找到 8，如果有找到，就 return 兩者的 index
    ///沒找到，將 1 和其 index 存起來，接下來走第二次 for loop
    ///找到 2，需要往下找到 7 ，以此類推
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for i in 0 ..< nums.count {
            let number = target - nums[i]
            if let j = dict[number], j != i {
                return [j,i]
            } else {
                dict[nums[i]] = i
            }
        }
        return []
    }
    
}
