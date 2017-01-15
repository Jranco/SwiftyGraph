//
//  BaseGraph.swift
//  SwiftyGraph
//
//  Created by Thomas Segkoulis on 14/01/17.
//  Copyright © 2017 Thomas Segkoulis. All rights reserved.
//

import Foundation

public class GraphBase: GraphProtocol
{
    public internal(set) var adjacency: [String: [String:EdgeProtocol]] = [:]
    public internal(set) var vertices: [String: VerticeProtocol] = [:]
    public internal(set) var direction: DirectionType = .directed
    
    required public init(direction: DirectionType)
    {
        self.direction = direction
    }
    
    public func existsEdge(from verticeA: VerticeProtocol, to verticeB: VerticeProtocol) -> Bool
    {
        if (adjacency[verticeA.identifier!]?[verticeB.identifier!] != nil)
        {
            return true
        }
        
        var existsEdge: Bool = false
        
        switch self.direction
        {
            case .directed:
         
                if ((adjacency[verticeA.identifier!]?[verticeB.identifier!] != nil))
                {
                    existsEdge = true
                }
                else
                {
                    existsEdge = false
                }
                
            break
            
            case .undirected:
            
                if ((adjacency[verticeA.identifier!]?[verticeB.identifier!] != nil) && (adjacency[verticeB.identifier!]?[verticeA.identifier!] != nil))
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
}
