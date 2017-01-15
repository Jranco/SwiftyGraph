//
//  GraphWeightedProtocol.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public protocol GraphWeightedProtocol
{
    func addEdge(verticeA: VerticeProtocol, verticeB: VerticeProtocol, weight: Weight<Any>)
}


