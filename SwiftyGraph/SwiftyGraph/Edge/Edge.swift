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
    case weighted(DirectionType, Weight<Any>)
    case unweighted(DirectionType)
}

extension Edge: EdgeProtocol
{
    public var weight: Weight<Any>?{
    
        switch self {
            case .weighted( _, let weight):
                return weight
            case .unweighted( _):
                return nil
        }
    }
}
