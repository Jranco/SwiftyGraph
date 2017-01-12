//
//  Weight.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public enum Weight<T>
{
    case `default`(value: Int)
    case custom(value: Int, data: T)
}

extension Weight: WeightProtocol
{
    public var value: Int?{
        
        switch self {
        case .default(let value):
            return value
        case .custom(let value, _):
            return value
        }
    }
}
