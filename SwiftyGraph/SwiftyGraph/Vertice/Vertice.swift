//
//  VerticeDefault.swift
//  Pods
//
//  Created by Thomas Segkoulis on 18/12/16.
//
//

import Foundation

public enum Vertice
{
    case typeDefault(id: String)
    case typeCustom(id: String, metaData: VerticeMetaData)
}

extension Vertice: VerticeProtocol
{
    public var identifier: String?{
        
        switch self {
            case .typeDefault(let id):
                return id
            case .typeCustom(let id, _):
                return id
        }
    }
}
