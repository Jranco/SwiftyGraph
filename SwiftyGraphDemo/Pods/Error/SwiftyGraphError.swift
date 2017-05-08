//
//  SwiftyGraphError.swift
//  Pods
//
//  Created by Thomas Segkoulis on 07/05/2017.
//
//

import Foundation

enum SwiftyGraphError: Error {
    
    case Unknown
    case UnknownVertice
    
    var localizedDescription: String {
        switch self {
        case .Unknown:
            return "Unknown error occurred"
        case .UnknownVertice:
            return "Unknown vertice"
        }
    }
}
