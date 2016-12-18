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
    case wDefault(value: Int)
    case wCustom(value: Int, body: WeightProtocol)
}

extension Weight: WeightProtocol
{
    public var value: Int?{
        
        switch self {
        case .wDefault(let value):
            return value
        case .wCustom(let value, let body):
            return value
        }
    }
}
