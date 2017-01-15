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
    // MARK: - Properties -

    var adjacency: [String: [String:EdgeProtocol]] {set get}
    var verticeDictionary: [String: VerticeProtocol] {set get}
    var verticeArray: [VerticeProtocol] {get}
    var direction: DirectionType {set get}
    
    // MARK: - Init method -

    init(direction: DirectionType)
    
    // MARK: - Functions with default implementation -

    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType, weight: Weight<Any>)
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType)
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, edge: Edge)
    func addVertice(vertice: VerticeProtocol)
    
    // MARK: - Functions to be implemented by class conforming to this protocol -
    
    func existsEdge(from verticeA: VerticeProtocol,to  verticeB: VerticeProtocol) -> Bool
    func existsVertice(vertice: VerticeProtocol) -> Bool
    
    // MARK: - Adjacency -
    
    // MARK: - Path -
}

// MARK: - GraphProtocol Extension -

extension GraphProtocol
{
    // MARK: - Add Edges & Vertices -
    
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType, weight: Weight<Any>)
    {
        let edge = Edge.weighted(direction, weight)
        
        addEdge(verticeA: verticeA, verticeB: verticeB, edge: edge)
        
        if(direction == .undirected && adjacency[verticeB.identifier!]?[verticeA.identifier!] == nil)
        {
            addEdge(verticeA: verticeB, verticeB: verticeA, direction: direction, weight: weight)
        }
    }
    
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, direction: DirectionType)
    {
        let edge = Edge.unweighted(direction)
        
        addEdge(verticeA: verticeA, verticeB: verticeB, edge: edge)
        
        if(direction == .undirected && adjacency[verticeB.identifier!]?[verticeA.identifier!] == nil)
        {
            addEdge(verticeA: verticeB, verticeB: verticeA, direction: direction)
        }
    }
    
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, edge: Edge)
    {
        // Add edge
        var nearbyDictionary: [String: EdgeProtocol] = [:]
        
        if(adjacency[verticeA.identifier!] != nil)
        {
            nearbyDictionary = adjacency[verticeA.identifier!]!
            
        }
        
        nearbyDictionary[verticeB.identifier!]  = edge
        adjacency[verticeA.identifier!]          = nearbyDictionary
        
        // Add vertice
        self.addVertice(vertice: verticeA)
        self.addVertice(vertice: verticeB)
        
    }
    
    func addVertice(vertice: VerticeProtocol)
    {
        verticeDictionary[vertice.identifier!] = vertice
    }

}

