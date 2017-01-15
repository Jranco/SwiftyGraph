//
//  GraphUnweighted.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public class GraphUnweighted: GraphBase
{
    
}

extension GraphUnweighted: GraphUnweightedProtocol
{
    public func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol)
    {
        addEdge(verticeA: verticeA, verticeB: verticeB, direction: self.direction)
    }
}
