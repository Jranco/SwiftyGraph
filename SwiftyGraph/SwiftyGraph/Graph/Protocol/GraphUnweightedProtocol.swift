//
//  GraphUnweightedProtocol.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public protocol GraphUnweightedProtocol
{
    associatedtype VerticeType: Hashable, Comparable

    func addEdge(verticeA: VerticeType, verticeB: VerticeType)
}

