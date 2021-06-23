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
    
struct Test7: TestEasy7Wrapper {
    
    func reverse(_ x: Int) -> Int {
        var input: Int = x
        var result: Int = 0
        
        if input == 0 || input > Int32.max || input < Int32.min {
            return 0
        }
        
        while (input != 0) {
            result = result * 10 + input % 10
            input = input / 10
        }
        
        
        return result
    }
    
}
