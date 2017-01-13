//
//  GraphWeighted.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public class GraphWeighted: GraphWeightedProtocol
{
    var adjDictionary: [String: [String:EdgeProtocol]] = [:]
    var vertices: [String: VerticeProtocol] = [:]
    public internal(set) var direction: DirectionType = .directed
   
    
    required public init(direction: DirectionType)
    {
        self.direction = direction
    }
}

extension GraphWeighted
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
    
    public func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, weight: Weight<Any>)
    {
        (self as GraphWeightedProtocol).addEdge(origin: origin, destination: destination, weight: weight)
    }
}
