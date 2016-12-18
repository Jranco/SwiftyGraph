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
    case vDefault(id: String)
    case vCustom(id: String, body: VerticeBody)
}

extension Vertice: VerticeProtocol
{
    public var vId: String?{
        
        switch self {
            case .vDefault(let id):
                return id
            case .vCustom(let id, let body):
                return id
        }
    }
}
