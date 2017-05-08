//
//  GraphUnweighted.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

//public class GraphBase<VerticeType>: GraphProtocol where VerticeType: Hashable, VerticeType: Comparable

public class GraphUnweighted<VerticeType>: GraphBase<VerticeType>, GraphUnweightedProtocol where VerticeType: Hashable, VerticeType: Comparable
{
    public func addEdge(verticeA: VerticeType, verticeB: VerticeType)
    {
        addEdge(verticeA: verticeA, verticeB: verticeB, direction: self.direction)
    }
}
