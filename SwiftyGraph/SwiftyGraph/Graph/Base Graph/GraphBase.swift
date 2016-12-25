//
//  GraphBase.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public class GraphBase: GraphProtocol
{
    var adjDictionary: [String: [String:EdgeProtocol]] = [:]
    var vertices: [String: VerticeProtocol] = [:]
    public internal(set) var direction: DirectionType = .directed
    
    required public init(direction: DirectionType)
    {
        self.direction = direction
    }
}

extension GraphBase
{
    public func printGraph()
    {
        for (vId, nearby) in adjDictionary
        {
            print("for vId: \(vId)")
          
            for (vId, edge) in nearby
            {
                print("nearby vId: \(vId)")
                print("nearby edge weight: \(edge.weight?.value)")
            }
            
        }
    }
    
    public func printVertices()
    {
        for vertice in vertices
        {
            print("vertice: id", vertice.key)
        }
    }
}

extension GraphBase
{
    internal func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType, weight: Weight)
    {
        let edge = Edge.weighted(direction, weight)
        
        addEdge(origin: origin, destination: destination, edge: edge)
        
        if(direction == .undirected && adjDictionary[destination.vId!]?[origin.vId!] == nil)
        {
            addEdge(origin: destination, destination: origin, direction: direction, weight: weight)
        }
    }
    
    internal func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType)
    {
        let edge = Edge.unweighted(direction)
        
        addEdge(origin: origin, destination: destination, edge: edge)
        
        if(direction == .undirected && adjDictionary[destination.vId!]?[origin.vId!] == nil)
        {
            addEdge(origin: destination, destination: origin, direction: direction)
        }
    }
    
    internal func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, edge: Edge)
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
    
    internal func addVertice(vertice: VerticeProtocol)
    {
        vertices[vertice.vId!] = vertice
    }
}
