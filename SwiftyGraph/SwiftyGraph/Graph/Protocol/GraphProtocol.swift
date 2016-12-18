//
//  Graph.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

protocol GraphProtocol
{
    var adjDictionary: [String: [String:EdgeProtocol]] {get}
    var vertices: [String: VerticeProtocol] {get}
    var direction: Direction {set get}
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: Direction, weight: Weight)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: Direction)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, edge: Edge)
    func addVertice(vertice: VerticeProtocol)
}


protocol GraphWeightedProtocol: GraphProtocol
{
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, weight: Weight)
}

extension GraphWeightedProtocol
{
    public func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, weight: Weight)
    {
        addEdge(origin: origin, destination: destination, direction: self.direction, weight: weight)
    }
}

protocol GraphUnweightedProtocol: GraphProtocol
{
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol)
}

extension GraphUnweightedProtocol
{
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol)
    {
        addEdge(origin: origin, destination: destination, direction: self.direction)
    }
}
