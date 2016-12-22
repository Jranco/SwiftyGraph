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
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol)
}

extension GraphUnweightedProtocol
{
    public func addEdge(origin: VerticeProtocol, destination: VerticeProtocol)
    {
        addEdge(origin: origin, destination: destination, direction: self.direction)
    }
}
