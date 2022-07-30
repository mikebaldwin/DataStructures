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
    
    public func contains(_ value: T) -> Bool {
        for v in self where v == value {
            return true
        }
        return false
    }

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
