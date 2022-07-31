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
    
    func testPrependValueToLinkedList() {
        var list = LinkedList<Int>()
        list.append(5)
        list.prepend(2)
        XCTAssertEqual(list.first, 2)
    }
    
    func testRemoveFirstValue() {
        var list = LinkedList<Int>()
        list.append(5)
        list.append(6)
        list.append(10)
        list.removeFirst()
        XCTAssertEqual(list.first, 6)
    }
    
    func testRemoveAfter() {
        var list = LinkedList<Int>()
        
        list.append(5)
        list.append(6)
        list.append(10)
        list.append(8)
        list.remove(after: 6)
        
        var values = [Int]()
        
        for value in list {
            values.append(value)
        }
        
        XCTAssertEqual(values[0], 5)
        XCTAssertEqual(values[1], 6)
        XCTAssertEqual(values[2], 8)
    }
    
    func testRemoveAfterWithLastValue() {
        var list = LinkedList<Int>()
        
        list.append(5)
        list.append(6)
        list.append(10)
        list.append(8)
        list.remove(after: 8)
        
        var values = [Int]()
        
        for value in list {
            values.append(value)
        }
        
        XCTAssertEqual(values[0], 5)
        XCTAssertEqual(values[1], 6)
        XCTAssertEqual(values[2], 10)
        XCTAssertEqual(values[3], 8)
    }
    
    func testRemoveAfterNoMatch() {
        var list = LinkedList<Int>()
        
        list.append(5)
        list.append(6)
        list.append(10)
        list.append(8)
        list.remove(after: 2)
        
        var values = [Int]()
        
        for value in list {
            values.append(value)
        }
        
        XCTAssertEqual(values[0], 5)
        XCTAssertEqual(values[1], 6)
        XCTAssertEqual(values[2], 10)
        XCTAssertEqual(values[3], 8)
    }
    
    func testInsertAfter() {
        var list = LinkedList<Int>()
        
        list.append(5)
        list.append(6)
        list.append(8)
        list.insert(10, after: 6)
        
        var values = [Int]()
        
        for value in list {
            values.append(value)
        }
        
        XCTAssertEqual(values[0], 5)
        XCTAssertEqual(values[1], 6)
        XCTAssertEqual(values[2], 10)
        XCTAssertEqual(values[3], 8)
    }
    
    func testInsertAfterFinalValue() {
        var list = LinkedList<Int>()
        
        list.append(5)
        list.append(6)
        list.append(8)
        list.insert(10, after: 8)
        
        var values = [Int]()
        
        for value in list {
            values.append(value)
        }
        
        XCTAssertEqual(values[0], 5)
        XCTAssertEqual(values[1], 6)
        XCTAssertEqual(values[2], 8)
        XCTAssertEqual(values[3], 10)
    }
    
    func testInsertAfterNoMatch() {
        var list = LinkedList<Int>()
        
        list.append(5)
        list.append(6)
        list.append(8)
        list.insert(10, after: 2)
        
        var values = [Int]()
        
        for value in list {
            values.append(value)
        }
        
        XCTAssertEqual(values[0], 5)
        XCTAssertEqual(values[1], 6)
        XCTAssertEqual(values[2], 8)
    }


}
