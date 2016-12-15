//
//  ViewController.swift
//  SwiftyGraphDemo
//
//  Created by Thomas Segkoulis on 12/12/16.
//  Copyright © 2016 Thomas Segkoulis. All rights reserved.
//

import UIKit
import SwiftyGraph

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let edge = Edge.weightedUndirected
        
        print ("direction: ", edge.direction)
        //print ("weight: ", edge.weight)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//enum Edge
//{
//    case weightedUndirected
//    case weightedDirected
//    case unweightedUndirected
//    case unweightedDirected
//}
//
//extension Edge
//{
//    var direction: CategoryDirection
//    {
//        switch self
//        {
//        case .weightedUndirected  : return .undirected
//        case .weightedDirected    : return .directed
//        case .unweightedDirected  : return .directed
//        case .unweightedUndirected: return .undirected
//        default : break
//        }
//    }
//    
//    var weight: CategoryWeight
//    {
//        switch self
//        {
//        case .weightedUndirected  : return .weighted
//        case .weightedDirected    : return .weighted
//        case .unweightedDirected  : return .unweighted
//        case .unweightedUndirected: return .unweighted
//        default : break
//        }
//    }
//}
//
//enum CategoryDirection
//{
//    case directed
//    case undirected
//}
//
//enum CategoryWeight
//{
//    case weighted
//    case unweighted
//}
