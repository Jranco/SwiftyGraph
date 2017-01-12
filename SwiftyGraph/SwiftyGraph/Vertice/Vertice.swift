//
//  VerticeDefault.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public enum Vertice<T>
{
    case `default`(id: String)
    case custom(id: String, data: T)
}

extension Vertice: VerticeProtocol
{
    public var identifier: String?{
        
        switch self {
            case .`default`(let id):
                return id
            case .custom(let id, _):
                return id
        }
    }
}
