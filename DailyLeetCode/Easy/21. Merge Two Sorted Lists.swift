//
//  21. Merge Two Sorted Lists.swift
//  DailyLeetCode
//
//  Created by Savannah Su on 2021/7/5.
//

import Foundation

public protocol TestEasy21Wrapper {
    
    /// 21. Merge Two Sorted Lists
    ///
    /// [Reference](https://leetcode.com/problems/merge-two-sorted-lists/)
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?
    
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
