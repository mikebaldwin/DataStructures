//
//  LinkedListTests.swift
//  DataStructuresTests
//
//  Created by Mike Baldwin on 7/30/22.
//

import XCTest
@testable import DataStructures

class LinkedListTests: XCTestCase {

    func testAppendValuesToList() {
        var list = LinkedList<Int>()
        list.append(5)
        XCTAssertEqual(list.count, 1)
    }
    
    func testPopFromEmptyList() {
        var list = LinkedList<Int>()
        list.pop()
        XCTAssertEqual(list.count, 0)
    }
    
    func testPopFromListWithOneValue() {
        var list = LinkedList<Int>()
        list.append(5)
        list.pop()
        XCTAssertEqual(list.count, 0)
    }
    
    func testPopFromListWithTwoValues() {
        var list = LinkedList<Int>()
        list.append(5)
        list.append(6)
        list.pop()
        XCTAssertEqual(list.count, 1)
    }
    
    func testPopFromListWithThreeValues() {
        var list = LinkedList<Int>()
        list.append(5)
        list.append(6)
        list.append(10)
        list.pop()
        XCTAssertEqual(list.count, 2)
    }
    
    func testPopFromListWithFourValues() {
        var list = LinkedList<Int>()
        list.append(5)
        list.append(6)
        list.append(10)
        list.append(8)
        list.pop()
        XCTAssertEqual(list.count, 3)
    }
}
