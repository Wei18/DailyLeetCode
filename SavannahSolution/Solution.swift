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
    
    public var test6: TestMedium6Wrapper? { Test6() }
    
    public var test7: TestEasy7Wrapper? { Test7() }
    
    public var test9: TestEasy9Wrapper? { Test9() }
    
    public var test14: TestEasy14Wrapper? { Test14() }
    
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

struct Test6: TestMedium6Wrapper {
    // MARK: (success)
    ///example: "PAYPALISHIRING", numRows = 3
    ///創一個 array.count == numRows 的 array，代表圖形由上[index:0]到下[index:numRows-1]的每排字串
    ///用迴圈跑 s 裡的每個 character，以 ZigZag 跑法順序對照圖形 Array index 為：
    ///[0] -> [1] -> [2] -> [1] -> [0] -> [1] .... 直到最後一個 character
    ///可以發現 index == 0 時，下一個 index 要 +1
    ///而 index == numRows-1 時要 -1
    ///將 character 以此規律放入 array 後，再組成 String 傳出去
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var outputArray = Array(repeating: "", count: numRows)
        var currentIndex = 0
        var nextIndexshouldPlusOne: Bool = true
        
        for character in s {
            outputArray[currentIndex] = "\(outputArray[currentIndex])\(character)"
            
            if nextIndexshouldPlusOne {
                currentIndex += 1
            } else {
                currentIndex -= 1
            }
            
            if currentIndex == 0 || currentIndex == numRows - 1 {
                nextIndexshouldPlusOne = !nextIndexshouldPlusOne
            }
        }
        return outputArray.joined()
    }
}

struct Test7: TestEasy7Wrapper {
    // MARK: (success)
    ///example: 123
    ///從尾數開始處理。取 input 最後一個數字存入變數一：數字除十的餘數(3)
    ///input 扣掉尾數後存入變數二：除十的值(12)
    ///取 input 最後一個數：除十的餘數(2)，要讓此排列於 3 右邊，因此 3(變數一)*10 並相加
    ///input 扣掉尾數後存入變數二：除十的值(1)
    ///取 input 最後一個數：除十的餘數(1)，要讓此排列於 32 右邊，因此 32(變數一)*10 並相加
    ///利用 input>0(處理到最後一個數字) 此條件去限制是否繼續迴圈
    func reverse(_ x: Int) -> Int {
        var input: Int = x
        var result: Int = 0
        
        if input == 0  {
            return 0
        }
        
        while (input != 0) {
            result = result * 10 + input % 10
            input = input / 10
        }
        
        if result > Int32.max || result < Int32.min {
            return 0
        } else {
            return result
        }
        
    }
}

struct Test9: TestEasy9Wrapper {
    
    // MARK: Solution 1(success)
    ///先處理 x 範圍，並轉成 String 就不用處理負號
    ///走一個 x 迴圈，反向存入新的 property
    ///去比較其與 x 是否相同
    ///Runtime = 64 ms
    func isPalindromeOrNot(_ x: Int) -> Bool {
        if x < Int32.min || x > Int32.max {
            return false
        }
        
        let string = String(x)
        var reverseString = ""
        
        //可以直接使用 string.reversed()
        for character in string {
            reverseString = "\(character)\(reverseString)"
        }
        if reverseString == string {
            return true
        } else {
            return false
        }
    }
    
    // MARK: Solution 2(success)
    ///利用與 test7 相同的想法，用數字去處理
    ///Runtime = 40 ms
    func isPalindrome(_ x: Int) -> Bool {
        if x < Int32.min || x > Int32.max || x < 0 {
            return false
        }
        var input: Int = x
        var result: Int = 0
        
        while (input != 0) {
            result = result * 10 + input % 10
            input /= 10
        }
        return result == x
    }
}

struct Test14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
    }
}
