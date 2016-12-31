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
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType, weight: Weight)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, edge: Edge)
    func addVertice(vertice: VerticeProtocol)
}

extension GraphProtocol
{
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType, weight: Weight)
    {
        let edge = Edge.weighted(direction, weight)
        
        addEdge(origin: origin, destination: destination, edge: edge)
        
        if(direction == .undirected && adjDictionary[destination.vId!]?[origin.vId!] == nil)
        {
            addEdge(origin: destination, destination: origin, direction: direction, weight: weight)
        }
    }
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType)
    {
        let edge = Edge.unweighted(direction)
        
        addEdge(origin: origin, destination: destination, edge: edge)
        
        if(direction == .undirected && adjDictionary[destination.vId!]?[origin.vId!] == nil)
        {
            addEdge(origin: destination, destination: origin, direction: direction)
        }
    }
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, edge: Edge)
    {
        // Add edge
        var nearbyDictionary: [String: EdgeProtocol] = [:]
        
        if(adjDictionary[origin.vId!] != nil)
        {
            nearbyDictionary = adjDictionary[origin.vId!]!
            
        }
        
        nearbyDictionary[destination.vId!]  = edge
        adjDictionary[origin.vId!]          = nearbyDictionary
        
        // Add vertice
        self.addVertice(vertice: origin)
        self.addVertice(vertice: destination)
        
    }
    
    func addVertice(vertice: VerticeProtocol)
    {
        vertices[vertice.vId!] = vertice
    }

}

