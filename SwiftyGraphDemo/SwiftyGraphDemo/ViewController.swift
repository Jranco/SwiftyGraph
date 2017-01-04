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
        
        let vThree = Vertice.typeDefault(id: "three")
        let vOne   = Vertice.typeDefault(id: "one")
        let vTwo   = Vertice.typeDefault(id: "two")
        let vFour  = Vertice.typeDefault(id: "four")
        let vFive  = Vertice.typeDefault(id: "five")
        let vSix   = Vertice.typeDefault(id: "six")
        
        myWeightedGraph.addEdge(origin: vOne, destination: vTwo, weight: Weight.weightDefault(value: 7))
        myWeightedGraph.addEdge(origin: vOne, destination: vThree, weight: Weight.weightDefault(value: 9))
        myWeightedGraph.addEdge(origin: vOne, destination: vSix, weight: Weight.weightDefault(value: 14))
        myWeightedGraph.addEdge(origin: vSix, destination: vThree, weight: Weight.weightDefault(value: 2))
        myWeightedGraph.addEdge(origin: vSix, destination: vFive, weight: Weight.weightDefault(value: 9))
        myWeightedGraph.addEdge(origin: vThree, destination: vFour, weight: Weight.weightDefault(value: 11))
        myWeightedGraph.addEdge(origin: vTwo, destination: vFour, weight: Weight.weightDefault(value: 15))
        myWeightedGraph.addEdge(origin: vFour, destination: vFive, weight: Weight.weightDefault(value: 6))

        
        myWeightedGraph.printVertices()
        
        myWeightedGraph.printGraph()
        
        myWeightedGraph.dijkstra(source: vOne, destination: vFive)
        {
            (distance, path) in
            
            print("distance", distance)
            print("path", path)

        }
        
        let myUnweightedGraph = GraphUnweighted.init(direction: .directed)
        
        let vZeroUW = Vertice.typeDefault(id: "zero")
        let vOneUW = Vertice.typeDefault(id: "one")
        let vTwoUW = Vertice.typeDefault(id: "two")
        
        myUnweightedGraph.addEdge(origin: vZeroUW, destination: vOneUW)
        myUnweightedGraph.addEdge(origin: vTwoUW, destination: vOneUW)
        myUnweightedGraph.addEdge(origin: vZeroUW, destination: vTwoUW)
        
        myUnweightedGraph.printVertices()
        
        myUnweightedGraph.printGraph()

//
//        let myUnweightedGraph = GraphUnweighted.init(direction: .directed)
//        
//        let uvZero = Vertice.vDefault(id: "zero")
//        let uvOne  = Vertice.vDefault(id: "one")
//        let uvTwo  = Vertice.vDefault(id: "two")
//
//        myUnweightedGraph.addEdge(origin: uvZero, destination: uvTwo)
//
//        myUnweightedGraph.printGraph()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

