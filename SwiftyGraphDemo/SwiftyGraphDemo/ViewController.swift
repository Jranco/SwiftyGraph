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

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let myWeightedGraph = GraphWeighted.init(direction: .undirected)
        
        let vThree = Vertice<Any>.default(id: "three")
        let vOne   = Vertice<Any>.default(id: "one")
        let vTwo   = Vertice<Any>.default(id: "two")
        let vFour  = Vertice<Any>.default(id: "four")
        let vFive  = Vertice<Any>.default(id: "five")
        let vSix   = Vertice<Any>.default(id: "six")
        
            
        myWeightedGraph.addEdge(verticeA: vOne, verticeB: vTwo, weight: Weight.default(value: 7))
        myWeightedGraph.addEdge(verticeA: vOne, verticeB: vThree, weight: Weight.default(value: 9))
        myWeightedGraph.addEdge(verticeA: vOne, verticeB: vSix, weight: Weight.default(value: 14))
        myWeightedGraph.addEdge(verticeA: vSix, verticeB: vThree, weight: Weight.default(value: 2))
        myWeightedGraph.addEdge(verticeA: vSix, verticeB: vFive, weight: Weight.default(value: 9))
        myWeightedGraph.addEdge(verticeA: vThree, verticeB: vFour, weight: Weight.default(value: 11))
        myWeightedGraph.addEdge(verticeA: vTwo, verticeB: vFour, weight: Weight.default(value: 15))
        myWeightedGraph.addEdge(verticeA: vFour, verticeB: vFive, weight: Weight.default(value: 6))

        myWeightedGraph.addEdge(verticeA: vFour, verticeB: vFive, weight: Weight.custom(value: 3, data: vSix))
        
        myWeightedGraph.dijkstra(source: vOne, destination: vFive)
        {
            (distance, path) in
            
            print("distance", distance)
            print("path", path)

        }
        
        let myUnweightedGraph = GraphUnweighted.init(direction: .directed)
        
        let vZeroUW = Vertice<Any>.default(id: "zero")
        let vOneUW = Vertice<Any>.default(id: "one")
        let vTwoUW = Vertice<Any>.default(id: "two")
        
        myUnweightedGraph.addEdge(verticeA: vZeroUW, verticeB: vOneUW)
        myUnweightedGraph.addEdge(verticeA: vTwoUW, verticeB: vOneUW)
        myUnweightedGraph.addEdge(verticeA: vZeroUW, verticeB: vTwoUW)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

