//
//  GraphWeighted.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public class GraphWeighted<VerticeType>: GraphBase<VerticeType>, GraphWeightedProtocol where VerticeType: Hashable, VerticeType: Comparable
{
    public func addEdge(verticeA: VerticeType, verticeB: VerticeType, weight: Weight<Any>)
    {
        addEdge(verticeA: verticeA, verticeB: verticeB, direction: self.direction, weight: weight)
    }
}
