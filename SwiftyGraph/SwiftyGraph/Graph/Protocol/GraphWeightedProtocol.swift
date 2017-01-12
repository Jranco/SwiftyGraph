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
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, weight: Weight<Any>)
}

extension GraphWeightedProtocol
{
    public func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, weight: Weight<Any>)
    {
        addEdge(origin: origin, destination: destination, direction: self.direction, weight: weight)
    }
}
