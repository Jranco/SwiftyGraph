//
//  GraphWeighted.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public class GraphWeighted: GraphBase, GraphWeightedProtocol
{
    public required init(direction: DirectionType)
    {
        super.init(direction: direction)
    }
}
