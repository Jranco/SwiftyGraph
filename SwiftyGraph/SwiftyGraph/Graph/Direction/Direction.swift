//
//  Direction.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public enum Direction
{
    case directed
    case undirected
    
    public init()
    {
        self = .directed
    }
    
    public init(direction: Direction)
    {
        self = direction
    }
}
