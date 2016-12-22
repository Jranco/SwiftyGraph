//
//  GraphUnweighted.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public class GraphUnweighted: GraphBase, GraphUnweightedProtocol
{
    public required init(direction: DirectionType)
    {
        super.init(direction: direction)
    }
}
