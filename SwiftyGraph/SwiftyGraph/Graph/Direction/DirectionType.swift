//
//  Direction.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public enum DirectionType
{
    case directed
    case undirected
    
    public init()
    {
        self = .directed
    }
    
    public init(direction: DirectionType)
    {
        self = direction
    }
}
