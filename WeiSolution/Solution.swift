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
    
    // MARK: Easy
    public var test1: TestEasy1Wrapper? { Test1() }
    public var test7: TestEasy7Wrapper? { Test7() }
    public var test9: TestEasy9Wrapper? { Test9() }
    public var test13: TestEasy13Wrapper? { Test13() }
    public var test14: TestEasy14Wrapper? { Test14() }
    
    // MARK: Medium
    public var test6: TestMedium6Wrapper? { Test6() }
    
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

struct Test9: TestEasy9Wrapper {
    
    // Use binary search to loop startIndex and endIndex.
    // Detect both elements, until startIndex >= endIndex
    func isPalindrome(_ x: Int) -> Bool {
        
        guard x < 0 else { return false }
        var x = x
        var digits: [Int] = []
        
        while x > 0 {
            digits.append(x % 10)
            x = x / 10
        }
        
        var lIndex = digits.startIndex
        var rIndex = digits.endIndex
        
        while lIndex < rIndex {
            if digits[lIndex] != digits[rIndex] {
                return false
            } else {
                lIndex += 1
                rIndex -= 1
            }
        }
        
        return true
        
    }
    
}

struct Test13: TestEasy13Wrapper {
    
    /// Input: s = "III"
    /// Input: s = "IV"
    /// Input: s = "IX"
    /// Input: s = "LVIII"
    /// Input: s = "MCMXCIV"
    /// Make a property result with type integer as 0,
    /// Loop s string and each char, if currentChar > nextChar, result = result minus value of currentChar
    /// Else result equal to result plus value of currentChar.
    // Runtime: 24 ms, faster than 80.79% of Swift online submissions for Roman to Integer.
    // Memory Usage: 14.7 MB, less than 26.77% of Swift online submissions for Roman to Integer.
    func romanToInt(_ s: String) -> Int {
        var result = 0
        let romanValue: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        ]
        for index in s.indices {
            let value = romanValue[s[index]]!
            let nextIndex = s.index(after: index)
            if nextIndex < s.endIndex {
                let nextValue = romanValue[s[nextIndex]]!
                if value >= nextValue {
                    result = result + value
                } else {
                    result = result - value
                }
            } else {
                result = result + value
            }
        }
        return result
        
    }
    
}

struct Test14: TestEasy14Wrapper {
    
    /// Get the element form strs store into property result,
    /// And then loop strs, each element in strs will compare with property result for longestCommonPrefix,
    /// If not, the property result will drop last char, until we find longestCommonPrefix,
    /// and then loop next element
    /// Runtime: 8 ms, faster than 98.52% of Swift online submissions for Longest Common Prefix.
    /// Memory Usage: 14.4 MB, less than 54.17% of Swift online submissions for Longest Common Prefix.
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        guard strs.count > 1, var result = strs.first else { return strs.first! }
        
        for index in 1..<strs.count {
            
            while !strs[index].hasPrefix(result), !result.isEmpty {
                _ = result.popLast()
            }
            
        }
        
        return result
        
    }
    
}
