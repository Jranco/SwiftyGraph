//
//  GraphWeighted.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public class GraphWeighted: GraphBase, GraphWeightedProtocol
{
    public func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, weight: Weight<Any>)
    {
        addEdge(verticeA: verticeA, verticeB: verticeB, direction: self.direction, weight: weight)
    }
}
