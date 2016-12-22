//
//  SwiftyGraph.swift
//  Pods
//
//  Created by Thomas Segkoulis on 20/12/16.
//
//

import Foundation

public enum SwiftyGraphType
{
    case graph(WeightType, DirectionType)
//    case graph(Direction)

}

public struct SwiftyGraph
{
    public func graph(with type: SwiftyGraphType) -> AnyObject
    {
        switch type
        {
        case .graph(let weight, let direction):
            
            if(weight == .unweighted)
            {
                let unweightedGraph = GraphUnweighted.init(direction: direction)
                
                return unweightedGraph
            }
            else
            {
                let weightedGraph = GraphWeighted.init(direction: direction)
                
                return weightedGraph
            }
        }
    }
}

//extension SwiftyGraph
//{
//    public var weight: Weight?{
//        
//        switch self {
//        case .weighted(let direction, let weight):
//            return weight
//        case .unweighted(let direction):
//            return nil
//        }
//    }
//}

