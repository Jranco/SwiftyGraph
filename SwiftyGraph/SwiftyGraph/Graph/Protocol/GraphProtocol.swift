//
//  Graph.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

protocol GraphProtocol: class
{
    var adjDictionary: [String: [String:EdgeProtocol]] {set get}
    var vertices: [String: VerticeProtocol] {set get}
    var direction: DirectionType {set get}
    
    init(direction: DirectionType)
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType, weight: Weight<Any>)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, edge: Edge)
    func addVertice(vertice: VerticeProtocol)
}

extension GraphProtocol
{
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType, weight: Weight<Any>)
    {
        let edge = Edge.weighted(direction, weight)
        
        addEdge(origin: origin, destination: destination, edge: edge)
        
        if(direction == .undirected && adjDictionary[destination.identifier!]?[origin.identifier!] == nil)
        {
            addEdge(origin: destination, destination: origin, direction: direction, weight: weight)
        }
    }
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType)
    {
        let edge = Edge.unweighted(direction)
        
        addEdge(origin: origin, destination: destination, edge: edge)
        
        if(direction == .undirected && adjDictionary[destination.identifier!]?[origin.identifier!] == nil)
        {
            addEdge(origin: destination, destination: origin, direction: direction)
        }
    }
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, edge: Edge)
    {
        // Add edge
        var nearbyDictionary: [String: EdgeProtocol] = [:]
        
        if(adjDictionary[origin.identifier!] != nil)
        {
            nearbyDictionary = adjDictionary[origin.identifier!]!
            
        }
        
        nearbyDictionary[destination.identifier!]  = edge
        adjDictionary[origin.identifier!]          = nearbyDictionary
        
        // Add vertice
        self.addVertice(vertice: origin)
        self.addVertice(vertice: destination)
        
    }
    
    func addVertice(vertice: VerticeProtocol)
    {
        vertices[vertice.identifier!] = vertice
    }

}

