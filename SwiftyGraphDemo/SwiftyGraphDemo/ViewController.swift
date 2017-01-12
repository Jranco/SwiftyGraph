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
        
        let vThree = Vertice<String>.default(id: "three")
        let vOne   = Vertice<Any>.default(id: "one")
        let vTwo   = Vertice<Any>.default(id: "two")
        let vFour  = Vertice<Any>.default(id: "four")
        let vFive  = Vertice<Any>.default(id: "five")
        let vSix   = Vertice<Any>.default(id: "six")
        
        myWeightedGraph.addEdge(origin: vOne, destination: vTwo, weight: Weight.default(value: 7))
        myWeightedGraph.addEdge(origin: vOne, destination: vThree, weight: Weight.default(value: 9))
        myWeightedGraph.addEdge(origin: vOne, destination: vSix, weight: Weight.default(value: 14))
        myWeightedGraph.addEdge(origin: vSix, destination: vThree, weight: Weight.default(value: 2))
        myWeightedGraph.addEdge(origin: vSix, destination: vFive, weight: Weight.default(value: 9))
        myWeightedGraph.addEdge(origin: vThree, destination: vFour, weight: Weight.default(value: 11))
        myWeightedGraph.addEdge(origin: vTwo, destination: vFour, weight: Weight.default(value: 15))
        myWeightedGraph.addEdge(origin: vFour, destination: vFive, weight: Weight.default(value: 6))

        
        myWeightedGraph.printVertices()
        
        myWeightedGraph.printGraph()
        
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
        
        myUnweightedGraph.addEdge(origin: vZeroUW, destination: vOneUW)
        myUnweightedGraph.addEdge(origin: vTwoUW, destination: vOneUW)
        myUnweightedGraph.addEdge(origin: vZeroUW, destination: vTwoUW)
        
        myUnweightedGraph.printVertices()
        
        myUnweightedGraph.printGraph()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

