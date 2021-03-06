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
    public var test20: TestEasy20Wrapper? { Test20() }
    public var test21: TestEasy21Wrapper? { Test21() }
    public var test35: TestEasy35Wrapper? { Test35() }
    
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

struct Test20: TestEasy20Wrapper {

    // Runtime: 4 ms, faster than 90.27% of Swift online submissions for Valid Parentheses.
    // Memory Usage: 14.6 MB, less than 35.04% of Swift online submissions for Valid Parentheses.
    /// Loop s and handle each element char.
    /// if char belong to the part of left, added in stack
    /// if char belong to the part of right, compare with item from stack
    /// return false when no comparable
    /// or loop to end and return true.
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for char in s {
            switch char {
            case "(", "{", "[":
                stack.append(char)
            case ")":
                if stack.popLast() != "(" {
                    return false
                }
            case "}":
                if stack.popLast() != "{" {
                    return false
                }
            case "]":
                if stack.popLast() != "[" {
                    return false
                }
            default:
                break
            }
        }
        return stack.isEmpty
    }

}

struct Test21: TestEasy21Wrapper {
    
    /// Use recursion function, pass the next listnode,
    /// And after all, will get the merged list.
    /// If `l1.value < l2.value`, store node l1,
    /// and then pass node of l1.next and nod2 l2 into recursion method.
    /// and return head that is compatible node in this postion.
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        var head: ListNode
        if l1.val < l2.val {
            head = l1
            head.next = mergeTwoLists(head.next, l2)
        }else{
            head = l2
            head.next = mergeTwoLists(head.next, l1)
        }
        return head
        
    }
    
}

struct Test35: TestEasy35Wrapper {
    
    // Runtime: 28 ms, faster than 90.86% of Swift online submissions for Search Insert Position.
    // Memory Usage: 14.4 MB, less than 34.41% of Swift online submissions for Search Insert Position.
    /// nums contains distinct values sorted in ascending order.
    /// so use binary search
    /// and If not found, return the index where it would be if it were inserted in order.
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = nums.startIndex
        var r = nums.endIndex-1
        
        while l <= r {
            let m = (l + r) >> 1
            if nums[m] == target {
                return m
            } else if nums[m] < target {
                l = m + 1
            } else {
                r = m - 1
            }
        }
        
        // in the meantime, l == r == m, nums[m] < target,
        // index l would be m + 1 and then while loop is break.
        return l
        
    }
    
    
}
