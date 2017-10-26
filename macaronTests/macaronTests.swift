//
//  macaronTests.swift
//  macaronTests
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import XCTest
@testable import macaron

class macaronTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCustomOperator() {
        let data = TextCellData(text: "hoge") <! {
            $0.text = "fuga"
        }
        XCTAssertEqual(data.text, "fuga")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
