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
    associatedtype VerticeType: Hashable, Comparable
    
    // MARK: - Properties -

    var adjacency: [VerticeType: [VerticeType:EdgeProtocol]] {set get}
    var verticeDictionary: [VerticeType: VerticeType] {set get}
    var verticeArray: [VerticeType] {get}
    var direction: DirectionType {set get}
    
    // MARK: - Init method -

    init(direction: DirectionType)
    
    // MARK: - Functions with default implementation -

    func addEdge(verticeA: VerticeType, verticeB: VerticeType, direction: DirectionType, weight: Weight<Any>)
    func addEdge(verticeA: VerticeType, verticeB: VerticeType, direction: DirectionType)
    func addEdge(verticeA: VerticeType, verticeB: VerticeType, edge: Edge)
    func addVertice(vertice: VerticeType)
    func addVertices(vertices: [VerticeType])

    // MARK: - Functions to be implemented by class conforming to this protocol -
    
    func existsEdge(from verticeA: VerticeType,to  verticeB: VerticeType) -> Bool
    func existsVertice(vertice: VerticeType) -> Bool
    
    // MARK: - Adjacency -
    
    // MARK: - Path -
}

// MARK: - GraphProtocol Extension -

extension GraphProtocol
{
    // MARK: - Add Edges & Vertices -
    
    func addEdge(verticeA: VerticeType, verticeB: VerticeType, direction: DirectionType, weight: Weight<Any>)
    {
        let edge = Edge.weighted(direction, weight)
        
        addEdge(verticeA: verticeA, verticeB: verticeB, edge: edge)
        
        if(direction == .undirected && adjacency[verticeB]?[verticeA] == nil)
        {
            addEdge(verticeA: verticeB, verticeB: verticeA, direction: direction, weight: weight)
        }
    }
    
    func addEdge(verticeA: VerticeType, verticeB: VerticeType, direction: DirectionType)
    {
        let edge = Edge.unweighted(direction)
        
        addEdge(verticeA: verticeA, verticeB: verticeB, edge: edge)
        
        if(direction == .undirected && adjacency[verticeB]?[verticeA] == nil)
        {
            addEdge(verticeA: verticeB, verticeB: verticeA, direction: direction)
        }
    }
    
    func addEdge(verticeA: VerticeType, verticeB: VerticeType, edge: Edge)
    {
        // Add edge
        var nearbyDictionary: [VerticeType: EdgeProtocol] = [:]
        
        if(adjacency[verticeA] != nil)
        {
            nearbyDictionary = adjacency[verticeA]!
            
        }
        
        nearbyDictionary[verticeB]  = edge
        adjacency[verticeA]          = nearbyDictionary
    }
}

