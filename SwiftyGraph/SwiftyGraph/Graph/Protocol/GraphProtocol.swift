//
//  Graph.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

protocol GraphProtocol
{
    var adjDictionary: [String: [String:EdgeProtocol]] {get}
    var vertices: [String: VerticeProtocol] {get}
    var direction: DirectionType {set get}
    
    init(direction: DirectionType)
    
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType, weight: Weight)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, direction: DirectionType)
    func addEdge(origin: VerticeProtocol, destination: VerticeProtocol, edge: Edge)
    func addVertice(vertice: VerticeProtocol)
}

extension GraphProtocol
{

}

