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
    
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType, weight: Weight<Any>)
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType)
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, edge: Edge)
    func addVertice(vertice: VerticeProtocol)
}

extension GraphProtocol
{
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType, weight: Weight<Any>)
    {
        let edge = Edge.weighted(direction, weight)
        
        addEdge(verticeA: verticeA, verticeB: verticeB, edge: edge)
        
        if(direction == .undirected && adjDictionary[verticeB.identifier!]?[verticeA.identifier!] == nil)
        {
            addEdge(verticeA: verticeB, verticeB: verticeA, direction: direction, weight: weight)
        }
    }
    
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType)
    {
        let edge = Edge.unweighted(direction)
        
        addEdge(verticeA: verticeA, verticeB: verticeB, edge: edge)
        
        if(direction == .undirected && adjDictionary[verticeB.identifier!]?[verticeA.identifier!] == nil)
        {
            addEdge(verticeA: verticeB, verticeB: verticeA, direction: direction)
        }
    }
    
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, edge: Edge)
    {
        // Add edge
        var nearbyDictionary: [String: EdgeProtocol] = [:]
        
        if(adjDictionary[verticeA.identifier!] != nil)
        {
            nearbyDictionary = adjDictionary[verticeA.identifier!]!
            
        }
        
        nearbyDictionary[verticeB.identifier!]  = edge
        adjDictionary[verticeA.identifier!]          = nearbyDictionary
        
        // Add vertice
        self.addVertice(vertice: verticeA)
        self.addVertice(vertice: verticeB)
        
    }
    
    func addVertice(vertice: VerticeProtocol)
    {
        vertices[vertice.identifier!] = vertice
    }

}

