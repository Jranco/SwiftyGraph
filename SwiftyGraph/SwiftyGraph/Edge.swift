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
    case weightedUndirected
    case unweightedUndirected
    case weightedDirected
    case unweightedDirected
}

public extension Edge
{
    var direction: CategoryDirection
    {
        switch self
        {
            case .weightedUndirected  : return .undirected
            case .weightedDirected    : return .directed
            case .unweightedDirected  : return .directed
            case .unweightedUndirected: return .undirected
            default : break
        }
    }
    
    // set init giving direction & weight params
}

//enum Edge
//{

//    public init(stringLiteral value: String) {
//        let size = CGSizeFromString(value)
//        self.init(width: size.width, height: size.height)
//    }
//}

