//
//  WeiSolutionTests.swift
//  WeiSolutionTests
//
//  Created by ZhiWei Cao on 2021/6/21.
//

import XCTest
@testable import WeiSolution

class WeiSolutionTests: XCTestCase {

    func test1() throws {
        guard let test = Solution().test1 else {
            assertionFailure("not found the property in \(#function)")
            return
        }
        self.measure {
            let result = test.twoSum([2,7,11,15], 9)
            XCTAssert(result == [0,1])
        }
    }
    
    func test6() throws {
        guard let test = Solution().test6 else {
            assertionFailure("not found the property in \(#function)")
            return
        }
        self.measure {
            let result = test.convert("PAYPALISHIRING", 3)
            XCTAssert(result == "PAHNAPLSIIGYIR")
        }
    }

}
