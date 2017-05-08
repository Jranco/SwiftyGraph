//
//  BaseGraph.swift
//  SwiftyGraph
//
//  Created by Thomas Segkoulis on 14/01/17.
//  Copyright © 2017 Thomas Segkoulis. All rights reserved.
//

import Foundation

public class GraphBase<VerticeType>: GraphProtocol where VerticeType: Hashable, VerticeType: Comparable
{
    public internal(set) var adjacency: [VerticeType: [VerticeType:EdgeProtocol]] = [:]
    public internal(set) var verticeDictionary: [VerticeType: VerticeType] = [:]
    public var verticeArray: [VerticeType] {

        get {

            var vertices: [VerticeType] = []

            for (_, vertice) in verticeDictionary
            {
                vertices.append(vertice)
            }
            
            return vertices
        }
    }

    public internal(set) var direction: DirectionType = .directed
    
    required public init(direction: DirectionType)
    {
        self.direction = direction
    }
    
    public func addVertice(vertice: VerticeType)
    {
        verticeDictionary[vertice] = vertice
    }
    
    public func addVertices(vertices: [VerticeType])
    {
        for vertice in vertices
        {
            addVertice(vertice: vertice)
        }
    }
    
    public func existsEdge(from verticeA: VerticeType, to verticeB: VerticeType) -> Bool
    {
        if (adjacency[verticeA]?[verticeB] != nil)
        {
            return true
        }
        
        var existsEdge: Bool = false
        
        switch self.direction
        {
            case .directed:
         
                if ((adjacency[verticeA]?[verticeB] != nil))
                {
                    existsEdge = true
                }
                else
                {
                    existsEdge = false
                }
                
            break
            
            case .undirected:
            
                if ((adjacency[verticeA]?[verticeB] != nil) && (adjacency[verticeB]?[verticeA] != nil))
                {
                    existsEdge = true
                }
                else
                {
                    existsEdge = false
                }

            break
        }
   
        return existsEdge
    }
    
    public func existsVertice(vertice: VerticeType) -> Bool
    {
        if((verticeDictionary[vertice]) != nil)
        {
            return true
        }
        
        return false
    }
}
