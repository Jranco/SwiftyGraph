//
//  GraphWeightedProtocol.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

protocol GraphWeightedProtocol: GraphProtocol
{
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, weight: Weight<Any>)
}

extension GraphWeightedProtocol
{
    public func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, weight: Weight<Any>)
    {
        addEdge(verticeA: verticeA, verticeB: verticeB, direction: self.direction, weight: weight)
    }
}
