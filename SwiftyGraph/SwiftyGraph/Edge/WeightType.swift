//
//  WeightType.swift
//  Pods
//
//  Created by Thomas Segkoulis on 22/12/16.
//
//

import Foundation

public enum WeightType
{
    case weighted
    case unweighted
    
    public init()
    {
        self = .weighted
    }
    
    public init(weight: WeightType)
    {
        self = weight
    }
}
