//
//  Solution.swift
//  WeiSolution
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
    
    /// Use one for-loop and start at fisrt iterator,
    /// If exist key as target minus currentValue in indexDict,
    /// that both currentIndex and indexDict[Key] are the anwser.
    /// otherwise, store the currentValue as Key and currentIndex as Value.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        var indexDict: [Int: Int] = [:]
        nums.enumerated().forEach { (index, value) in
            if let found = indexDict[target-value] {
                result.append(found)
                result.append(index)
                return
            } else {
                indexDict[value] = index
            }
        }
        return result
    }
    
}


