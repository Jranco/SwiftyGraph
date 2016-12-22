//
//  Weight.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public enum Weight
{
    case weightDefault(value: Int)
    case weightCustom(value: Int, body: WeightProtocol)
}

extension Weight: WeightProtocol
{
    public var value: Int?{
        
        switch self {
        case .weightDefault(let value):
            return value
        case .weightCustom(let value, let body):
            return value
        }
    }
}
