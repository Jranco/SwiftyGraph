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
        
        let myWeightedGraph = GraphWeighted<String>.init(direction: DirectionType.init(direction: .undirected))
        
        myWeightedGraph.addVertices(vertices: ["one", "two", "three", "four", "five", "six"])
        
        myWeightedGraph.addEdge(verticeA: "one", verticeB: "two", weight: Weight.default(value: 7))
        myWeightedGraph.addEdge(verticeA: "one", verticeB: "three", weight: Weight.default(value: 9))
        myWeightedGraph.addEdge(verticeA: "one", verticeB: "six", weight: Weight.default(value: 14))
        myWeightedGraph.addEdge(verticeA: "six", verticeB: "three", weight: Weight.default(value: 2))
        myWeightedGraph.addEdge(verticeA: "six", verticeB: "five", weight: Weight.default(value: 9))
        myWeightedGraph.addEdge(verticeA: "three", verticeB: "four", weight: Weight.default(value: 11))
        myWeightedGraph.addEdge(verticeA: "two", verticeB: "four", weight: Weight.default(value: 15))
        myWeightedGraph.addEdge(verticeA: "four", verticeB: "five", weight: Weight.default(value: 6))

        myWeightedGraph.addEdge(verticeA: "four", verticeB: "five", weight: Weight.custom(value: 3, data: "six"))
        
        myWeightedGraph.dijkstra(source: "one", destination: "five")
        {
            (distance, path) in
            
            print("distance", distance)
            print("path", path)

        }
        
        let myUnweightedGraph = GraphUnweighted<String>.init(direction: DirectionType.init(direction: .directed))
        
        myUnweightedGraph.addEdge(verticeA: "zero", verticeB: "one")
        myUnweightedGraph.addEdge(verticeA: "two", verticeB: "one")
        myUnweightedGraph.addEdge(verticeA: "zero", verticeB: "two")
        
        let adjZero = myUnweightedGraph.adjacency["zero"]
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

