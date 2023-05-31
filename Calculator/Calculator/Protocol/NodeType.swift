//
//  NodeType.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

protocol NodeType {
    associatedtype T
    func fetchData()
    mutating func fetchNext()
    mutating func updateNext(_ next: Node<T>?)
}
