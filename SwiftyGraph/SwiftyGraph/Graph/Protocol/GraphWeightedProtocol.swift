//
//  GraphWeightedProtocol.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public protocol GraphWeightedProtocol
{
    associatedtype VerticeType: Hashable, Comparable

    func addEdge(verticeA: VerticeType, verticeB: VerticeType, weight: Weight<Any>)
}


