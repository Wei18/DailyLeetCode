//
//  237. Delete Node in a Linked List .swift
//  DailyLeetCode
//
//  Created by Savannah Su on 2021/7/7.
//

import Foundation
public protocol TestEasy237Wrapper {
    
    /// 237. Delete Node in a Linked List
    ///
    /// [Reference](https://leetcode.com/problems/delete-node-in-a-linked-list/)
    func deleteNode(_ node: ListNode237?)
    
}

public class ListNode237 {
    public var val: Int
    public var next: ListNode237?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
