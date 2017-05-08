//
//  Dijkstra.swift
//  SwiftyGraph
//
//  Created by Thomas Segkoulis on 02/01/17.
//  Copyright © 2017 Thomas Segkoulis. All rights reserved.
//


extension GraphWeighted
{
    public func dijkstra(source: VerticeType, destination: VerticeType, completion: (_ distance: Int, _ path: [VerticeType]) -> Void)
    {
        /**
            Unvisited Vertex set
         */
        var unvisitedVertex = Set<VerticeType>()
        
        /**
            Distances from source to Vertex
         */
        var distance: [VerticeType: Int] = [:]

        // Previous vertex
        var prev: [VerticeType: VerticeType] = [:]
        
        /// Add all vertices to the unvisitedVertex Set
        for v in verticeDictionary
        {
            unvisitedVertex.insert(v.value)
        }
        
        /// Init source distance to zero
        distance[source] = 0

        while unvisitedVertex.isEmpty == false
        {
            let minDistVertex = vertexWithMinDist(vertexDist: distance, unvisitedVertex: unvisitedVertex)
            
            unvisitedVertex.remove(minDistVertex)
            
            guard adjacency[minDistVertex] != nil else {
                continue
            }
            
            for (v, edge) in adjacency[minDistVertex]!
            {
                if(distance[v] == nil)
                {
                    let alt = distance[minDistVertex]! + (edge.weight?.value)!

                    distance[v] = alt
                    prev[v] = verticeDictionary[minDistVertex]
                }
                else
                {
                    let alt = distance[minDistVertex]! + (edge.weight?.value)!
                    
                    if(alt < distance[v]!)
                    {
                        distance[v] = alt
                        prev[v] = verticeDictionary[minDistVertex]
                    }
                }
            }
        }
        
        var path: [VerticeType] = []
        
        var currentVertice = destination
        
        while currentVertice != source
        {
            path.insert(currentVertice, at: 0)
            currentVertice = prev[currentVertice]!
        }
        
        path.insert(source, at: 0)

        completion(distance[destination]!, path)
        
    }
    
    func vertexWithMinDist(vertexDist: [VerticeType: Int], unvisitedVertex: Set<VerticeType>) -> VerticeType
    {
        var vertexDicNew = vertexDist
        
        for vDist in vertexDicNew
        {
            if(unvisitedVertex.contains(vDist.key) == false)
            {
                vertexDicNew.removeValue(forKey: vDist.key)
            }
        }
        
        var minDistVertex = vertexDicNew.first

        
        for vertex in vertexDicNew
        {
            if(unvisitedVertex.contains(vertex.key) == false)
            {
                continue
            }
            
            if(vertex.value < (minDistVertex?.value)!)
            {
                minDistVertex = vertex
            }
        }
        
        return (minDistVertex?.key)!
    }
    
}
