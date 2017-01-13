//
//  GraphUnweightedProtocol.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

protocol GraphUnweightedProtocol: GraphProtocol
{
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol)
}

extension GraphUnweightedProtocol
{
    public func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol)
    {
        addEdge(verticeA: verticeA, verticeB: verticeB, direction: self.direction)
    }
}
