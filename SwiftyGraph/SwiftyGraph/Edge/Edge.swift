//
//  Edge.swift
//  Pods
//
//  Created by Thomas Segkoulis on 14/12/16.
//
//

import Foundation

public enum Edge
{
    case weighted(DirectionType, Weight)
    case unweighted(DirectionType)
}

extension Edge: EdgeProtocol
{
    public var weight: Weight?{
    
        switch self {
            case .weighted(let direction, let weight):
                return weight
            case .unweighted(let direction):
                return nil
        }
    }
}
