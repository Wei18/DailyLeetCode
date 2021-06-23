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
    public var test6: TestMedium6Wrapper? { Test6() }
    public var test7: TestEasy7Wrapper? { Test7() }
    
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

struct Test6: TestMedium6Wrapper {
    
    /// Create array of string with count as `numRows`
    /// Use for-loop for parameter `s`, and store each element into array
    /// with index from `0` to `numRows-1` and then  from `numRows-1` to `0`
    /// til store last element.
    /// So if `index == 0` that mean next index plus 1
    /// else if `index == numRows-1` that mean next index minus 1
    /// and use flag `isIncreasable` to keey current
    func convert(_ s: String, _ numRows: Int) -> String {
        // Edge conditions
        guard numRows > 1 else { return s }
        
        var result = Array(repeating: "", count: numRows)
        var index = 0
        var isIncreasable = true
        for char in s {
            
            result[index] = "\(result[index])\(char)"
            
            if isIncreasable {
                index += 1
            } else {
                index -= 1
            }
            
            if index == 0 || index == numRows - 1 {
                isIncreasable.toggle()
            }
        }
        
        return result.joined()
    }

}

struct Test7: TestEasy7Wrapper {
    
    /// Use the flag to store the nagetive symbol and make x as positive
    /// Use 2 parameters to store both result and currentX,
    /// loop calculattion when currentX > 10
    /// result = result *10 + newValue (newValue as currentX mod 10)
    /// currentX = currentX / 10
    ///
    ///  Success:
    /// - Runtime: 4 ms, faster than 88.99% of Swift online submissions for Reverse Integer.
    /// - Memory Usage: 13.8 MB, less than 85.40% of Swift online submissions for Reverse Integer.
    func reverse(_ x: Int) -> Int {
        let symbolInteger = (x > 0) ? 1 : -1
        var result = 0
        var current = x * symbolInteger
        while current > 0 {
            result = result * 10 + current % 10
            current = current / 10
        }
        result = result * symbolInteger
        guard result <= Int32.max, result >= Int32.min else { return 0 }
        return result
    }
    
}
