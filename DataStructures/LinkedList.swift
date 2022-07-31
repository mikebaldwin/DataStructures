//
//  LinkedList.swift
//  
//
//  Created by Mike Baldwin on 7/30/22.
//

import Foundation

public struct LinkedList<T: Equatable> {
    public var first: T? { firstNode?.value }
    
    public var count: Int {
        var count = 0
        for _ in self {
            count += 1
        }
        return count
    }

    private var firstNode: Node<T>?
    
    public init() { }
    
    /// Reports whether the linked list contains the value passed in.
    /// - Parameter value: The value to be checked for membership.
    /// - Returns: True if value exists in linked list; false if not.
    public func contains(_ value: T) -> Bool {
        for v in self where v == value {
            return true
        }
        return false
    }
    
    /// Appends new value to the end of the linked list.
    /// - Parameter value: Value to be appended.
    public mutating func append(_ value: T) {
        guard var node = firstNode else {
            firstNode = Node(value: value)
            return
        }
                
        while node.next != nil {
            node = node.next!
        }
        
        node.next = Node(value: value)
    }
    
    /// Inserts a new value in the linked list after the second supplied value.
    /// - Parameters:
    ///   - value: New value to insert into the linked list.
    ///   - after: The value that should preceed the added value.
    public mutating func insert(_ value: T, after precedingValue: T) {
        
    }
    
    /// Inserts a new value at the beginning of the linked list.
    /// - Parameter value: The new value to be inserted.
    public mutating func prepend(_ value: T) {
        let node = Node(value: value)
        node.next = firstNode
        firstNode = node
    }
    
    /// Removes the value following the value of the supplied parameter. If the `after` value doesn't exist, no value will be removed from the list.
    /// - Parameter value: The value to preceed the value to be removed.
    public mutating func remove(after value: T) {
        guard var targetNode = firstNode else { return }
        
        while targetNode.value != value {
            targetNode = targetNode.next!
        }
        
        if let newNextNode = targetNode.next?.next {
            targetNode.next = nil
            targetNode.next = newNextNode
        } else {
            targetNode.next = nil
        }
    }
    
    /// Removes the first value in the linked list.
    public mutating func removeFirst() {
        if let nextNode = firstNode?.next {
            firstNode = nil
            firstNode = nextNode
        }
    }
    
    /// Removes the last value in the linked list.
    public mutating func pop() {
        guard var penultimateNode = firstNode else { return }
        guard var finalNode = penultimateNode.next else {
            firstNode = nil
            return
        }
        
        while finalNode.next != nil {
            penultimateNode = penultimateNode.next!
            finalNode = finalNode.next!
        }
        
        penultimateNode.next = nil
    }
}

extension LinkedList: Sequence {
    public func makeIterator() -> ListIterator {
        return ListIterator(self)
    }
}

extension LinkedList {
    private class Node<T> {
        var value: T
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
        
    public struct ListIterator: IteratorProtocol {
        private let linkedList: LinkedList
        private var node: Node<T>? = nil

        init(_ linkedList: LinkedList) {
            self.linkedList = linkedList
        }

        public mutating func next() -> T? {
            if node == nil {
                node = linkedList.firstNode
                return node?.value
            }
            guard let nextNode = node?.next else { return nil }
            node = nextNode
            return nextNode.value
        }
    }
}
